From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: default gateway problem.
Date: Sat, 15 Jun 2002 13:48:57 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206151248.g5FCmwA27219@Networker.rockstone.co.uk>
References: <000501c21415$544d0e40$7b0010ac@dynamicaccess.lan> <022801c21469$2bd0c8e0$9300a8c0@edapter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <022801c21469$2bd0c8e0$9300a8c0@edapter.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Saturday 15 June 2002 1:35 pm, Kumar wrote:

> Hi , 
> 
> Have installed RedHat 7.2 ( kernel -2.4.7-10) with two nic's. One is having
> an internal IP and the other a public IP. 
 There are no Ipchains/ IPtables
> rules nor there are any nating rules. Have enabled IP forwarding.  The
> default gateway of the internal IP is the public ip, right ? 

No, the default gateway of the internal LAN (I assume you meant the machines 
on the internal network) is the private (internal) IP of the firewall.

A gateway must always be an address on the local network of whatever machine 
you're talking about the gateway of.

> When some other machine is connected to the network giving the same ip,
> there is no problem.

Um, what do you mean by that ?   Two machines having the same IP address !?

> I am facing the following problems : 

> a) The machine is not able to connect to the default gateway, but it can
> connect to other machines on the same subnet. 
 So it is not ale to connect
> to the internet, since it canot connect to the gateway.

See my advice above.

> b) comand like
> route, netstat takes exceptionally long time to display the output. I know
> we can always do route -n to disable the dns lookup, bu in the other linux
> boxes it does nto take his much time.

I expect you've got an external DNS server listed, and because the gateway's 
not correct, the machine can't contact the DNS server.


> Here's the output of the ifonfig comand : 
> 
> eth1      Link encap:Ethernet  HWaddr 01:00:21:DD:78:00  
>           inet addr: x.x.x.x  Bcast:x.x.x.x  Mask:x.x.x.x          
>            UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:1927 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:238 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:100 
>           RX bytes:244135 (238.4 Kb)  TX bytes:14454 (14.1 Kb)
>           Interrupt:3 Base address:0xd000 
> 
> Here's the output of the route command : 
> 
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use    
> default         x.x.x.x          0.0.0.0                 UG      0      0  
>      0         eth1 

Are the two sets of x.x.x.x the same here ?

If they are, then that's your problem, and I think I misunderstood you above 
- I assumed you were talking about the default gateway for a machine on the 
internal LAN (which sould be set to 192.168.0.6 in your case).

The default gateway for the firewall itself is your ISPs router - in other 
words, whatever is on the other end of the connection to eth1.

Hope this helps,

 

Antony.

