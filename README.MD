# Here you will find a collection of bash scripts I have written, use them at your own risk.

The code in this repo is not intended to provide an example of good or safe coding practices; in fact some of the code will be downright UNSAFE.

**GL;HF;DD** - *Good Luck, Have Fun, and Don't DD your disk and blame it on me.* 🍻


**grab.sh** - This poorly written script will attempt to grab a banner from the provided host:port. It's just a wrapper for `nc`, which I'd call directly... I just wrote this script for LOLs. The only improvement it has is that it'll attempt to grab an IP address if a hostname is supplied - `nc` only accepts IP addresses. *Note*: this script makes use of one of my favorite "lazy RegExes" that I like to call *ipish* - `[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}` - because it's the easiest way to match an IP like string, but it does not attempt to make sure the IP address is valid. Instead *ipish* simply tires to match `0.0.0.0` .. `999.999.999.999`.
