From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: some addresses won't route
Date: Mon, 19 Sep 2005 09:12:41 -0500
Message-ID: <200509190912.51338.rob0@gmx.co.uk>
References: <432DBC78.8070504@theorb.net> <200509181605.16460.rob0@gmx.co.uk>
	<432DE559.6070409@theorb.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <432DE559.6070409@theorb.net>
Content-Disposition: inline
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

On Sunday 18 September 2005 17:08, iptables-user wrote:
> /dev/rob0 wrote:
> >>Box is setup as a router with a WAN, DMZ, and LAN.  WAN traffic
> >>DNAT'd to DMZ works. DMZ and LAN through WAN works. The problems
> >> show up in LAN to DMZ traffic.
> >
> > Incomplete description. Does the LAN and the DMZ have different
> > netblocks? What IP addresses are being accessed by LAN clients? Are
> > you doing the DNAT for those?

This be talk-like-a-pirate day, lad, so we be keel-haulin' yer router! 
Arrr! http://www.talklikeapirate.com/

Let's revisit this part, arrrr. DMZ be 10.0.0.0/24 and LAN be 
192.168.0.0/24, aye? Arrr, ye scurvy LAN-lubbers. When a LAN-lubber 
client tries t' hoist the Jolly Roger on server $X it not be goin' 
direct t' IP 10.0.0.$X, be it? It ere goin' to W.A.N.$X, aye?

What ye be doin' to a packet from 192.168.0.101 a-sailin' t' W.A.N.$X? 
It sails t' this router, 192.168.0.1. What ere ye doing with it there? 
Do ye send it out to yer ISP, or does it get DNAT'ed t' 10.0.0.$X? 
That's probably yer answer t' make this scurvy bilge rat work smartly: 
do the DNAT before sendin' it out on the Seven Seas.

> >> From LAN to/through DMZ ping (icmp), dns (udp and tcp), and ssh
> >> work fine. pop3 and smtp work, but only after a looong wait, much
> >> longer than a dns timeout.

This could be happening on the server end, arrr. Perhaps the server is 
checkin' yer reverse DNS, an' those lookups are goin' t' Davy Jones' 
locker.

Are ye runnin' DNS here? That be another way t' make things work 
smartly: ye could have a different internal view in yer nameserver, 
arrr. Ye tell internal clients (LANlubbers) that www.example.com be 
10.0.0.3, and tell external salty dogs that it be W.A.N.3.

I still would recommend the routed configuration, matey. Then ye have 
the same IP's fer all. No quarter! Avast! Arrr!

> >> http works on one DMZ'd server, but on 
> >> another webserver with 2 IPs will only connect to one of the IPs
> >> (the one that the webserver is NOT listening to, but works
> >> correctly for WAN traffic).
> >
> > /me reaches for the aspirin bottle

An' it still hasn't kicked in for that one. Or maybe me grog from last 
night still got the better o' me, arrr!! NAT has t' sail both ways; the 
SNAT'ed connections have t' be DNAT'ed on the journey back t' port. 
Perhaps this not be happenin' with ye multiple IP's.

> >># [eth0] LAN is L.A.N.1   /24 (private)
> >># [eth1] WAN is W.A.N.1-5 /29 (dsl to internet)
> >
> > Your iptables box is listening on all of these WAN IP's? Is it a
> > /28?
>
> /29

Aye, ye said that. Avast!

> >># [eth2] DMZ is D.M.Z.1   /24 (servers)
> >
> > Are these another RFC 1918 netblock? If so why are you obscuring
> > the IP's?
>
> Intent was not to obfuscate.  It was easier for me to keep track of
> what was coming/going to/from where.

Avast! We still not be knowin' what yer flagship be a-doin'!

> >>*nat
> >># remember: only NEW connections go through PREROUTING
> >>
> >>:PREROUTING ACCEPT [0:0]
> >>:POSTROUTING ACCEPT [0:0]
> >>:OUTPUT ACCEPT [0:0]
> >>:GO_1 - [0:0]
> >>:GO_2 - [0:0]
> >>:GO_3 - [0:0]
> >>:GO_4 - [0:0]
> >>:GO_5 - [0:0]
> >>
> >># filtering belongs in filter table...
> >
> > Amen, brother, preach on!
> >
> >>-A PREROUTING -p icmp -j RETURN
> >
> > What does a RETURN do from a builtin chain? I don't understand what
> > you're trying to do with that rule. If it works like ACCEPT, in the
> > nat table that just means no NAT will be done.
>
> Correct.  If it's ICMP I want to skip the NAT rules.

That means ye be not doin' ICMP NAT for ye LANlubbers, arrr. I thought 
ye said 'twas workin' t' ping the DMZ? Was that by IP, lad? Which IP, 
the external ones, or the 10.0.0.0/24 ones? Arrr!

