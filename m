From: Jan Klod <janklodvan@gmail.com>
Subject: Re: VPN (interface) access for and all traffic through from single user -- how to do it?
Date: Sun, 17 Aug 2008 14:20:31 +0300
Message-ID: <200808171420.32090.janklodvan@gmail.com>
References: <200808151255.44987.janklodvan@gmail.com> <200808162347.55392.janklodvan@gmail.com> <48A7A9A5.3040403@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:references:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:message-id;
        bh=FC6lu34DHbJC1O0Gf0S/xSJzYhnBMONTEAxpohJZBJY=;
        b=JD23Mz0M3mDWRKYv7Cuz/vEpPSqzwy/Xp7kIcixTkMe6lHiPafhcn4qIIk7TuijKG6
         JDCPXkhab7p07VQIF+L/HiZsAvGOypH+XaI0VP1jQaW+20YXa1WwQyXiuirqqAsSJe6T
         OqlOEkSMWGNPmr/e6sD5wKm7fXUQsDGGb63NQ=
In-Reply-To: <48A7A9A5.3040403@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sunday 17 August 2008 07:31:33 you wrote:
> On 8/16/2008 3:47 PM, Jan Klod wrote:
> > Is it considerable to be a proof, that pptp VPN tunnel is working, if
> > I can ping -i ppp0 <remote VPN address>?
>
> If the address is on the inside of the VPN or on the LAN on the other
> end of the VPN, most likely.
I think so, but how to check?

>
> > Looking for solutions,
>
> Please reset everything to the way it was before trying things suggested
> (restart your network or reboot should do it).
>
> Please provide the output of "ifconfig" and "route -n" after bring up
> the VPN and being able to ping like above.  I'll then try to provide
> example commands at that point to do what you are wanting.

Here I go:

local ~ # dhcpcd -k eth1
local ~ # ifconfig eth1 down
local ~ # ifconfig eth1 up
local ~ # dhcpcd eth1
local ~ # ip route list
192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.111
127.0.0.0/8 dev lo  scope link
default via 192.168.2.1 dev eth1
local ~ # ip rule list
0:      from all lookup local
32766:  from all lookup main
32767:  from all lookup default


local ~ # pon mySERVERname debug dump logfd 2 nodetach
pppd options in effect:
debug           # (from command line)
nodetach                # (from command line)
logfd 2         # (from command line)
dump            # (from command line)
noauth          # (from /etc/ppp/options.mySERVERname )
name myLOGIN            # (from /etc/ppp/peers/mySERVERname )
remotename mySERVERname                 # (from /etc/ppp/peers/mySERVERname )
                # (from /etc/ppp/options.mySERVERname )
