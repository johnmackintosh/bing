# Created by use_targets().
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)

# Set target options:
tar_option_set(
  packages = c("magick"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)


# Run the R scripts in the R/ folder with your custom functions:
tar_source()


list(
  tar_target(
    name = vowel_source,
    command = "vowels.csv",
    format = "file" # this designates that this target is a file, rather than data
  ),
  tar_target(
    name = vowels,
    command = read_vowels(vowel_source) # read in the file designated by vowel_source, in
    # this case, "vowels.csv"
  ),

  tar_target(
    name = captions,
    command = create_captions(vowels)), # pass the vowels data to the create_captions function

  tar_target(
    name = pics,
    command = read_pics(pic_path = "./img/",
                        pic_pattern = "*.jpg")
  ), # read in the images with the magick package


tar_target(
  name = final_image,
  command = caption_images(img = pics,
                           captions = captions,
                           size = 35, # try changing this value
                           text_colour = "white"), # try changing this value
  format = "file")
# create the final image using the images and pics above
)
