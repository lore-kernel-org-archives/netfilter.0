From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ftp conntrack - nat problem
Date: Wed, 9 Nov 2005 09:18:03 -0600
Message-ID: <200511090918.03493.rob0@gmx.co.uk>
References: <fc38b710511072303w6144c3a7i3068e781c871799d@mail.gmail.com>
	<200511081336.51769.rob0@gmx.co.uk>
	<fc38b710511090331r6c6943faw875965864a056f21@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fc38b710511090331r6c6943faw875965864a056f21@mail.gmail.com>
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

On Wednesday 2005-November-09 05:31, Dave Strydom wrote:
> -A PREROUTING -d 209.212.xxx.xxx -p tcp -m tcp --dport 20 -j DNAT
> --to-destination 192.168.0.220:20
> -A PREROUTING -d 209.212.xxx.xxx -p tcp -m tcp --dport 21 -j DNAT
> --to-destination 192.168.0.220:21

If you're running an FTP server behind NAT, you would only DNAT 21. 
Ftp-data (tcp/20) is used for outgoing connections to the client. I 
doubt this is your problem, though. Nothing will match that rule unless 
you're connecting an FTP client on the firewall to a remote site.

> -A POSTROUTING -s 192.168.0.0/255.255.255.0 -j MASQUERADE

In general if you have a static IP (as in "not changing ever", not "you 
pay the ISP more and get custom rDNS") the SNAT target is better.

> *filter
>
> :INPUT ACCEPT [2:246]
> :FORWARD ACCEPT [6:1109]

ACCEPT policies can be fine, but you generally should have rules to 
REJECT or DROP the traffic you don't want.

> :OUTPUT ACCEPT [44:16200]
> :bad_tcp_packets - [0:0]
> :icmp_packets - [0:0]
> :rbl_packets - [0:0]
> :tcp_allowed - [0:0]
> :tcp_filtered_packets - [0:0]
> :tcp_packets - [0:0]
> :udp_packets - [0:0]
>
> -A INPUT -s 127.0.0.1 -j ACCEPT

First rule? Maybe "-i lo", but not "-s 127.0.0.1". An attacker could 
route packets to you which claim to have a source address of 127.0.0.1, 
and you're accepting them.

It's a minor weakness, but perhaps it can help you understand the 
difference between specifying an input interface ("lo" is always 
secure, at least insofar as you trust your own users) or a source IP 
address. Packet headers can be spoofed! But outsiders can only come in 
on your external interface.

> -A INPUT -s 192.168.0.0/255.255.255.0 -j ACCEPT

Same issue here. Packets claiming to be from your LAN are accepted.

> -A INPUT -d 192.168.0.0/255.255.255.0 -m state --state
> NEW,RELATED,ESTABLISHED -j ACCEPT

Huh? This looks like it might belong in FORWARD. But "-d"? What did you 
think this rule would do?

> -A INPUT -d 209.212.xxx.xxx -m state --state RELATED,ESTABLISHED -j
> ACCEPT

I will assume 209.212.xxx.xxx is this machine's external IP. Please be 
explicit when you are munging information.

This rule means that your firewall machine gets replies to the 
connections it initiates.

> -A INPUT -p tcp -j tcp_filtered_packets 
> -A INPUT -p tcp -j rbl_packets
> -A INPUT -p tcp -j tcp_packets
> -A INPUT -p udp -j udp_packets
> -A INPUT -p icmp -j icmp_packets

> -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT

Why? See above about ftp-data.

> -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT

You have DNAT'ed port 21 above. This rule won't be matched.

> -A INPUT -p tcp -m tcp --dport 25 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
> -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

This machine is running public SMTP, HTTP and HTTPS servers.

> -A INPUT -p tcp -j DROP

This overrides the default ACCEPT policy but only for TCP.

> -A FORWARD -p tcp -m tcp --dport 20 -j ACCEPT
> -A FORWARD -p tcp -m tcp --dport 21 -j ACCEPT

These should ensure the NAT'ed FTP server is accessible from outside.

> -A FORWARD -s 192.168.0.220 -p tcp -j ACCEPT

And any TCP connections from that machine are allowed.

> -A OUTPUT -s 192.168.0.0/255.255.255.0 -m state --state
> NEW,RELATED,ESTABLISHED -j ACCEPT
> -A OUTPUT -s 209.212.xxx.xxx -m state --state NEW,RELATED,ESTABLISHED
> -j ACCEPT

Explained yesterday why this is pointless.

> -A udp_packets -p udp -m udp --dport 53 -j ACCEPT 
> -A udp_packets -s 196.36.10.xxx -p udp -j ACCEPT
> -A udp_packets -p udp -j ACCEPT

This is jumped to from INPUT, and all it does is ACCEPT, which is the 
same as your default policy.

> COMMIT

The other chains you defined are not used!

> And here is the output of my tethereal:
snip
> What I do notice is this:
>
> FTP [TCP Out-Of-Order] Response: 150 Opening BINARY mode data
> connection for LANDING_16.jpg
> and
> FTP [TCP Previous segment lost] Response:

Yes, I would guess that is the problem, but I don't know what would 
cause it. Again from yesterday, I doubt it's a netfilter issue.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

