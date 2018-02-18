From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: nftables: How to filter only ipv6 SSH traffic in an inet table?
Date: Sun, 18 Feb 2018 15:00:51 +1100
Message-ID: <20180218040051.GA2428@dimstar.local.net>
References: <20180206172809.f7a238e06cef71d52ec92ae0@bluenox07.de>
 <20180207003251.GA2621@dimstar.local.net>
 <20180207192632.6h2xczcmnpgai4yk@salvia>
 <20180208041415.96bade9856ee027fbab56fd5@bluenox07.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180208041415.96bade9856ee027fbab56fd5@bluenox07.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi Merlin,

On Thu, Feb 08, 2018 at 04:14:15AM +0100, Merlin B=FCge wrote:
> On Wed, 7 Feb 2018 20:26:32 +0100
> Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> > > Could you possibly post all of the output from nft list ruleset?
>
> Of course, I attached a textfile showing all the commands and output,
> and commenting what I don't understand / does not seem to work.
>
> I also uploaded the textfile: http://termbin.com/8zql
>
> Let me know if you need anything else.
>
>
> > We need to keep ip6 nexthdr around, since this is implicitly
> > restricting to match only IPv6 in the inet chain, where we can see
> > IPv4 and IPv6 traffic.
> >
> > Looking into this.
>
> So, are you saying that nftables is not behaving as intended, or am I
> doing something wrong? I'm new to networking and nftables, so I'm not
> sure my commands in the attached textfile are actually correct...
>
>
> Thanks!
>
> --
> Merlin B=FCge <toni@bluenox07.de>

> [root@host test]# nft flush ruleset
> [root@host test]# nft add table inet filter
> [root@host test]# nft add chain inet filter input { type filter hook inpu=
t priority 0 \; policy drop \; }
> [root@host test]# # filtering all IPv6 SSH traffic doesn't work:
> [root@host test]# nft add rule inet filter input ip6 nexthdr tcp tcp dpor=
t ssh accept
> [root@host test]# nft add rule inet filter input meta nfproto ipv6 tcp dp=
ort ssh accept
> [root@host test]# nft list ruleset
> table inet filter {
> 	chain input {
> 		type filter hook input priority 0; policy drop;
> 		tcp dport ssh accept
> 		tcp dport ssh accept
> 	}
> }
> [root@host test]# # filtering all IPv6 traffic or all IPv6 TCP traffic se=
ems to work:
> [root@host test]# nft add rule inet filter input meta nfproto ipv6 accept
> [root@host test]# nft add rule inet filter input ip6 nexthdr tcp accept
> [root@host test]# nft list ruleset
> table inet filter {
> 	chain input {
> 		type filter hook input priority 0; policy drop;
> 		tcp dport ssh accept
> 		tcp dport ssh accept
> 		meta nfproto ipv6 accept
> 		ip6 nexthdr tcp accept
> 	}
> }
> [root@host test]# # but this also does not work:
> [root@host test]# nft add rule inet filter input meta nfproto ipv6 meta l=
4proto tcp accept
> [root@host test]# nft list ruleset
> table inet filter {
> 	chain input {
> 		type filter hook input priority 0; policy drop;
> 		tcp dport ssh accept
> 		tcp dport ssh accept
> 		meta nfproto ipv6 accept
> 		ip6 nexthdr tcp accept
> 		meta l4proto tcp accept
> 	}
> }
> [root@host test]#
>
Merlin, there are a number of actions you can take to clarify what's going =
on:

 - add a *counter* action to each rule. You then see which rules match and =
act
   on packets.
 - rather than use stand-alone nft commands, incorporate them into an nft
   script. The commands become shorter owing to the block-structured nature=
 of
   the script, AND:
 - Put *nft list ruleset* as the last line of the script. This will show yo=
u the
   ruleset as will be presented to the kernel via netlink. This will usually
   differ from stand-alone *nft list ruleset* output - more on that later.
 - Put a *counter* as the last rule of any chain with policy *drop*. That c=
