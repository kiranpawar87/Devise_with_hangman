class Game::HangmanController < ApplicationController

  def start_game          ########################## Start_game ########################
    $count=$count+1
    p $count
    p "in start game"
    @i=0
    @flag=1
    @k=0
    @wins=User.find(current_user.id).wins
    @lose=User.find(current_user.id).lose
    @abc=Category.all
    @arr=Array.new()
    @input=params[:input].upcase()

    if $attempt>0
      if ($cnt<$len)
        if(!@input.blank?)
          while(@i<$len) do
            if($goal[@i]==@input)
              $wordForm[@i]=@input
                @flag=2
                @k=1

            else
              if(@flag!=2)
                @flag=1
              end
            end

            @i=@i+1
          end
          if @k==0
            $wrongattempt=$wrongattempt+" "+ @input
            p $wrongattempt
          end
          if @flag==1
            $attempt=$attempt-1
            $cnt=$cnt+1
            if $attempt<=0
              @flag=0
            end
          end
          @wordFormed=$wordForm.to_s()
          @img="hangman#{$cnt}.gif"
        else
          @wordFormed=$wordForm.to_s()
          @img="hangman#{$cnt}.gif"
          @error=" Can not blank "
        end
        @i=0
        @flag=0
        @completeFlag=0
        while(@i<$wordForm.length)
          if($wordForm[@i]=="_")
            @completeFlag=0
            break
          else
            @completeFlag=1
          end
          @i=@i+1
        end
        @i=0
        if(@completeFlag==1)
          while(@i<$goal.length)
            if $wordForm[@i] == $goal[@i]

              @flag=1
            else
              @flag=0
              break
            # p "...........you loose"
            end
            @i=@i+1
          end
        end

        if(@flag==1)

          @abc=User.find(current_user.id)
          @wins=@abc.wins
          @wins=@wins+1
          @abc.update_attributes(:wins=>@wins)

          @error="You win !!!"
          $attempt=-1
        else

        end
      else
        @error="New Game "
        reset
      end

        if $attempt==0
          @abc=User.find(current_user.id)
          @lose=@abc.lose
          @lose=@lose+1
          @abc.update_attributes(:lose=>@lose)
          @error="You Hanged !!!! Word := #{$goal} "


        end

    else
      @error=""

    end
    respond_to do |format|
      @abc=Category.all
      # format.html{render "users/user_page"}
      format.js
    end

  end

  def reset             ########################## reset ########################

    p "in reset"
  $count=0
    $wordForm=Array.new
    $wrongattempt=""
    @error=""
    $wrongattempt=" "

    @i=0
    @cnt=0

    $attempt=6

    while(@i<$len)
      $wordForm[@i]="_"
      @i=@i+1
    end

    @wordFormed=$wordForm.to_s()

    $cnt=0

  end

  def category            ##########################Category########################

    p "in category"

    @i=0

    @id=params[:id]
    $id=@id

    @ran=Random.rand(2...9)

    @selected_cat=Category.find(@id)

    $selected_cat=@selected_cat[:cname]

    $row=SubCategory.where(:category_id=>@id)

    $goal=$row[@ran].sub_name.upcase

    $len=$goal.length

    reset

    $attempt=6

    respond_to do |format|

      if !@squence.nil?

        @abc=Category.all
        format.html{render"/users/user_page"}
        format.js
      else
        format.html{render :action=>"users/admin_page "}
        format.js
       end
  end
  end

  def new_game              ########################## new_game #######################

    @id=$id
    p @id

    @ran=Random.rand(2...9)

    @selected_cat=Category.find(@id)

    $selected_cat=@selected_cat[:cname]

    $row=SubCategory.where(:category_id=>@id)

    $goal=$row[@ran].sub_name.upcase

    $len=$goal.length

    reset

    $attempt=6

  end



def admin_play

  # render"/users/user_page"

  redirect_to "/users/user_page"
end
  end