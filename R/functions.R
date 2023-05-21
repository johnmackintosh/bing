read_pics <- function(pic_path = "./img/",
                      pic_pattern = "*.jpg") {
# get the filenames
pics <- dir(path = pic_path,
            pattern =  pic_pattern,
            full.names = TRUE)

# reorder putting "i.jpg" first
pics <- c(pics[3], pics[c(1:2,4:5)])
return(pics)

}



read_vowels <- function(x = "vowels.csv") {
  # read the text file with the vowels we want to paste in
  vowels <- scan(x,
                 what = character(),
                 sep = ",",
                 skip = 1)
  return(vowels)
}



create_captions <- function(x){
  # create a (possibly) new name for Chandler
  res <- paste0("Chandler B",x, "ng")
  return(res)
}


render <- function(img,
                   x,
                   size = 10,
                   text_colour){

  img <- magick::image_annotate(img,
                                x,
                                size = size,
                                gravity = "southwest",
                                color = text_colour)
  return(img)

}


caption_images <- function(img,
                           captions,
                           size = 30,
                           filename = "chandler.png",
                           text_colour) {

  images <- magick::image_read(img)

  images <- render(images,
                   captions,
                   size,
                   text_colour = text_colour
  )
  out <- magick::image_append(images, stack = TRUE)

  magick::image_write(out, path = filename)

}

