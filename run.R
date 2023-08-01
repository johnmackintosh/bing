
# This is a helper script to run the pipeline.
# Choose how to execute the pipeline below.
# See https://books.ropensci.org/targets/hpc.html
# to learn about your options.


targets::tar_manifest() #|> View()
# view the manifest in more detail by uncommenting above

viz_option <- FALSE # plot targets only, or see all functions and objects?
targets::tar_visnetwork(targets_only = viz_option) # what does TRUE do?
# click on an individual component on the diagram - what happens?


# create list of files to compare (you don't need this for your projects)
originals <- dir()

# run the pipeline
targets::tar_make()


# view the network now - should all be up to date
targets::tar_visnetwork(targets_only = viz_option)

# what's new
revised <- dir()
revised[!(revised  %in% originals)]

# read the image
magick::image_read("chandler.png")
# forget you saw that

# Note the new "_targets" folder that has appeared
# What's in there?

dir("_targets") # top level folders
dir("_targets", recursive = TRUE) # see what's inside the subfolders

# note the difference between tar_read and tar_load
targets::tar_read(captions) # where does captions appear in RStudio?
targets::tar_load(captions) # where is it now?

# OPTIONAL
# delete the image
file.remove("chandler.png")
targets::tar_visnetwork(targets_only = viz_option)

# You can now re-run the above steps
# E.G. just run tar_make(), or run through all steps from tar_manifest()
# It's a good idea to re-run from tar_manifest() if you update any functions/inputs

# You can invalidate a target to ensure it gets refreshed on next run
targets::tar_invalidate("captions")

# see also tar_delete(), tar_prune and tar_destroy

# Or burn it down :
targets::tar_destroy("all")
# this removes the "_targets" folder completely
# say 'yes' if asked to confirm

