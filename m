From: richard lucassen <netfilter@lucassen.org>
Subject: Re: iptables jump to userdefined chain and ESTABLISHED,RELATED
 rules
Date: Sun, 12 Oct 2003 19:53:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031012195331.409596fc.netfilter@lucassen.org>
References: <20031010132641.2591d3b5.netfilter@lucassen.org>
	<1065889564.1268.11.camel@elendil.intranet.cartel-securite.net>
	<20031011194527.17273de9.netfilter@lucassen.org>
	<20031012111620.GB571@pcw.home.local>
Reply-To: reply2@lucassen.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031012111620.GB571@pcw.home.local>
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

On Sun, 12 Oct 2003 13:16:20 +0200
Willy TARREAU <willy@w.ods.org> wrote:

> You can share the user defined chains between several chains as long
> as they are in the same table and support the same arguments. Since
> the'state' match is valid from INPUT and FORWARD, it will work in a
> shared user chain.
> 
> However, if you use some illegal information, you'll either get error
> messages each time the rule is evaluated or get a never-matching rule.
> 
> eg:
> 
>   # iptables -A INPUT -j mychain
>   # iptables -A FORWARD -j mychain
>   # iptables -A mychain -o eth1 -j LOG --log-prefix "out_eth1"
> 
>   => Since the output interface (-o) is not defined when starting
>      from the INPUT chain, the rule will never match, and possibly
>      make the kernel complain.
> 
> But in a more general way, user chains are very useful to dissect
> rules by addresses, using only DROP, ACCEPT and RETURN. And in this
> case, it's easy to share them between different chains without risk.

Ok, but that does not answer my question ;-) Maybe I'm not so clear
in saying what I mean. Let me put it this way: Does the
ESTABLISHED,RELATED rule of the FORWARD chain handles all
ESTABLISHED,RELATED packets of a connection which was accepted as NEW in
a "child" chain? I think the answer is finally "yes". I did this simple
test:

case 1
**************************************************************
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A FORWARD -p tcp --dport 22 -j CH_SSH
[..]
$IPT -A CH_SSH -m state --state NEW -s 1.2.3.4 -j ACCEPT
**************************************************************


case 2 (I swapped rule 1 and 2)
**************************************************************
$IPT -A FORWARD -p tcp --dport 22 -j CH_SSH
$IPT -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
[..]
$IPT -A CH_SSH -m state --state NEW -s 1.2.3.4 -j ACCEPT
**************************************************************


case 3 (I swapped rule 1 and 2 AND used an extra ESTABLISHED,RELATED
rule)
**************************************************************
$IPT -A FORWARD -p tcp --dport 22 -j CH_SSH
$IPT -A FORWARD -m state--state ESTABLISHED,RELATED -j ACCEPT
[..]
$IPT -A CH_SSH -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A CH_SSH -m state --state NEW -s 1.2.3.4 -j ACCEPT
**************************************************************


Case 1 works, the new connection was accepted by the CH_SSH and all
ESTABLISHED,RELATED packets are handled by the ESTABLISHED,RELATED rule
in the FORWARD chain. AFAIUI this is proven by the fact that case 2 does
not work. Case 3 works as well.

case 1. This works:
$ telnet 1.2.3.4 22
Trying 1.2.3.4...
Connected to 1.2.3.4.
Escape character is '^]'.
SSH-2.0-OpenSSH_3.7.1p2
^]
telnet> q
Connection closed.

case 2. There is a connection started, but ESTABLISHED,RELATED packets
apparently are dropped:
$ telnet 1.2.3.4 22
Trying 1.2.3.4...
Connected to 1.2.3.4.
Escape character is '^]'.
....(wait 1 minute)....
^]
telnet> q
Connection closed.

To speak "man iptables" language: in both cases the FORWARD chain has
"seen" the start of the connection, so the ESTABLISHED,RELATED rule of
the FORWARD chain will accept the rest of the packets of this
connection. So, no need for an extra ESTABLISHED,RELATED rule in each
user defined chain.

Please correct me if I'm wrong.

R.

-- 

___________________________________________________________________
Recursion: see recursion

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
-- 
___________________________________________________________________
Recursion: see recursion

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+

