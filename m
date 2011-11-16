From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Dropped packets logged which should be accepted by Conntrack
Date: Wed, 16 Nov 2011 14:25:42 -0500
Message-ID: <1321471542.2936.113.camel@denise.theartistscloset.com>
References: <1321326448.2936.43.camel@denise.theartistscloset.com>
	 <alpine.LNX.2.01.1111161648420.26212@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1111161648420.26212@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

On Wed, 2011-11-16 at 16:51 +0100, Jan Engelhardt wrote:
> On Tuesday 2011-11-15 04:07, John A. Sullivan III wrote:
> 
> >Hello, all.  I find myself perplexed by what I often see in our logs.
> >At the end of our FORWARD chain, we log drops for no matches:
> >
> >[root@fw01 log]# iptables -v -n -L FORWARD
> >Chain FORWARD (policy DROP 528K packets, 85M bytes)
> > pkts bytes target     prot opt in     out     source
> >destination
> >  16M  925M TCPMSS     tcp  --  *      *       0.0.0.0/0
> >0.0.0.0/0           tcp flags:0x06/0x02 TCPMSS clamp to PMTU
> >2284M 1690G ACCEPT     all  --  *      *       0.0.0.0/0
> >0.0.0.0/0           state RELATED,ESTABLISHED
> >7890K  594M VPN_ALLOW  all  --  *      *       0.0.0.0/0
> >0.0.0.0/0           MARK match 0xcccc/0xcccc
> >  27M 2609M UPEPIN_DENY  all  --  *      *       0.0.0.0/0
> >0.0.0.0/0
> >  27M 2609M UPEPIN     all  --  *      *       0.0.0.0/0
> >0.0.0.0/0
> > 528K   85M LOG        all  --  *      *       0.0.0.0/0
> >0.0.0.0/0           LOG flags 0 level 4 prefix `No Match: '
> >
> >However, my logs are always showing these drops for packets I know
> >should be matched in conntrack:
> >
> >Nov 14 18:45:51 fw01 kernel: No Match: IN=bond4 OUT=bond3 SRC=172.x.y.34
> >DST=194.187.105.194 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=48910 DF
> >PROTO=TCP SPT=25 DPT=60261 WINDOW=4
> 
> As always, post the *full* ruleset, and do so by using iptables-save. Do 
> *NOT* use -L.
> The use of TCPMSS is generally not needed either - if you do, you are 
> likely to be wrongly blocking ICMP.

<grin> I don't think you want me posting all of my 2000 or so rules.
Here are pertinent ones from the configuration files rather than a
listing:

*filter
:INPUT DROP
:OUTPUT DROP
:FORWARD DROP
-N ACCESS_GROUPS
-N ACCESS_GROUPS_DENY
-N VPN_ALLOW
-N ProtectionFilterTCP
-N ProtectionFilterICMP
-N ProtectionFilterBadTCP
-N ProtectionFilterSource
-N ProtectionFilterBadSource
-N UPEPIN
-N UPEPIN_DENY
-N c1
.
.
.
-N c5
COMMIT

*filter
-A UPEPIN -j ProtectionFilterSource
-A UPEPIN -p 6 -j ProtectionFilterTCP
-A UPEPIN -p 1 -j ProtectionFilterICMP
-A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
COMMIT


*filter
-I c5 1 -d 172.x.y.34 -p 6 --dport 25 -j ACCEPT
-I c1 1 -j c5
COMMIT

*filter
-A ACCESS_GROUPS -m iprange --src-range 0.0.0.0-255.255.255.255 -j c1
-A FORWARD -m mark --mark 0xcccc/0xcccc -j VPN_ALLOW
-A UPEPIN_DENY -j ACCESS_GROUPS_DENY
-A UPEPIN -j ACCESS_GROUPS
-A INPUT -j UPEPIN_DENY
-A INPUT -j UPEPIN
-A FORWARD -j UPEPIN_DENY
-A FORWARD -j UPEPIN
-A FORWARD -j LOG --log-level warning --log-prefix "No Match: "
-A INPUT -j LOG --log-level warning --log-prefix "No Match: "
COMMIT

I may be ignorant on this matter (and hence this request for help) but
has the Internet matured to the point that the TCPMSS rule is no longer
necessary? Is everyone now handling requests for fragmentation properly?
It has been a number of years since we created that rule.

However, if only applies to packets with SYN set and RST unset and then
only changes the mss.  Are we saying that changing that value
invalidates the conntrack match? I didn't think conntrack evaluated that
portion of the packet.  I don't think these are fragments as Jorge has
suggested as these are SYN,ACK packets and thus should be tiny to begin
with.  So I'm not sure why TCPMSS would cause this issue.  Thanks - John

