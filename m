From: alvin.ml@Mail.DDoS-Mitigator.net
Subject: Re: iptables TCP DDoS filtering
Date: Wed, 6 Jul 2016 08:16:27 -0700
Message-ID: <20160706151627.GB30556@Mail.DDoS-Mitigator.net>
References: <loom.20160705T084958-392@post.gmane.org>
 <20160705190849.GA26405@Mail.DDoS-Mitigator.net>
 <577CAE19.3040905@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <577CAE19.3040905@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Wayne <conna666@gmail.com>
Cc: netfilter@vger.kernel.org


hi john

On 07/06/16 at 09:07am, John Wayne wrote:
> Thank you for your response. However, I can't make too much sense of it.

:-)

> > some of the rules in javapipe.com seems way tooo complicated
> 
> Can you provide an example of simpler rules to achieve the same?

list of various iptables howtos ...
	http://IPtables-BlackList.net/Howto

#
# extremely simplified rules:
# - remember iptables rules are order dependent
# - reorder the functions() if you feel like xx is more important
#
# rules depend on if you are an inline fw, dmz fw, host-based fw
#	"disallow" == "-j TARPIT"
#
allow loopback
allow your trusted network ( your own w.x.y.z/24 )
disallow src address pretending to be you
disallow RFC1918 (192.168.x.x) from the outside world 
  ( also depends on what you consider outside world )
disallow invalid flags 
allow established,related connections
check if the ( tcp-based ) src address is in blacklist 
	iptables -p tcp -j BlackList
allow new SSH from your desktop
limit incoming ICMP
	iptables -p icmp -favorite-limit-methodology ...
	- turn off broadcast ping replies
limit incoming UDP
	iptables -p udp -favorite-limit-methodology ...
allow your services
	# you will need DNS to all your servers
	- allow new 53/udp to your DNS server
	# you will NTP to keep all servers in sync
	- allow new 123/udp to your internal ntp server
	#
	# use explicit IP# for each of your servers
	- allow new 80/tcp connection to your web server
	- allow new 25/tcp connection to your mail server
	- allow new connection to xxx
tarpit all tcp connections
drop everything else

#
# you need an automated way to post-process ( tcpdump ) incoming traffic 
# and automatically update iptables w/ the DDOS attackers
#	iptables -p tcp -s DDoSattacker -d w.x.y.z/24 -j TARPIT
#

> > i claim iptables + tarpit is ideal to defend against tcp-based ddos
> attacks
> 
> Can you elaborate on that? From what I know you could only use tarpitting
> for unused ports.

iptables -p tcp -d www -dport 80 -j ACCEPT
iptables -p tcp -d mail -dport 25 -j ACCEPT
#
# iptables -p tcp -favorit-limit-methodology -d www -dport 80 -j ACCEpT
#
# all incoming tcp-based DDoS attacks ( to un-used ports, and un-used ip# )
# is tarpit'd
iptables -p tcp -d w.x.y.z/24 -j TARPIT

> But most of the time it's the actual ports of services
> that get attacked.

ports get ddos'd ...
ip# get ddos'd ...

> How does tarpitting help against TCP attacks on say port
> 80 if you run a web service?

limit incoming tcp to port 80 ... after exceeding the limit
you would tarpit it instead of "drop"

however, it is extremely foolish to limit port 80 on a webserver
and similarly limit port 25 on mail servers ..

always keep various services on different physical servers
mail server only runs sendmail ... no apache, no dns, etc
web server only runs apache ...... no sendmail, no dns, etc
dns server only runs bind ........ no apache, no sendmail, etc

anybody attacking port 80 on your mail server would get tarpit'd
anybody attacking port 25 on your web server would get tarpit'd
anybody sending any tcp-packets to your dns server would get tarpit'd

> Also doesn't it only work for botnets? 

botnets doesn't get into the pic other than it is probably the
zombie ddos attackers

