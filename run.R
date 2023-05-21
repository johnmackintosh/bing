
# This is a helper script to run the pipeline.
# Choose how to execute the pipeline below.
# See https://books.ropensci.org/targets/hpc.html
# to learn about your options.

viz_option <- FALSE # plot targets only, or see all functions and objects?
# try changing to TRUE to see the difference


targets::tar_manifest() #|> View()
# view the manifest in more detail by uncommenting above


targets::tar_visnetwork(targets_only = viz_option)
targets::tar_make()



# view the network now - should all be up to date
targets::tar_visnetwork(targets_only = viz_option)


# Note the new "_targets" folder that has appeared
# What's in there then?
dir("_targets") # top level folders
dir("_targets", recursive = TRUE) # see whats inside the subfolders

# note the difference between tar_read and tar_load
targets::tar_read(captions) # where does captions appear in RStudio?
targets::tar_load(captions) # where is it now?

# OPTIONAL
# delete the image
file.remove("chandler.png")
targets::tar_visnetwork(targets_only = viz_option)

# You can now re-run the above steps
# E.G. just run tar_make(), or run through all steps from tar_manifest()
# It's a good idea to re-run from tar_manifest() if you update any functions/ inputs

# Or burn it down :
# targets::tar_destroy("all") # this removes the "_targets" folder completely
# say 'yes' if asked to confirm

