From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: ssh connecting to wrong machine....
Date: Mon, 3 Jun 2002 07:13:17 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <001901c20af8$0b8bbe70$020aa8c0@matttm9svd8lrh>
References: <20020602192157.A16556@trot.haven.dom> <002c01c20aaa$812e04b0$020aa8c0@matttm9svd8lrh> <20020603010544.E16556@trot.haven.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
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
To: George Georgalis <georgw@galis.org>
Cc: netfilter@lists.samba.org

> >> iptables -t nat -A PREROUTING -p tcp -s $EXT_host04 -j
DNAT --to-destination $LAN_host04
> >
> >This is the major problem. If you're connection from a host on the
Internet
> >the source address is not going to be your firewall. Change this line to:
> >iptables -t nat -A PREROUTING -p tcp -j DNAT --to-destination $LAN_host04
>
> How's this? ($EXT_host04 is just an alias, and there will be more)
>
> iptables -t nat -A PREROUTING -p tcp -d $EXT_host04 -j
DNAT --to-destination $LAN_host04
>

Good catch....I left an imporant piece out.  You'll definetely want the "-d
xxx" in the rule.

<snip>
> This seems to be doing the job :-} I added another nat rule, does it
> look okay?
>
> LANIF=eth0
> EXTIF=eth1
> TCP_OPEN="22,25,53,80"
> UDP_OPEN="53"
> LAN_host04=192.168.xx.xx
> EXT_host04=xx.xx.xx.xx
>
> iptables -P INPUT DROP
<snip>
> iptables -P OUTPUT ACCEPT

Looks good.  The only other thing I'd do is change your default OUTPUT
policy to DROP and add this:
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

There was a recent bug in the iptables code that had some security
implications (information disclosure), but I don't recall the details at the
moment. The suggestion was to drop INVALID output, which this does.

Goodluck,
Matt



