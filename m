From: <dummy1@gazeta.pl>
Subject: Re: Masquerade stopped working?!?!
Date: Sun, 03 Aug 2003 18:06:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059926792710.ew5.dummy1@gazeta.pl>
References: <FDEMKKNJDLAJDPNDPCDDKEDINFAA.georgev@citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDEMKKNJDLAJDPNDPCDDKEDINFAA.georgev@citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Have you done any logging?
> If your linux box can browse then the problem is the linux box.
> check that ip forwarding is working and that there's is absolutely 
no
> packets being dropped by mistake and that it's forwarding..
> 

I have done logging and everything seems to be ok. Packets are going 
out FORWARD chain. To be sure I remove all rules which can drop 
packets and every thing is ok. It looks like ISP is dropping 
packets.

> The only other thing possible is that the MTU could be too high 
and needs to
> be lowered if the workstations are at 1500 and your linux is at 
1400 or
> there abouts.. try forcing all MTUs to a lower value.. (research 
it on
> google).

I have tried diffrent values of MTUs (workstation, box): (1500,1500)
, (500,1500), (500,500), (300,500), (575,1500) and still nothing.

I have even used a TCPMSS target:
iptables -A FORWARD -p TCP --tcp-flags SYN,RST SYN -j TCPMSS 
--clamp-mss-to-pmtu
and still nothing. It looks like all tcp/udp communication from 
local machine to internet isn't working. Packets are going out linux 
box. I have done logging:
iptables -A FORWARD -o eth0 -j LOG
and the results are like this:
IN=eth1 OUT=eth0 SRC=10.1.1.14 DST=212.77.100.101 LEN=60 TOS=0x00 
PREC=0x00 TTL=63 ID=24078 DF PROTO=TCP SPT=32777 DPT=80 WINDOW=2144 
RES=0x00 SYN URGP=0
I have added logging incoming packets:
iptables -A INPUT -i eth0 -j LOG
and... silence. No packet are coming back.

> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of 
dummy1@gazeta.pl
> Sent: Sunday, August 03, 2003 6:41 PM
> To: netfilter@lists.netfilter.org
> Subject: Masquerade stopped working?!?!
> 
> 
> I have a standard home network configuration:
> 
> my local network 10.1.1.0/24
>             |
>             |
>     eth1 10.1.1.1
> +----------------------+
> |my firewall/router box|
> +----------------------+
>    eth0 192.168.1.92
>             |
>             |
>       192.168.1.1
> +----------------------+
> |     foreign ISP      |
> +----------------------+
>             |
>             |
>          Internet
> 
> To connect coumputers from my local network to the internet I used
> iptables and masquerade (snat was working to). Everything was
> working fine since one day. Suddenly, about one week ago, machines
> from local network have stopped seeing Internet, but my box is
> working fine. I suspect my ISP doing some nasty dirty tricks. Is 
it
> possible that ISP can recognize packets which are coming from my
> local network and drops it? And how should I configure my box to 
go
> around this problem? Please help! I spend a couple of days 
browsing
> Internet and reading tons of documention and still know nothing.
> 
> I give you some more details what I have tested. Maybe it helps 
you
> to find out what the problem is.
> 
> As I said everything is working fine on my box. Local network is
> working fine too. From local machine I can see my box. Problem
> starts when I want anything from internet. Nothing was working:
> ping, http, dns... So I thought the problem is that local machine
> can't see machines from internet because host names are not
> resolved. I have installed bind (dns server) on my box. Then dns
> starts working. And pings are working to the foreing hosts, but
> nothing else. Browser finds host and no data is received, ssh can
't
> connect, and so on. What is going on?
> I have some firewall rules on my box. To be sure I removed them 
all
> but one:
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> Any suggestion? Who can help?
> 
> I know very well iptables and netfiltering. I create many 
firewalls
> with diffrent configurations. In this case I am fool.
> 
> Jakub
> 
> 
> 
> 
> 
> 
> 
> 





