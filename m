From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: RE: ftp issue cont.
Date: Mon, 15 Aug 2005 08:05:22 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7741FCC75@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

This sounds more like a problem with your Windows FTP server than
iptables. Having never worked with Win2k's FTP server I'm not sure what
to suggest. I'd try it with FileZilla (it's free, and works) and see if
you have the same problems, particularly since you said (in an email to
me) you can connect to other FTP sites just fine.

Derick=20

-----Original Message-----
From: varun_saa@vsnl.net [mailto:varun_saa@vsnl.net]=20
Sent: Monday, August 15, 2005 2:15 AM
To: Derick Anderson
Cc: netfilter@lists.netfilter.org
Subject: Re: RE: ftp issue cont.

Thanks a lot Derick,=20
                  I learnt a few details.=20
=20
" -A FORWARD -p tcp -d your.ftp.ip.address --dport 1024: -j ACCEPT "=20
=20
Did not seem to work.=20
=20
I have a few more details for you.=20
=20
WAN -----> eth0 - FC4 server - eth1 -----------> clients ( 192.168.0.0/
24 )
FC4 server is only for sharing internet , mails, etc for clients system.

I do not run any ftp server on ny FC4 server.=20
=20
My ftp server is on windows 2000 advanced server run by our friend in
US.=20
=20
From my FC4 server I am able to connect to " ftp.sriaurobindoashram.com
"=20
with " passive files transfer " - unchecked in gftp.=20
Using " passive files transfer " - checked in gftp it connects and stops
at recieving files names.=20
=20
So I guess Win2k server does not support passive mode. And we need to
concentrate on non-passive mode.=20
=20
Now on the client systems with " passive files transfer " - unchecked in
gftp.=20
I get the following error :=20
=20
Looking up ftp.sriaurobindoashram.com
Trying www.sriaurobindoashram.com:21
Connected to ftp.sriaurobindoashram.com:21 220 ns1 Microsoft FTP Service
(Version 5.0).=20
USER xxxxxxxx=20
=20
331 Password required for xxxxxxxx.=20
PASS xxxx
230 User xxxxxxxx logged in.=20
SYST=20
=20
215 Windows_NT version 5.0
TYPE I=20
=20
200 Type set to I.=20
PWD=20
=20
257 "/xxxxxxxxx" is current directory.=20
Loading directory listing /xxxxxxxx from server (LC_TIME=3Den_US) PORT
192,168,0,253,4,3=20
=20
500 Invalid PORT Command.=20
Invalid response '5' received from server.=20
Disconnecting from site ftp.sriaurobindoashram.com=20
=20
So what that suggest ?=20
=20
Varun=20
 =20
----- Original Message -----
From: Derick Anderson <danderson@vikus.com>
Date: Friday, August 12, 2005 11:14 pm
Subject: RE: ftp issue cont.=20
=20
> FTP passive mode creates an entirely new connection for data transfer.

> It is not 'related' to the original connection and so iptables doesn't

> pick it up as such (nor do any other stateful firewalls that I'm aware

> of). The connection works something like this:
> =20
> 1. Client connects to FTP server on port 21 and requests PASV mode.=20
> 2. Server replies with the port that client should use (e.g., 50100).=20
> 3. Client makes NEW connection on the passive port (50100).=20
> 4. Server transfers information using the new connection.=20
> =20
> This is why (I think...) stateful firewalls don't pick up passive
> connections: they are initiated by the client, not the server.=20
> =20
> You know you have to open port 21 and 20 (for non-passive connections)

> inbound to your FTP server. I didn't see that in your rules either but

> since you can log in to the server, etc. I can only assume it works.=20
> You will have to check your FTP server's documentation on which ports=20
> it uses in PASV (passive) mode. These ports are always above 1023=20
> (1024:).I will give you an example:
> =20
> Suppose your FTP server uses ports 50100 to 50200 for passive=20
> connections. You will need to add an iptables rule such as
> =20
> $IPT -A FORWARD -p tcp -d your.ftp.ip.address --dport 50100:50200 -j=20
> ACCEPT
> =20
> into your firewall ruleset, assuming your FTP server is not on the=20
> firewall and you've taken care of DNATing. If you want to be lazy you=20
> can always do this:
> =20
> $IPT -A FORWARD -p tcp -d your.ftp.ip.address --dport 1024: -j ACCEPT
> =20
> The above rule should work right away, provided the rest of your=20
> firewall is in order. For anything else I suggest reviewing the HOW-=20
> TOson www.netfilter.org. A google search will probably provide you=20
> with the specific ports for your FTP server, and any server worth the=20
> download will let you change what those ports are.
> =20
> Hope that helps.=20
> =20
> Derick
> =20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> varun_saa@vsnl.net
> Sent: Friday, August 12, 2005 12:52 PM
> To: netfilter@lists.netfilter.org
> Subject: ftp issue cont.=20
> =20
> Make sure you've opened up whichever unprivileged passive ports your=20
> FTP server uses. Passive FTP connections are seen as new by stateful=20
> firewalls, not related to the original control connection.
> =20
> Derick Anderson  =20
> =20
> Thanks Derick, =20
>              But I am not very clear about ftp. =20
> So I will appreciate details. =20
> =20
> Thanks
> =20
> Varun
> =20
> =20
> =20
> =20


