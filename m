From: "Kerryn Wood" <Kerryn.Wood@tideway.com>
Subject: RE: disabling conntrack ...
Date: Fri, 26 Aug 2005 15:42:28 +0100
Message-ID: <B81183566FF73947875C3A207CD60AA61DFB58@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

*bows head in shame*

I'm relatively new to iptables (landing the role of administrator
because nobody else wanted it!) so was trying different options, albeit
the wrong ones :)

The scenario is this:
I'm running a machine that's generating a HUGE amount of traffic.=20

I was seeing many of the "ip_conntrack: table full, dropping packet"
errors and this I suspected was causing major problems with the software
I was running on the machine. (It looks like it may be because the
machine at the time was working on a network in the US so timeouts (etc
...) were taking longer.) I've increased the hashsize substantially
because as far as I understand the default hashsize is configured (max)
for 2GB of RAM where the machine is running with 12GB. The error
messages just took longer to appear.

As the dropping packets are currently the top of the "what's causing our
problems" list I was (mistakenly apparently :D) investigating disabling
connection tracking (we're not NAT'd), but based on your response I'm
guessing it was the wrong way to go about it!

I think the rules file that iptables-restore was trying to read is
/etc/sysconfig/iptables which I've included at the end of the mail. Line
57 (I've removed all the superfluous documentation lines) is the COMMIT.

Thanks for the help,
Kerryn

*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:MYRULE-INPUT - [0:0]
-A INPUT -j MYRULE-INPUT

-A OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,PSH FIN,SYN,PSH -j LOG
-A OUTPUT -p tcp -m tcp --tcp-flags FIN,SYN,PSH FIN,SYN,PSH -j REJECT
--reject-with icmp-port-unreachable

-A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 199 -j ACCEPT
-A MYRULE-INPUT -m state --state NEW -m udp -p udp --dport 161 -j ACCEPT
-A MYRULE-INPUT -p udp -m udp --sport 123 --dport 123 -m state --state
RELATED,ESTABLISHED -j ACCEPT
-A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
-A MYRULE-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
-A MYRULE-INPUT -i lo -j ACCEPT

-A MYRULE-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
-A MYRULE-INPUT -p tcp -m tcp --dport 2049 --syn -j REJECT
-A MYRULE-INPUT -p udp -m udp --dport 0:1023 -j REJECT
-A MYRULE-INPUT -p udp -m udp --dport 2049 -j REJECT
-A MYRULE-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j REJECT
-A MYRULE-INPUT -p tcp -m tcp --dport 7100 --syn -j REJECT

COMMIT





-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of /dev/rob0
Sent: 26 August 2005 14:17
To: netfilter@lists.netfilter.org
Subject: Re: disabling conntrack ...

On Friday 2005-August-26 07:20, Kerryn Wood wrote:
> I need to disable connection tracking and, although I've seen an old

Oh my, what a strange need this is! Tell us why you think you need it,=20
and we can answer your questions more effectively (likely explaining=20
why you are wrong.)

> I *think* I've removed all the connection tracking modules from
> /lib/modules/<kernel version>/kernel/net/ipv4/netfilter/ (I removed
> all ip_conntrack* files).

Ouch. This is a reckless approach to system administration. Do not=20
delete files whose purpose you do not understand.

> When I try and start iptables again I get an error from
> iptables-restore. The error message is: "line 57 failed".

The rule on line 57 of your iptables-restore rules (check your OS=20
documentation to find out where that file is) depends on connection=20
tracking. My crystal ball tells me it's a MASQUERADE rule.

> I'm running FC3, kernel version 2.6.10-1.766 with iptables version
> 1.2.11.

As was suggested already, use the raw table NOTRACK target to bypass=20
connection tracking for the traffic you specify.

> Is there a FAQ or information documented on how to do this (that's
> I've missed and will be wholly embarrassed when you point it out)?
> Does anyone have any experience doing this they could share?

Good heavens no! Connection tracking is the jewel in netfilter's crown.=20
Why would I want to disable it?
--=20
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header