an
   warn you if you are losing packets unexpectedly.
 - When experimenting (with low packet volumes), add a *log* action to the
   *counter* above.
 - When developing a ruleset, run *watch "nft list ruleset"* inside an xter=
m. I
   use:
> xterm -geometry 130x45 -font 7x14 -bg rgb:30/00/00 -e watch "nft list rul=
eset"&
   but you can adjust the xterm size to fit as it's running and miss all op=
tions
   except -e.
 - Similarly, I like to watch what's actually going into the debug log:
> xterm -sl 2000 -sb -geometry 361x28 -font 7x14 -bg rgb:18/32/10 -e "tail =
--follow=3Dname /var/log/debug"&

I added your rules to my existing nft script with a couple of extras:
 1. Only filter wlan0 traffic so as not to lock out wired ethernet
 2. Run the filter hook at a lower priority than in the existing (ip4) rules

> #!/usr/sbin/nft -f
> flush ruleset
>
> # (existing table omitted)
>
> table inet filter \
> {
>   chain input \
>   {
>      type filter hook input priority 100; policy drop;
>
>      # Only for wlan0
>      iif ne "wlan0" accept
>
>      ip6 nexthdr tcp tcp dport ssh counter drop;
>      meta nfproto ipv6 tcp dport ssh counter accept
>      counter log prefix "nft6: " level debug
>    }
> }
> list ruleset

*list ruleset* above produced the following:

> table inet filter {
>	 chain input {
>		 type filter hook input priority 100; policy drop;
>		 iif !=3D "wlan0" accept
>		 meta nfproto ipv6 ip6 nexthdr tcp tcp dport ssh counter packets 0 bytes=
 0 accept
>		 meta nfproto ipv6 meta l4proto tcp tcp dport ssh counter packets 0 byte=
s 0 accept
>		 counter packets 0 bytes 0 log prefix "nft6: " level debug
>	 }
> }

while stand-alone *nft list ruleset* shows:

> table inet filter {
>	 chain input {
>		 type filter hook input priority 100; policy drop;
>		 iif !=3D "wlan0" accept
>		 tcp dport ssh counter packets 0 bytes 0 accept
>		 tcp dport ssh counter packets 0 bytes 0 accept
>		 counter packets 0 bytes 0 log prefix "nft6: " level debug
>	 }
> }

Trying an ssh still fails to connect. The debug log shows why:

> Feb 18 14:38:58 smallstar kernel: [13373.966329] nft6: IN=3Dwlan0 OUT=3D =
MAC=3D33:33:ff:5a:fe:38:00:03:47:e0:7b:e7:86:dd SRC=3Dfe80:0000:0000:0000:0=
203:47ff:fee0:7be7 DST=3Dff02:0000:0000:0000:0000:0001:ff5a:fe38 LEN=3D72 T=
C=3D0 HOPLIMIT=3D255 FLOWLBL=3D0 PROTO=3DICMPv6 TYPE=3D135 CODE=3D0

Add a rule to let in ICMPv6:

> meta l4proto ipv6-icmp counter packets 0 bytes 0 accept

Retry the ssh - now successful:

> table inet filter {
>	 chain input {
>		 type filter hook input priority 100; policy drop;
>		 iif !=3D "wlan0" accept
>		 tcp dport ssh counter packets 23 bytes 3909 accept
>		 tcp dport ssh counter packets 0 bytes 0 accept
>		 meta l4proto ipv6-icmp counter packets 2 bytes 136 accept
>		 counter packets 0 bytes 0 log prefix "nft6: " level debug
>	 }
> }

There were 2 ICMPv6 messages as part of the transaction. Your first rule ac=
cepts
the ssh traffic. (If I switch the order, the other rule accepts them instea=
d).

This isn't what I meant to say originally. But it seems to work,

Cheers ... Duncan.
