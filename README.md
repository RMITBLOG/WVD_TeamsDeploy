# WVD_TeamsDeploy

This is only for use on Windows Vritual Desktop Windows 10 Mulitsession desktop Session Hosts.

The Application completes the following:

1. prepare Windows Virtual Desktop host for MS Teams A/V redirection
2. download all the required components ready for installation
3. Install all the components and MS teams ready for use on the Windows Virtual Desktop Host.

![alt text](https://github.com/RMITBLOG/WVD_TeamsDeploy/blob/master/WVDTEAMSDPL.PNG?raw=true)

How to use the Applicaton:

Run the application as an administrator or it will not work. 


Click Step 1 prepare and download the required components.
Click Install (only) after completing step 1, 
Step 2 Install - install all the required components.

Final point, ensure that you have set the required Custom RDP Properties.

audiocapturemode:i:1 (enables audio capture from the local device and redirects audio applications in the remote session.)
audiomode:i:0 (plays audio on the local computer.)
camerastoredirect:s:* (redirects all cameras.)

https://docs.microsoft.com/en-us/azure/virtual-desktop/teams-on-wvd 

Enjoy.....