I reckon those be a-workin' smartly.

> >># divvy ip's into chains; it's faster
> >>-A PREROUTING -d W.A.N.1 -j GO_1
> >>-A PREROUTING -d W.A.N.2 -j GO_2
> >>-A PREROUTING -d W.A.N.3 -j GO_3
> >>-A PREROUTING -d W.A.N.4 -j GO_4
> >>-A PREROUTING -d W.A.N.5 -j GO_5
> >
> > So each WAN IP has its own chain in nat PREROUTING. Not sure why.
>
> To keep the chains short

An' more to the point, here be where yer DNAT rules sail, an' ye be 
breakin' them up by IP. That makes sense, but without seein' what ye be 
doin', it be hard t' tell why she's not a'sailin' right proper! Arrrr!

> >>-A GO_5 -j DROP
> >
> > But brother, practice what thou preacheth! You said you would not
> > do filtering in the nat table, and yet, you do! Why?
>
> Supposed to be RETURNs but haven't done the filter rules yet.

RETURN rules be like barnacles on ye hull at the end of a chain. Ye 
don't need 'em there, arrr! Make 'em walk the plank!

> > You have left important parts out, but these DROP rules could be
> > your culprit.
>
> The nat part works well.  Didn't feel need to include all the
> mappings.

Well shiver me timbers, matey, I can't rightly say, arrr!

> >>-A INPUT -i WAN -p icmp -j DROP
> >
> > Not a good idea to put this rule here. Some ICMP you will want to
> > get, even if you block certain types.
>
> Agreed.  Stopgap measure.  Want the basics to work before fleshing
> everything else out.

ACCEPT all yer ICMP as a stopgap measure, me bucko. Aye! It'll help ye 
t' figure things out.

> >># but the rest of us aren't :)
> >>-A INPUT -p icmp -j ACCEPT
> >># allow router administration from lan
> >>-A INPUT -s L.A.N.0/255.255.255.0 -d L.A.N.1 -p tcp -m tcp --dport
> >> 22 -j ACCEPT
> >
> > No --state RELATED,ESTABLISHED -j ACCEPT rule here? I use a "State"
> > chain with this rule, and jump to it from both INPUT and FORWARD,
> > at (or very near) the top of both chains. This would allow you to
> > get the ICMP replies as alluded above.
>
> I don't understand.  How would I get a NEW ssh connection then?

I mean in addition t' yer SSH rule, not a replacement, arrrr. Hoist it 
up yer mainmast alongside the Jolly Roger!

> >># let it route...
> >>-A FORWARD -o DMZ -j ACCEPT
> >># let it route...
> >>-A FORWARD -o WAN -j ACCEPT
> >># lan offers no services
> >>-A FORWARD -o LAN -m state --state RELATED,ESTABLISHED -j ACCEPT
> >>COMMIT
> >
> > I think if you trace what is happening to each connection you might
> > figure this out. But still, I'd recommend doing away with the DNAT
> > DMZ and using routed IP's instead.
>
> Could you provide one example rule for routed IPs?  That might be
> enough to get me started.

I not be talkin' about iptables rules, matey. How be yer /29 delivered 
by the ISP? Do they have a router sittin' on one of yer IP's? If so ye 
can do proxy ARP for the schooners sailin' in the DMZ.

We're getting down into layer 2 territory here, and me own knowledge 
there is a bit short, arrr. Ye don't hoist those IP's on yer flagship 
mainmast, but ye take 'em from the ISP router and pass 'em along to the 
DMZ schooner which be a-listenin' on that IP. Arrrr!

Ye could also just put the DMZ a-sailin' on the same WAN segment, but 
there ye would lose the benefit of controllin' the bilge water through 
yer flagship.

If the ISP be just deliverin' all those IP's directly to ye, ye don't 
need proxy ARP. Regular ARP will work. Yer flagship maintains an ARP 
cache to know which MAC address be answerin' for which IP address, an' 
it all sails right smartly.

> FOLLOW-UP:
> OK, I've found what may be causing my symptoms, but don't understand
> why it is happening.
>
> CLIENT <---> LAN 192.168.0.1 <---> DMZ 10.0.0.1 <---> SERVERS
>
> Sniffing with tcpdump at DMZ while telneting from CLIENT:
>
> telnet 10.0.0.12 80 shows client.example.com.27642 > 10.0.0.12.http
> (OK) telnet 10.0.0.11 80 shows dmz.example.com.57298 > 10.0.0.11.http
> (WRONG)
>
> IOW, when telneting to 10.0.0.11.http the router gets the source
> address wrong, but when telneting to 10.0.0.12.http the source
> address is correct.
>
> What could cause that to happen?

Somethin' be gettin' NAT'ed, matey! Ere ye may be settin' yer source 
address in yer routin' tables. We be not knowin' enough t' guess, arr!
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

