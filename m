From: Chris Wilson <chris@netservers.co.uk>
Subject: Re: Masq support for IPSEC ?
Date: Mon, 7 Jul 2003 14:24:38 +0100 (BST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0307071416110.16552-100000@localhost>
References: <5E415169BC383A4EB17C22078E27D5B25015CF@dcba01.softec.sk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5E415169BC383A4EB17C22078E27D5B25015CF@dcba01.softec.sk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brandis Jaroslav <jaroslav.brandis@softec.sk>
Cc: netfilter@lists.netfilter.org

Hi Brandis,

> Hello...
> 
> Is ther  way to make Ipsec tunel over masqueraded gw  ? Something like
> PPTP support for masq ? 

IPsec is designed to protect against "tampering" with the packets, and 
that includes NAT. Also, the IKE protocol makes assumptions about the IP 
addresses of machines, which are violated by NAT. So "normal" IPsec cannot 
be run over NAT, as far as I'm aware. Nothing in iptables would be able to 
fix that.

There is a draft IETF standard for IPsec NAT traversal (also called
NAT-T), which encapsulates the IPsec packets in UDP to protect them from
NAT. Some IPsec implementations have built-in support for this, and some,
such as FreeSWAN, have optional patches to add support. It will only work
if both ends support it, but it may be what you want.

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |


