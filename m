From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Is this firewall good enough?
Date: Tue, 8 Jun 2004 11:44:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c44d3d$31567530$1201a8c0@admin>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I have set up the firewall with following rules:
>
> 1.  /sbin/iptables -A INPUT -s 127.0.0.1 -d 127.0.0.1
> -j ACCEPT

You could place this rule below the next, because this rule only matches
the first packet and the rest will be RELATED or ESTABLISHED.
This is done for performance reasons. When you look at the byte counters
of each rule, you'll notice that the rule below matches the most packets
by far.
However, you don't have a large script so I think you won't notice the
difference.

> 2.  /sbin/iptables -A INPUT -p tcp -m state --state
> ESTABLISHED,RELATED -j ACCEPT

I don't think you'll use tcp only. E.g. for DNS you need udp too, see
below.
Maybe it's better not to specify a protocol at all since this rule is
supposed to match all subsequent packets that have matched below.

> 3.  /sbin/iptables -A INPUT -p tcp --dport 20  --syn
> -j ACCEPT #ftp-data

You don't need the above rule. The initial connection is made to port
21/tcp. Port 20/tcp is RELATED.

> 4.  /sbin/iptables -A INPUT -p tcp --dport 21  --syn
> -j ACCEPT #ftp
> 5.  /sbin/iptables -A INPUT -p tcp --dport 22  --syn
> -j ACCEPT #ssh
> 6.  /sbin/iptables -A INPUT -p tcp --dport 25  --syn
> -j ACCEPT #smtp

> 7.  /sbin/iptables -A INPUT -p tcp --dport 53  --syn
> -j ACCEPT #DNS

DNS uses udp for normal lookups. Only in special cases tcp is used.

> 8.  /sbin/iptables -A INPUT -p tcp --dport 80  --syn
> -j ACCEPT #http
> 9.  /sbin/iptables -A INPUT -p tcp --dport 110 --syn
> -j ACCEPT #POP3
> 10. /sbin/iptables -A INPUT -p tcp --dport 143 --syn
> -j ACCEPT #IMAP
> 11. /sbin/iptables -A INPUT -p tcp --dport 443 --syn
> -j ACCEPT #https
> 12. /sbin/iptables -A INPUT -p tcp --dport 465 --syn
> -j ACCEPT #smtp over SSL
> 13. /sbin/iptables -A INPUT -p tcp --dport 993 --syn
> -j ACCEPT #IMAP over SSL
> 14. /sbin/iptables -A INPUT -p tcp --dport 995 --syn
> -j ACCEPT #POP3 over SSL

> 15. /sbin/iptables -P INPUT DROP
> 16. /sbin/iptables -P FORWARD DROP
> 17. /sbin/iptables -P OUTPUT ACCEPT

Put these 3 on top of your script so that the server is closed (almost)
immediately, depending on the script startup order, and after that the
appropriate ports are opened.

> I have following queries regarding the above firewall:
>
> 1. Does this effectively offer connections ONLY to the
> services I offer and nothing more than that?

Yes.

> 2. Does the rule 2 create any security loophole?

No, not that I know of.

> 3. This firewall allows passive as well as non-passive
> FTP connections. Is passive FTP connections   a
> security threat?

FTP is not secure by nature ; nothing is encrypted so everything can be
sniffed etc.
You could also do sftp (from OpenSSH, also running on port 22/tcp) but
that's a subsystem of SSH and not as customizable as most FTP servers
(afaik : on or off).

> 4. Is this firewall good enough to protect the server?
> If no, could you kindly comment how could I improve
> further?

You could check for tcp_flags. Certain combinations can be logged and/or
dropped.
Packets with state INVALID could normally be safely dropped.


Gr,
Rob


