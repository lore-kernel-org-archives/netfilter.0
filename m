From: John Friel III <john@frieltek.com>
Subject: RE: upgrade to iptabels from ipchains
Date: Wed, 28 May 2003 13:31:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6B61CBDA8C62344EB172855F4D94D74C042F3C@alpha.frieltek.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>
Cc: =?iso-8859-1?Q?=27Leonardo_Rodrigues_Magalh=E3es=27?= <leolistas@solucoesip.net>

>     would became this in iptables
> 
> iptables -N soporte
> iptables -A soporte -s 10.0.1.1 -j ACCEPT
> iptables -A soporte -j DROP
> iptables -A FORWARD -s 10.0.0.0/25 -j soporte
> iptables -t nat -A POSTROUTING -s 10.0.1.1 -j MASQUERADE

And it should be noted that with these rules in place, all packets that get
forwarded to the soporte chain will get DROPPED because the forward rule
only forwards IP's in the range of 10.0.0.0-10.0.0.127 and the accept range
is restricted to -only- IP 10.0.1.1.  

The 4th rule should be:

iptables -A FORWARD -s 10.0.0.0/16 -j soporte




Cheers!
John Friel III
Frieltek Consulting, Inc.

