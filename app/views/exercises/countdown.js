         $(document).ready(function() {
           // Get the list of video elements
           var videos = $('[id^="video"]');
           var countdownContainer = $('#countdown-container');
           var countdownSpan = $('#countdown-span');
           var completionBtn = $('#completion-btn');
         
           // Initialize index and play the first video
           var currentIndex = 0;
           videos[currentIndex].play();
         
           // Attach an event listener for the "ended" event
           videos.on("ended", function() {
             // Hide the current video
             $(videos[currentIndex]).hide();
         
             // Increment the index or show completion button if at the end
             currentIndex = (currentIndex + 1) % videos.length;
         
             if (currentIndex === 0) {
               // Show the completion button after the last video
               completionBtn.show();
         
               // Hide the countdown container
               countdownContainer.hide();
             } else {
               // Show the next video
               $(videos[currentIndex]).show();
         
               // Show the countdown container
               countdownContainer.show();
         
               // Start the countdown after 10 seconds
               var countdown = 1;
               countdownSpan.text(countdown);
         
               var countdownInterval = setInterval(function() {
                 countdown--;
                 countdownSpan.text(countdown);
         
                 if (countdown <= 0) {
                   // Hide the countdown container
                   countdownContainer.hide();
         
                   // Play the next video
                   videos[currentIndex].play();
         
                   // Clear the countdown interval
                   clearInterval(countdownInterval);
                 }
               }, 700);
             }
           });
         });
      
