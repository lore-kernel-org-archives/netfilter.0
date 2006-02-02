From: Carlos Pastorino <carlos.pastorino@gmail.com>
Subject: Fwd: Conntrack and DNS
Date: Thu, 2 Feb 2006 09:20:19 -0200
Message-ID: <cc4fcc140602020320w67ba4c1du6899b3c120312e08@mail.gmail.com>
References: <AcYapeNOKtYp77/vSgG5uSkXClp3fQAAsQTg>
	<FAC4E024BF776842876169173CE2F0132CB27B@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F0132CB27B@mailbox.vikus.com>
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

Hi Derick,

> Assuming 1.1.1.35 is one of your public IPs.

Correct.

> What is .34? I don't see a related PREROUTING rule for it...

.34 is another IP at the same interface of .35.

> I'm assuming this is the mail server in question, with these
> inbound mail rules.

Correct.

> Accepting a source port means that the destination port can be anything
> so long as the source port is 1505 (which is unprivileged). It looks
> like this is your internal network so not a big deal, but it can burn
> you good if it handles Internet-sourced traffic.

This is a proprietary application of one of my customers, so I can't
do anything about it. But it's only open to internal network.

> My advice would be to have one, at the top, without specifiying the
> interface. See if that solves the problem.

I've done it, but it didn't work. I really haven't the foggiest idea
about what must the problem be.

I wonder if it could be the modules I'm executing (in this order):

/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_tables
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_state
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat

Or the processes:

echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo "1" > /proc/sys/net/ipv4/icmp_ignore_bogus_error_responses
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/tcp_syncookies
echo "0" > /proc/sys/net/ipv4/conf/all/accept_redirects
echo "0" > /proc/sys/net/ipv4/conf/all/accept_source_route
echo "0" > /proc/sys/net/ipv4/conf/all/log_martians
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter

Thanks again,

Pastorino

---------- Forwarded message ----------
From: Derick Anderson <danderson@vikus.com>
Date: Jan 19, 2006 12:30 PM
Subject: RE: Conntrack and DNS
To: netfilter@lists.netfilter.org



Sorry for the long delay. For clarity I've gotten rid of unrelated rules
as much as possible.

> Hi Derick,
>
> Here is the full iptables.save. The critical IPs have been renamed to
> 1.1.1.x, 2.2.2.2, etc.
>
> The ISP's DNS IPs are shown below. The ones that are described in my
> first e-mail as DNS01 and DNS02 are 201.10.120.2 and 201.10.128.2
> respectively.
>
> As you can see, I already accept domain TCP packets.
>
> Thanks a lot for your help.
>

> -A PREROUTING -d 1.1.1.35 -i eth0 -j DNAT --to-destination 10.0.0.6

Assuming 1.1.1.35 is one of your public IPs.

> -A POSTROUTING -s 10.0.0.6 -o eth0 -j SNAT --to-source 1.1.1.35
> -A POSTROUTING -s 10.0.0.1 -o eth0 -j SNAT --to-source 1.1.1.34

What is .34? I don't see a related PREROUTING rule for it...

> -A FORWARD -i eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT

This rule is not global (-i eth0 only) but looks like it should work
anyway...

> -A FORWARD -d 1.1.1.44 -i eth0 -o eth1 -p tcp -m tcp --dport 110
> --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -d 1.1.1.44 -i eth0 -o eth1 -p tcp -m tcp --dport 25
> --tcp-flags SYN,RST,ACK SYN -j ACCEPT

I'm assuming this is the mail server in question, with these inbound
mail rules.

> -A FORWARD -s 1.1.1.40/255.255.255.248 -i eth1 -m state --state
> RELATED,ESTABLISHED -j ACCEPT

I would create a single RELATED,ESTABLISHED rule instead of having these
separate ones.

> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.128.2 -i eth1 -o eth0
> -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.120.2 -i eth1 -o eth0
> -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.68 -i eth1 -o
> eth0 -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.72 -i eth1 -o
> eth0 -p tcp -m tcp --dport 53 --tcp-flags SYN,RST,ACK SYN -j ACCEPT

TCP DNS rules, all outbound.

> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.128.2 -i eth1 -o eth0
> -p udp -m udp --dport 53 -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 201.10.120.2 -i eth1 -o eth0
> -p udp -m udp --dport 53 -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.68 -i eth1 -o
> eth0 -p udp -m udp --dport 53 -j ACCEPT
> -A FORWARD -s 1.1.1.40/255.255.255.248 -d 200.199.252.72 -i eth1 -o
> eth0 -p udp -m udp --dport 53 -j ACCEPT

UDP DNS rules, all outbound.

> -A FORWARD -s 1.1.1.42 -d 10.0.0.1 -i eth1 -o eth2 -p tcp -m tcp
> --sport 1505 -j ACCEPT

Accepting a source port means that the destination port can be anything
so long as the source port is 1505 (which is unprivileged). It looks
like this is your internal network so not a big deal, but it can burn
you good if it handles Internet-sourced traffic.

> -A FORWARD -j LOG --log-prefix "FORWARD blocked: "

[Removed OUTPUT]

All of this looks OK to me, but there's definitely an issue with
conntrack not seeing DNS server #2's reply as RELATED,ESTABLISHED. I
would think this would be caught by your first RELATED,ESTABLISHED rule.
My advice would be to have one, at the top, without specifiying the
interface. See if that solves the problem.

Derick Anderson
###########################################

This message has been scanned by F-Secure Anti-Virus for Microsoft Exchange=
.
For more information, connect to http://www.f-secure.com/

