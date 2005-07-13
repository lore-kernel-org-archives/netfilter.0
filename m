From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Ip_conntrack_ftp with PASSIVE FTP does not work
Date: Wed, 13 Jul 2005 13:38:48 +0200
Message-ID: <42D4FD48.5050100@mnemon.de>
References: <04EE7AD0450F7B498BA216312943A1A102937F40@blrse201.ap.infineon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <04EE7AD0450F7B498BA216312943A1A102937F40@blrse201.ap.infineon.com>
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

Chandra.Vempali@infineon.com schrieb:
> My ip_conntrack_ftp module gets loaded properly.
> 
> If I keep a rule like "iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT"
> It means that traffic is allowed to pass through for all ports which should not be done for security reasons.

No, it means that any packet on any port with any protocol that is in
state ESTABLISHED or RELATED is allowed to pass. Not *all* packets.
Especially SYN packets (in state NEW) don't hit this rule. So, if you
set policy to DROP and allow no NEW packets, no communication can be
established at all. On the other hand, if you allow NEW packets to a
certain port, ofcourse you also want the ESTABLISHED packets and
sometimes the RELATED packets (in case of FTP). So, I don't think this
is a security risc.

If I'm wrong, somebody correct me, please.

> As for passive FTP, I added two rules to allow traffic thru only 21 port.
> iptables -A INPUT -p tcp --sport 21 -m state --state  ESTABLISHED,NEW -j ACCEPT 
> iptables -A OUTPUT -p tcp --dport 21 -m  state --state NEW,ESTABLISHED,RELATED -j ACCEPT

As Jan pointed out, when using passive FTP the source port is not
necessarily 21 - commonly both sides use high ports. I think, the reason
is that your rules are "bound" to port 21, where no RELATED connection
can be established. Thus the rule doesn't match and you hit the DROP
policy. Give

iptables -I [IN | OUT]PUT [-p tcp] -m state \
         --state RELATED,ESTABLISHED -j ACCEPT

a chance for testing. I would bet, it works.

Have a nice time,

Joerg


