From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Ip_conntrack_ftp with PASSIVE FTP does not work
Date: Wed, 13 Jul 2005 11:38:36 +0200
Message-ID: <42D4E11C.2080100@mnemon.de>
References: <04EE7AD0450F7B498BA216312943A1A102937F25@blrse201.ap.infineon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <04EE7AD0450F7B498BA216312943A1A102937F25@blrse201.ap.infineon.com>
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
> Hi all,
> 
> For me, ip_conntrack_ftp does not work for PASSIVE ftp.
> 
> In the firewall rules, I blocked everything and put the following rules,
> iptables -A INPUT -p tcp --sport 21 -m state --state ESTABLISHED,NEW -j
> ACCEPT 
> iptables -A OUTPUT -p tcp --dport 21 -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT 
> And when I try to ftp, the control channel goes through firwall, but
> data channel fails to pass through.
So, your firewall connects to the FTP server, why not. First of all make
sure that ip_conntrack_ftp is compiled into the kernel or as a module.
If compiled as a module, make sure it is loaded.

As your firewall connects to the FTP server and your OUTPUT policy seems
to be DROP or REJECT, you need rules like these:

iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp --dport 21 --syn -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

Hmm, many people, including myself, think, that filtering in OUTPUT is
pointless. More troublesome than usefull. If you decide to set OUTPUT
policy to ACCEPT, you don't need the first two rules. Up to you.

Have a nice time,

Joerg


