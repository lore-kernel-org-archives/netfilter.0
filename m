From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: Routing Public IPs over NAT Address Space
Date: Mon, 14 Jul 2003 12:57:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c34a42$34c8aed0$1001a8c0@s3ac>
References: <200307141052.AA122028212@mail.alberni.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <200307141052.AA122028212@mail.alberni.net>
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
To: techlists@alberni.net, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>



I'm gonna take a shot and guess your going some vpn routing.  Well
either way the solution is the same .. Don't route the packets meant for
the public domain. Then just route them using a standard routing table
entry. I clipped the following rule from my rules. It basically states
NAT everything outgoing except 10.0.0.0/24 which in this case is my VPN.
After that routing is handled via the routing table.


IPTABLES -t nat -A POSTROUTING -o $EXTIF ! -d 10.0.0.0/24 -j SNAT --to
$EXTIP 

> Just like the subject says; is there any way to route a 
> public IP/subnet over a NAT address space?
> 
> -- 
> Aaron Clausen
> 


