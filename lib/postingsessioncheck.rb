# some notes on more thorough session handling 
#Posting session check
class Postingsessioncheck
   
  if session[:initial_time_post].nil?
    session[:initial_time_post] = Time.now.to_f
  end

  if session[:time_post].nil?
    session[:time_post] = session[:initial_time_post]
  end

  if session[:post_count].nil?
    session[:post_count] = 0
  end 

  def sessiongo
 
    posttimecompare = (Time.now.to_f) - (session[:time_post])
    session[:post_count] = session[:post_count].to_i + 1

    if posttimecompare>20 && session[:post_count]<50
      sessiongo = 1
    end

  end

end
