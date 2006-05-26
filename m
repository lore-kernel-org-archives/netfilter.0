From: martinh@ix.netcom.com
Subject: Re: Linux box to D-Link router/bridge/access connection question
Date: Thu, 25 May 2006 23:14:05 -0400 (GMT-04:00)
Message-ID: <16131225.1148613246146.JavaMail.root@elwamui-lapwing.atl.sa.earthlink.net>
Reply-To: martinh@ix.netcom.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jesse Gordon <jesseg@nikola.com>
Cc: martinh@ix.netcom.com, netfilter@lists.netfilter.org

My answers to your questions below...

-----Original Message-----
>From: Jesse Gordon <jesseg@nikola.com>
>Sent: May 25, 2006 10:56 PM
>To: Martin <martinh@ix.netcom.com>
>Cc: netfilter@lists.netfilter.org
>Subject: Re: Linux box to D-Link router/bridge/access connection question
>
>> But I would also like to be able to communicate with my wireless laptop to 
>> my Linux boxes and visa-versa.
>
What sort of communication between wireless laptop and linux boxes did you 
have in mind?

Ans: I like to be able to send and receive files. I would also want to from my WinXP laptop to print to my linux box printer.

>
Is the laptop windows, and can it surf the net using the highspeed dlink?

Ans: Windows XP using wireless (no network cable) is browsing the Internet using highspeed dlink.

>
>If the above line is true, then you should be able to ping between the 
>wireless laptop and the linux boxes already, as well as use http or ftp to 
>transfer files between them.
>
>Of course, the laptop will also have to have an IP that is within the 
>netrange of the linux boxes. If your linux boxes are 192.168.0.x/255.255.0.0 
>then your laptop should also be that.

Ans: Can I change my linux box netmask to 255.255.0.0, will that allow my laptop to communicate with my linux boxes? - they are 192.168.1.2 & 50.

>
>Also, if it's not already installed, you can install and set up 'samba' 
>which will provide windows shared folders server and clients.
>
>You can also email files from one computer to the other if all else fails 
>[grin]
>
>-Jesse
>
>----- Original Message ----- 
>From: "Martin" <martinh@ix.netcom.com>
>To: "Jesse Gordon" <jesseg@nikola.com>
>Cc: <netfilter@lists.netfilter.org>
>Sent: Thursday, May 25, 2006 7:45 PM
>Subject: Re: Linux box to D-Link router/bridge/access connection question
>
>
>> Thank you very much. I was able to communicate to the D-Link from my Linux 
>> boxes and get out to the high speed Internet from my Linux boxes.
>>
>> BTW, my Linux boxes are running RH9.
>>
>> But I would also like to be able to communicate with my wireless laptop to 
>> my Linux boxes and visa-versa.
>>
>> What additional config do I need to do and where?
>>
>> Thank you.
>> -Martin
>>
>>
>> Jesse Gordon wrote:
>>
>>>> Two questions:
>>>> 1) How can I get my linux boxes to see and communicate properly with my 
>>>> D-Link router?
>>>
>>>
>>> D-Link's usually have a netmask of 255.255.255.0 -- and an IP of 
>>> 192.168.0.1, and since your linux boxes are 192.168.1.x, they are outside 
>>> of the netmask range and the dlink ignores them.
>>>
>>> Set the LAN netmask on the dlink to 255.255.0.0, or change it's IP to 
>>> 192.168.1.1, or change your linux boxes to 192.168.0.x..
>>>
>>> Also, the dlinks default to have a DHCP server running on them -- so you 
>>> could set your linux boxes to use DHCP to autoconfigure an IP, but then 
>>> you wouldn't always know what IP they would be. (They would probably 
>>> start at around 192.168.0.100 or so.)(To try dhcp, just type dhcpcd and 
>>> press enter and wait. dhcpcd stands for "Dynamic Host Configuration 
>>> Protocol Client Daemon. dhcpcd requests to be assigned an IP, netmask, 
>>> default gateway, and DNS from the dlink.)
>>>
>>>> 2) My linux boxes were using a dialup modem serial port to connect to 
>>>> the Internet. How can I change my connection from using the dialup modem 
>>>> to now go through the router to access the high speed connection?
>>>
>>>
>>> After changing the IP or netmask as above, just set your default route to 
>>> be 192.168.0.1 (or whatever you set the LAN ip to on the dlink.)
>>>
>>> I don't know what distro you use, so I don't know which network 
>>> configuration utility you would use, but to test it, you could type these 
>>> on one of the linux boxes:
>>>
>>> ifconfig eth0 192.168.0.2 netmask 255.255.0.0
>>> route add default gw 192.168.0.1
>>>
>>> Of course you might type route -n (then press the ENTER key) to make sure 
>>> there isn't already a default route.
>>>
>>> You'll also need to set up a DNS server IP. You can use whatever network 
>>> configuration tool you have or like, or you may be able to just edit 
>>> /etc/resolv.conf and add the line:
>>> nameserver 192.168.0.1
>>>
>>> before any other 'nameserver' lines.
>>>
>>> Hope this helps.
>>>
>>> -Jesse
>>>
>>>
>>>
>>> ----- Original Message ----- From: <martinh@ix.netcom.com>
>>> To: <netfilter@lists.netfilter.org>
>>> Cc: <martinh@ix.netcom.com>
>>> Sent: Thursday, May 25, 2006 9:00 AM
>>> Subject: Linux box to D-Link router/bridge/access connection question
>>>
>>>
>>>> I just got a D-Link wireless router connected to high speed Internet 
>>>> access via a cable modem.
>>>>
>>>> I have a Windoze XP laptop with wireless network card that communicates 
>>>> properly with the wireless router and I can make a high speed Internet 
>>>> connection.
>>>>
>>>> My linux box1 is connected into port two of the router.
>>>> My linux box2 is connected to port 3.
>>>> My two linux boxes can see each other connected into the ports of the 
>>>> wireless router.
>>>>
>>>> But I can not get my linux boxes to see the D-Link router!
>>>>
>>>> D-Link address is 192.168.0.1
>>>>
>>>> My linux boxes are 192.168.1.2 and 192.168.1.50
>>>>
>>>> Two questions:
>>>> 1) How can I get my linux boxes to see and communicate properly with my 
>>>> D-Link router?
>>>>
>>>> 2) My linux boxes were using a dialup modem serial port to connect to 
>>>> the Internet. How can I change my connection from using the dialup modem 
>>>> to now go through the router to access the high speed connection?
>>>>
>>>> Thank you for you help.
>>>> -Martin
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>
>> -- 
>> 
>
>




