From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: I gave up.-...-.-.-.- :'(
Date: Sun, 02 Oct 2005 12:36:53 +0100
Message-ID: <433FC655.90900@dsl.pipex.com>
References: <007101c5c691$2c6f81f0$5b00a8c0@ripst>
Reply-To: andy.furniss@dsl.pipex.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-bounces@mailman.ds9a.nl>
In-Reply-To: <007101c5c691$2c6f81f0$5b00a8c0@ripst>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Guillermo Javier Nardoni <gjnardoni@yahoo.com.ar>
Cc: lartc@mailman.ds9a.nl, fb-gral@freebaires.org.ar, netfilter@lists.netfilter.org

Guillermo Javier Nardoni wrote:
> Actually i gave up, i tried and tried and tried so many times, upgrading software falling back to an old version 
> but it didn't work, that's it.
> i can't do work together tc with iptables and iproute2
> when i mark a packet with iptables tc doesn't recognize them so it falls at the default leaf of the tc's tree

Try what Stef says - but even if mark doesn't work for you there are 
always other ways - iptables CLASSIFY or use tc filters to classify.

> 
> what i like is to mark packets depending on their ip (the one who make a connetion into de linux (gateway) box) and port.
> 
> i'll transcript my script because i really don't know what to do.
> 
> p.d. so, what i like to do is just simple, i guess; everything comes from eth1 and goes to eth1 (lan users to linux box services) must be shapped by ipaddres + port (dport i guess INPUT/OUTPUT CHAIN?)
> and everything comes from ETH1 goes to ETH0 (Internet Access i guess PREROUTING/POSTROUTING/FORWARD chain) MUST BE SHAPPED BY PORT + IPADDRESS
>

Remember you can only shape outbound traffic on eth0/1 if you want to 
shape inbound then you need to use policers/dummy/imq (though you can 
shape inbound on eth0 that is for LAN by shaping on eth1).


> i have this situation on the linux server:
> 
> eth0: (Out to internet)
> eth1: (LAN)
> 
> configutarion: eth0 (network 200.123.166.72, broadcast: 200.123.166.79; (ip range: 200.123.166.73-77)
> eth0 ip: 200.123.166.73
> eth0: gw: 200.123.166.78
> eth0: netmask: 255.255.255.248
> eth dns1: 200.123.166.73
> eth0 dns2: 200.123.166.74
> 
> configuration: eth1 (network 172.16.0.0 broadcast: 172.16.0.255 (ip range: 172.16.0.1-254)
> eth1 ip: 172.16.0.1
> eth1: gw: (none)
> eth1: netmask: 255.255.0.0
> eth1: dns1: 200.123.166.73
> eth1: dns2: 200.123.166.74

I assume your routing is all OK and just tc is not working.

> 
> LINUX BOX SERVING THIS SERVICES: HTTP (PORT 80) SMTP (PORT 25) POP3 (PORT 110) SSH (PORT 22) FTP (PORT 20-21) SMB FS (PORT 136-139) IRC (PORT 6667)
> 
> CONFIGURATION OF TC:
> 
> tc=/sbin/tc
> iptables=/sbin/iptables
> 
> echo "Building tc Classes"
> IFACE="eth0 eth1"
> 
> for i in $IFACE;do
> $tc qdisc add dev $i root handle 1: htb default 10
> 
> $tc class add dev $i parent 1: classid 1:1 htb rate 2048mbit 

Should be kbit and may still be too high for your inet link.

> 
> $tc class add dev $i parent 1:1 classid 1:10 htb rate 10kbit ceil 128kbit quantum 1514
> $tc class add dev $i parent 1:1 classid 1:20 htb rate 10kbit ceil 256kbit quantum 1514  
> $tc class add dev $i parent 1:1 classid 1:30 htb rate 10kbit ceil 512kbit quantum 1514  
> $tc class add dev $i parent 1:1 classid 1:40 htb rate 10kbit ceil 1024bit quantum 1514  
> $tc class add dev $i parent 1:1 classid 1:50 htb rate 10kbit ceil 2048bit quantum 1514

Missing ks on last two ceils.

> 
> $tc class add dev $i parent 1:1 classid 1:60 htb rate 10kbit ceil 256kbit quantum 1514 # USED FOR HTTP/IRC
> $tc class add dev $i parent 1:1 classid 1:70 htb rate 10kbit ceil 128kbit quantum 1514 # USED FOR EMAIL (SMTP/POP3)
> 
> 
> $tc qdisc add dev $i parent 1:10 handle 10: sfq perturb 10
> $tc qdisc add dev $i parent 1:20 handle 20: sfq perturb 10
> $tc qdisc add dev $i parent 1:30 handle 30: sfq perturb 10
> $tc qdisc add dev $i parent 1:40 handle 40: sfq perturb 10
> $tc qdisc add dev $i parent 1:50 handle 50: sfq perturb 10
> 
> $tc qdisc add dev $i parent 1:60 handle 60: sfq perturb 10
> $tc qdisc add dev $i parent 1:70 handle 70: sfq perturb 10
> 
> $tc filter add dev $i parent 1:0 protocol ip prio 0 handle 10 fw flowid 1:10
> $tc filter add dev $i parent 1:0 protocol ip prio 0 handle 20 fw flowid 1:20
> $tc filter add dev $i parent 1:0 protocol ip prio 0 handle 30 fw flowid 1:30
> $tc filter add dev $i parent 1:0 protocol ip prio 0 handle 40 fw flowid 1:40
> $tc filter add dev $i parent 1:0 protocol ip prio 0 handle 50 fw flowid 1:50
> $tc filter add dev $i parent 1:0 protocol ip prio 0 handle 60 fw flowid 1:60
> $tc filter add dev $i parent 1:0 protocol ip prio 0 handle 70 fw flowid 1:70

Won't make any difference here but 1 is the top prio for filters.

> 
> 
> PORTS="80 6667 20 21"
> #ANY IP MUST BE SHAPPED BY THESE PORTS TO THE 1:60 LEAF
> for i in $PORTS;do
>     $iptables -t mangle -A INPUT -i eth1 -s 172.16.0.0/16 -p tcp --dport $i -j MARK --set-mark 60
>     $iptables -t mangle -A INPUT -i eth1 -s 172.16.0.0/16 -p udp --dport $i -j MARK --set-mark 60

Marking in INPUT will have no effect for tc - I don't know what you are 
trying to do here.

Andy.
