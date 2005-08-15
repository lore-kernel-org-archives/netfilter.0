From: varun_saa@vsnl.net
Subject: Re: RE: ftp issue cont.
Date: Mon, 15 Aug 2005 11:14:38 +0500
Message-ID: <6b9ab356b9d046.6b9d0466b9ab35@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
To: Derick Anderson <danderson@vikus.com>
Cc: netfilter@lists.netfilter.org

Thanks a lot Derick, 
                  I learnt a few details. 
 
" -A FORWARD -p tcp -d your.ftp.ip.address --dport 1024: -j ACCEPT " 
 
Did not seem to work. 
 
I have a few more details for you. 
 
WAN -----> eth0 - FC4 server - eth1 -----------> clients ( 192.168.0.0/ 24 ) 
FC4 server is only for sharing internet , mails, etc for clients system. 
I do not run any ftp server on ny FC4 server. 
 
My ftp server is on windows 2000 advanced server run by our 
friend in US. 
 
From my FC4 server I am able to connect to " ftp.sriaurobindoashram.com " 
with " passive files transfer " - unchecked in gftp. 
Using " passive files transfer " - checked in gftp it connects and stops at 
recieving files names. 
 
So I guess Win2k server does not support passive mode. And we 
need to concentrate on non-passive mode. 
 
Now on the client systems with " passive files transfer " - unchecked in gftp. 
I get the following error : 
 
Looking up ftp.sriaurobindoashram.com 
Trying www.sriaurobindoashram.com:21 
Connected to ftp.sriaurobindoashram.com:21 
220 ns1 Microsoft FTP Service (Version 5.0). 
USER xxxxxxxx 
 
331 Password required for xxxxxxxx. 
PASS xxxx 
230 User xxxxxxxx logged in. 
SYST 
 
215 Windows_NT version 5.0 
TYPE I 
 
200 Type set to I. 
PWD 
 
257 "/xxxxxxxxx" is current directory. 
Loading directory listing /xxxxxxxx from server (LC_TIME=en_US) 
PORT 192,168,0,253,4,3 
 
500 Invalid PORT Command. 
Invalid response '5' received from server. 
Disconnecting from site ftp.sriaurobindoashram.com 
 
So what that suggest ? 
 
Varun 
  
----- Original Message ----- 
From: Derick Anderson <danderson@vikus.com> 
Date: Friday, August 12, 2005 11:14 pm 
Subject: RE: ftp issue cont. 
 
> FTP passive mode creates an entirely new connection for data transfer. 
> It is not 'related' to the original connection and so iptables doesn't 
> pick it up as such (nor do any other stateful firewalls that I'm aware 
> of). The connection works something like this: 
>  
> 1. Client connects to FTP server on port 21 and requests PASV mode. 
> 2. Server replies with the port that client should use (e.g., 50100). 
> 3. Client makes NEW connection on the passive port (50100). 
> 4. Server transfers information using the new connection. 
>  
> This is why (I think...) stateful firewalls don't pick up passive 
> connections: they are initiated by the client, not the server. 
>  
> You know you have to open port 21 and 20 (for non-passive connections) 
> inbound to your FTP server. I didn't see that in your rules either but 
> since you can log in to the server, etc. I can only assume it  
> works. You 
> will have to check your FTP server's documentation on which ports it 
> uses in PASV (passive) mode. These ports are always above 1023  
> (1024:).I will give you an example: 
>  
> Suppose your FTP server uses ports 50100 to 50200 for passive 
> connections. You will need to add an iptables rule such as 
>  
> $IPT -A FORWARD -p tcp -d your.ftp.ip.address --dport 50100:50200 -j 
> ACCEPT 
>  
> into your firewall ruleset, assuming your FTP server is not on the 
> firewall and you've taken care of DNATing. If you want to be lazy you 
> can always do this: 
>  
> $IPT -A FORWARD -p tcp -d your.ftp.ip.address --dport 1024: -j ACCEPT 
>  
> The above rule should work right away, provided the rest of your 
> firewall is in order. For anything else I suggest reviewing the HOW- 
> TOson www.netfilter.org. A google search will probably provide you  
> with the 
> specific ports for your FTP server, and any server worth the download 
> will let you change what those ports are. 
>  
> Hope that helps. 
>  
> Derick 
>  
> -----Original Message----- 
> From: netfilter-bounces@lists.netfilter.org 
> [netfilter-bounces@lists.netfilter.org] On Behalf Of 
> varun_saa@vsnl.net 
> Sent: Friday, August 12, 2005 12:52 PM 
> To: netfilter@lists.netfilter.org 
> Subject: ftp issue cont. 
>  
> Make sure you've opened up whichever unprivileged passive ports  
> your FTP 
> server uses. Passive FTP connections are seen as new by stateful 
> firewalls, not related to the original control connection.  
>  
> Derick Anderson   
>  
> Thanks Derick,  
>              But I am not very clear about ftp.  
> So I will appreciate details.  
>  
> Thanks  
>  
> Varun  
>  
>  
>  
>  


