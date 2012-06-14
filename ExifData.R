# Extracting EXIF data from a photo
# It should be possible to extract EXIF data with the following package, however I have failed
# http://cran.r-project.org/web/packages/adimpro/adimpro.pdf

# Instead using a hack (via a system call) to grab the output from ExifTool

cat("Individuals Photo Files\n")
for (i in 1:length(individual.photos.file)) {
  ExifData <- fromJSON(paste(system(paste("/usr/bin/exiftool -j ",individual.photos.file[i]),intern=T), collapse=""))[[1]]
  cat(ExifData$FileName," (", ExifData$FileSize,")\n",sep="")
  if (!is.null(ExifData$PrimaryPlatform)) {
    cat("Photo Primary Platform: ", ExifData$PrimaryPlatform, "\n", seq="")
  }
}

rm(i)

# Some of the fields that may be found

# BitsPerSample
# BlueMatrixColumn
# BlueTRC
# ChromaticAdaptation
# CMMFlags
# ColorComponents
# ColorSpaceData
# Comment
# ConnectionSpaceIlluminant
# DeviceAttributes
# DeviceManufacturer
# DeviceModel
# DeviceModelDesc
# Directory
# EncodingProcess
# ExifToolVersion
# FileModifyDate
# FileName
# FilePermissions
# FileSize
# FileType
# GreenMatrixColumn
# GreenTRC
# ImageHeight
# ImageSize
# ImageWidth
# JFIFVersion
# Luminance
# MeasurementBacking
# MeasurementFlare
# MeasurementGeometry
# MeasurementIlluminant
# MeasurementObserver
# MediaBlackPoint
# MediaWhitePoint
# MIMEType
# PrimaryPlatform
# ProfileClass
# ProfileCMMType
# ProfileConnectionSpace
# ProfileCopyright
# ProfileCreator
# ProfileDateTime
# ProfileDescription
# ProfileFileSignature
# ProfileID
# ProfileVersion
# RedMatrixColumn
# RedTRC
# RenderingIntent
# ResolutionUnit
# SourceFile
# Technology
# ViewingCondDesc
# XResolution
# YCbCrSubSampling
# YResolution
