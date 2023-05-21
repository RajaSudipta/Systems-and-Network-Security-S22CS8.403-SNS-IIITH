linux_version=`cat /etc/os-release | grep "UBUNTU_CODENAME" | awk -F = '{ print $NF }'`
# echo $linux_version
echo "Hit:1 http://in.archive.ubuntu.com/ubuntu "$linux_version" InRelease"                      
echo "Get:2 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates InRelease [114 kB] "    
echo "Get:3 http://security.ubuntu.com/ubuntu "$linux_version"-security InRelease [114 kB]"      
echo "Get:4 http://in.archive.ubuntu.com/ubuntu "$linux_version"-backports InRelease [108 kB]"
echo "Get:5 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/main amd64 Packages [1,600 kB]"
echo "Get:6 http://security.ubuntu.com/ubuntu "$linux_version"-security/main amd64 Packages [1,265 kB]"
echo "Get:7 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/main i386 Packages [609 kB]"
echo "Get:8 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/main Translation-en [306 kB]"
sleep 2.0
echo "Get:9 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/main amd64 DEP-11 Metadata [279 kB]"
echo "Get:10 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/main amd64 c-n-f Metadata [14.8 kB]"
sleep 0.5
echo "Get:11 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/universe i386 Packages [669 kB]"
echo "Get:12 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/universe amd64 Packages [905 kB]"
echo "Get:13 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/universe Translation-en [201 kB]"
sleep 1.5
echo "Get:14 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/universe amd64 DEP-11 Metadata [391 kB]"
sleep 0.5
echo "Get:15 http://in.archive.ubuntu.com/ubuntu "$linux_version"-updates/multiverse amd64 DEP-11 Metadata [940 B]"
echo "Get:16 http://in.archive.ubuntu.com/ubuntu "$linux_version"-backports/main amd64 DEP-11 Metadata [8,000 B]"
sleep 2.5
echo "Get:17 http://in.archive.ubuntu.com/ubuntu "$linux_version"-backports/universe amd64 DEP-11 Metadata [30.6 kB]"
echo "Get:18 http://in.archive.ubuntu.com/ubuntu "$linux_version"-backports/universe DEP-11 48x48 Icons [13.2 kB]"
echo "Get:19 http://in.archive.ubuntu.com/ubuntu "$linux_version"-backports/universe DEP-11 64x64 Icons [21.6 kB]"
sleep 0.6
echo "Get:20 http://security.ubuntu.com/ubuntu "$linux_version"-security/main i386 Packages [383 kB]"
sleep 0.4
echo "Get:21 http://security.ubuntu.com/ubuntu "$linux_version"-security/main Translation-en [221 kB]"
sleep 0.8
echo "Get:22 http://security.ubuntu.com/ubuntu "$linux_version"-security/main amd64 DEP-11 Metadata [40.6 kB]"
sleep 0.2
echo "Get:23 http://security.ubuntu.com/ubuntu "$linux_version"-security/main amd64 c-n-f Metadata [9,624 B]"
sleep 0.2
echo "Get:24 http://security.ubuntu.com/ubuntu "$linux_version"-security/universe i386 Packages [535 kB]"
sleep 0.8
echo "Get:25 http://security.ubuntu.com/ubuntu "$linux_version"-security/universe amd64 Packages [679 kB]"
sleep 0.6
echo "Get:26 http://security.ubuntu.com/ubuntu "$linux_version"-security/universe Translation-en [116 kB]"
sleep 0.4
echo "Get:27 http://security.ubuntu.com/ubuntu "$linux_version"-security/universe amd64 DEP-11 Metadata [66.3 kB]"
sleep 0.3
echo "Get:28 http://security.ubuntu.com/ubuntu "$linux_version"-security/multiverse amd64 DEP-11 Metadata [2,464 B]"
echo "Fetched 8,708 kB in 12s (744 kB/s)"
sleep 0.7
echo "Reading package lists... Done"
echo -n "1" > /home/$(whoami)/.config/updateMGR/hack_sucess_status