> What about spoofed attacks, say SYN with random flags?

all that are tcp-based ...

random garbage tcp flags should be dropped

> > there are roughly 65,535 tcp-ports that should be protected with tarpits
> 
> But attacking random ports isn't that common, 

think again ... attackers dont care .... their intent might be to
filling up the pipe.   send a packet to un-used port and your incorrectly
configured server will reply back with "no such host" or "no such service"
and gazillion other junk

> they are mostly directed to one port a service is listening on.

that's for targetted attack against web ( apache ) or targetted attack against
mail ( sendmail ) or targetted attacks against 53 (bind )  etcetc

they are trying to exploit known vulnerability ( un-patched apps )
on those ports

> Also 65k ports isn't that many, there are enough botnets that are larger.

yup.... one can scan 65K ports in few milliseconds if you dont bother to 
wait for a reply but it will cause major headaches on your server

> Therefore I doubt that tarpit even makes
> much sense for botnet attacks, considering they can be huge and also just
> wait for the TCP timeout.

an attacker sending 10,000 tcp-based packet/sec can be tarpit'd

an attacker sending 10,000 udp-based or icmp-based packets are smarter
than the average bear

10,000 packet/sec * 1500 byte * 8bit is about 1.2gigabit/sec of garbage

to sustain 10,000packet/sec attacks, the attacker requires 2K kernel memory
per packet sent ... that remains open for tcp-timeout ( 2 minutes )
requires about 2.40GB of kernel memory ... aka the attacker might/should
crash during the sustained tcp-based attack against a tarpit'd server

CPU load on the ddos attacker goes way up while sending DDoS attacks

freebsd-10.x backs itself off to prevent kernel crash :-)

> 
> > limiting incoming is sorta misleading, since you cannot
> limit/stop/block/drop incoming packets.
> 
> You can put a firewall in front of your servers effectively protecting the
> servers behind it.

nope... you already received the DDOS attacks ....

you cannot mitigate ddos attacks at the server .... it must be dont
at the ISP ...

however, tarpit's can defend your servers against tcp-based attacks
at up to 100gigabit/sec ... which is faster than most folk's internet feed

> So I don't really get this either. 

:-)

> Of course you need to
> mitigate the bad packets at some point in your network and the further
> upstream the better, that's for sure.

"bad packets" are trivially mitigated and is usually harmless
unless you let it thru

>  Yet they will always reach some device in your network..

nope ... that's the whole point of ddos mitigation methdologies

"large budget" IT depts and ISP use fancy ddos mitigation tricks
( RTBH, BGP, sFlow, etc, etc, etc )  and the ddos attacks are 
stopped at the ISP .. you/we never see the attack at our servers
if one paid for these expensive services

iptables is a "poor mans" ddos mitigation trick  if you don't have
$x,000/month or $xxx,000 to buy the brand-name DDoS mitigation hardware

------

for completeness.... CDN are mostly useless to some extent because
CDN deliver web pages to your customers ... but your other services
( dns, emails, voip ) could also still be offline

i see way too many CDN failures when visiting corps with CDNs
attempting to deliver their content

depending on which CDN you use, you may lose control of where 
your confidential data is and who controls your DNS and everything
else

- you can build your own itty-bitty CDN with servers in USA, 
Europe and Asia ... and running BGP/sFLOW/RTBH etc like the big boys

# ----------------------------------------------------
# DDoS mitigation is done with OpenSource software ...
# including iptables 
# ----------------------------------------------------
# but there are exceptions like prolexic and arbornetwork that
# uses custom ASICs to speed things up
#

magic pixie dust
alvin
#
# DDoS-Mitigator.net/BGP
# DDoS-Mitigator.net/RTBH/#RTBH
# DDoS-Mitigator.net/xFlow/
#
# DDoS-Mitigator.net ... automated tcp-based iptables + tarpits
# DDoS-Simulator.net
#
