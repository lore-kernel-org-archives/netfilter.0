From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 1 Sep 2004 10:44:27 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409011044.27158.Alistair@nerdnet.ca>
References: <7768933ECEDCA644AF7908B278CF125D021454@exchange.datec.com.fj>
	<3063e5040831212267c70f95@mail.gmail.com>
	<8ca42282040901045464650094@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca42282040901045464650094@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 1, 2004 07:54 am, Mike wrote:
> I have a linux box acting as router/firewall for my home network.
> It runs Gentoo Linux, kernel 2.4.26 and iptables 1.2.10.

	Yumm ...Gentoo -- good stuff

> I thought I had seen others on this list discuss starting with a
> completely closed router that denies all traffic - INPUT, OUTPUT, and
> FORWARD; filter, nat, and mangle.  Yet, when I reset my firewall
> Policies to initially DROP all INPUT, OUTPUT, and FORWARD traffic, and
> then append these policies with filter or nat rules, the policies
> still overrule and stop all traffic.

	Set POLICY for INPUT OUTPUT and FORWARD to DROP in filter only.
	If you start setting the POLICY for nat and mangle tables to DROP, things
	will misbehave badly.  And be hard to debug. -- there are those that 
	disagree, and have success doing things like this but in general and
	for a home router, it is in many folks eyes a (tm) Really Bad Thing (tm).

>
> I've read the man page a few times and have found a few tutuorials on
> the net, but I'm still missing the fundamental understanding of how
> policies do/do not affect iptables rules.
>
> Can I get an RTFM push in the right direction on this subject.
> Thanks for your time and patience.

	There is a wonderful fellow named Oskar Andreasson who has written a 
wonderful set of tutorials, and even provides some elemental scripts as 
guidelines 
	http://iptables-tutorial.frozentux.net/

	Read and enjoy

	(comments inline)
>
> Mike
>
> Maybe I should post the firewall so you can see there are no glaring
> errors in my syntax:
>
> ENABLE_FORWARDING_IPv4="yes"

>
> IPTABLES=/sbin/iptables
> DEPMOD=/sbin/depmod
> MODPROBE=/sbin/modprobe
>
> $DEPMOD -a
> $MODPROBE ip_tables
> $MODPROBE ip_conntrack
> $MODPROBE ip_conntrack_ftp
> $MODPROBE ip_conntrack_irc
> $MODPROBE iptable_nat
> $MODPROBE ip_nat_ftp
>
> echo "   Enabling forwarding.."
> echo "1" > /proc/sys/net/ipv4/ip_forward

	Urk
	  Do this at the *end* of the script. -- just a good habit to NOT turn on 
forwarding until all the rules are loaded to handle it.

>
> echo "   Enabling DynamicAddr.."
> echo "1" > /proc/sys/net/ipv4/ip_dynaddr
>
> echo "   Flushing any pre-existing filter rules or conditions."
> $IPTABLES -t filter -F
> $IPTABLES -t nat -F
> $IPTABLES -t mangle -F
>
> echo "   Set the filter/nat/mangle packet Matching Table Policy."
> $IPTABLES -t filter -P INPUT DROP
> $IPTABLES -t filter -P OUTPUT DROP
> $IPTABLES -t filter -P FORWARD DROP

The above are a (tm) Good Thing (tm)

> $IPTABLES -t nat -P PREROUTING DROP
> $IPTABLES -t nat -P POSTROUTING DROP
> $IPTABLES -t nat -P OUTPUT DROP
> $IPTABLES -t mangle -P INPUT DROP
> $IPTABLES -t mangle -P OUTPUT DROP
> $IPTABLES -t mangle -P FORWARD DROP
> $IPTABLES -t mangle -P PREROUTING DROP
> $IPTABLES -t mangle -P POSTROUTING DROP

In general the above are a (tm) Really Bad Thing (tm)

>
> echo "   INPUT/OUTPUT Rules for Routerbox."
> $IPTABLES -t filter -A INPUT -j ACCEPT
> $IPTABLES -t filter -A OUTPUT -j ACCEPT

Uhhh ... I hope these are only here because yer having problems -- 
   These above two rules are a (tm) Really Bad Thing (tm)
	(they basically allow everything in and out -- *ouch*)
>
> echo "   FORWARD Rules for data allowed IN and OUT of the LAN."
> $IPTABLES -t filter -A FORWARD -i eth0 -o eth1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT

Repeat the above rule for filter INPUT 

> $IPTABLES -t filter -A FORWARD -i eth0 -o eth1 -m state --state NEW -j
> ACCEPT

The above rule is a (tm) Really Bad Thing (tm)
	(basically allows everything into yer lan *ouch*)
>
>
> echo "   Allowing HTTP and SSH Access."
> $IPTABLES -t filter -A INPUT -p tcp -i eth0 --dport 22 -m state
> --state NEW -j ACCEPT
> $IPTABLES -t filter -A INPUT -p tcp -i eth0 --dport 80 -m state
> --state NEW -j ACCEPT
>
> echo "   Enabling NAT MASQUERADE."
> $IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
> echo "   Prevent remote machines from spoofing internal IP addresses."
> $IPTABLES -t filter -A INPUT -i eth0 -s 199.201.13.0/24 -j REJECT
>
> echo "   Do not respond to remote Pings."
> $IPTABLES -t filter -A INPUT -p icmp --icmp-type echo-request -j DROP
Umm .. You *might* want to set this to deny ping requests from the outside, 
rather than dropping them all .. .unless you don't trust users on the inside. 
*grin*


	Alistair Tonner