pty pptp 193.13.128.6 --nolaunchpppd            # 
(from /etc/ppp/peers/mySERVERname )
mru 1000                # (from /etc/ppp/options.mySERVERname )
mtu 1000                # (from /etc/ppp/options.mySERVERname )
lcp-echo-failure 10             # (from /etc/ppp/options.mySERVERname )
lcp-echo-interval 10            # (from /etc/ppp/options.mySERVERname )
ipparam mySERVERname            # (from /etc/ppp/peers/mySERVERname )
nobsdcomp               # (from /etc/ppp/options.mySERVERname )
nodeflate               # (from /etc/ppp/options.mySERVERname )
require-mppe-128                # (from /etc/ppp/options.mySERVERname )
using channel 29
Using interface ppp0
Connect: ppp0 <--> /dev/pts/7
sent [LCP ConfReq id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x76d7cdc3> <pcomp> 
<accomp>]
rcvd [LCP ConfReq id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic 0xf4a5af8b> 
<pcomp> <accomp>]
sent [LCP ConfAck id=0x1 <asyncmap 0x0> <auth chap MS-v2> <magic 0xf4a5af8b> 
<pcomp> <accomp>]
rcvd [LCP ConfAck id=0x1 <mru 1000> <asyncmap 0x0> <magic 0x76d7cdc3> <pcomp> 
<accomp>]
sent [LCP EchoReq id=0x0 magic=0x76d7cdc3]
rcvd [CHAP Challenge id=0xad <be119e70047db182c48380880a0fbf66>, name 
= "vpn-gw"]
sent [CHAP Response id=0xad 
<8dce041691feeec08f9cc100cb4d12e3000000000000000084a80f09fe0a2aedd545eb7563057de7944cdef00012c5d900>, 
name = "myLOGIN"]
rcvd [LCP EchoRep id=0x0 magic=0xf4a5af8b]
rcvd [CHAP Success id=0xad "S=D35E31DAAB3F9837AA1159ACCC91DA05007EC37B"]
CHAP authentication succeeded
sent [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfReq id=0x1 <mppe +H -M +S -L -D -C>]
sent [CCP ConfAck id=0x1 <mppe +H -M +S -L -D -C>]
rcvd [CCP ConfAck id=0x1 <mppe +H -M +S -L -D -C>]
MPPE 128-bit stateless compression enabled
sent [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 0.0.0.0>]
rcvd [IPCP ConfReq id=0x1 <compress VJ 0f 01> <addr 215.155.115.254>]
sent [IPCP ConfAck id=0x1 <compress VJ 0f 01> <addr 215.155.115.254>]
rcvd [IPCP ConfNak id=0x1 <addr 215.155.114.15>]
sent [IPCP ConfReq id=0x2 <compress VJ 0f 01> <addr 215.155.114.15>]
rcvd [IPCP ConfAck id=0x2 <compress VJ 0f 01> <addr 215.155.114.15>]
local  IP address 215.155.114.15
remote IP address 215.155.115.254
Script /etc/ppp/ip-up started (pid 3609)
Script /etc/ppp/ip-up finished (pid 3609), status = 0x0

It might be Microsoft VPN most likely, but I am not absolutely sure (how to 
check?).

local ~ ip route list
215.155.115.254 dev ppp0  proto kernel  scope link  src 215.155.114.15
192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.111
127.0.0.0/8 dev lo  scope link
default via 192.168.2.1 dev eth1

local ~ # ping -I ppp0 www.kernel.org
PING pub.us.kernel.org (204.152.191.5) from 215.155.114.15 ppp0: 56(84) bytes 
of data.

--- pub.us.kernel.org ping statistics ---
30 packets transmitted, 0 received, 100% packet loss, time 29008ms

ibm ~ # ping -I ppp0 215.155.115.254
PING 215.155.115.254 (215.155.115.254) from 215.155.114.15 ppp0: 56(84) bytes 
of data.
64 bytes from 215.155.115.254: icmp_seq=1 ttl=64 time=16.0 ms
64 bytes from 215.155.115.254: icmp_seq=2 ttl=64 time=12.5 ms
64 bytes from 215.155.115.254: icmp_seq=3 ttl=64 time=13.0 ms
64 bytes from 215.155.115.254: icmp_seq=4 ttl=64 time=15.4 ms
64 bytes from 215.155.115.254: icmp_seq=5 ttl=64 time=11.7 ms

--- 215.155.115.254 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4006ms
rtt min/avg/max/mdev = 11.703/13.765/16.039/1.678 ms

local ~ # ifconfig
eth1      Link encap:Ethernet  HWaddr 01:0D:65:FA:82:F3
          inet addr:192.168.2.111  Bcast:192.168.2.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:6254696 errors:0 dropped:0 overruns:0 frame:0
          TX packets:7275995 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:2655461882 (2532.4 Mb)  TX bytes:67477010 (64.3 Mb)
          Base address:0x8000 Memory:c0220000-c0240000

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:444 errors:0 dropped:0 overruns:0 frame:0
          TX packets:444 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:52614 (51.3 Kb)  TX bytes:52614 (51.3 Kb)

ppp0      Link encap:Point-to-Point Protocol
          inet addr:215.155.114.15  P-t-P:215.155.115.254  
Mask:255.255.255.255
          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:996  Metric:1
          RX packets:40 errors:0 dropped:0 overruns:0 frame:0
          TX packets:40 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3
          RX bytes:3002 (2.9 Kb)  TX bytes:3008 (2.9 Kb)

local ~ # route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
215.155.115.254 0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
192.168.2.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         192.168.2.1     0.0.0.0         UG    0      0        0 eth1

This should contain most of necessary information...
