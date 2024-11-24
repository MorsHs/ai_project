FOR PPL WHO USE ANDROID STUDIO LADYBUG REFER TO THIS THREAD FOR FIX:
https://stackoverflow.com/questions/69619829/could-not-resolve-all-files-for-configuration-appandroidjdkimage
THEN ADD THIS TO YOUR android/app/build.gradle
android{
ndkVersion = "25.1.8937393"
.....
}




THE STABLE VERSION FOR ME TO MAKE THIS WORK IS ON ANDROID STUDIO IGUANA
