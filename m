From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Patch-o-matic help
Date: Mon, 7 Jul 2003 15:49:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E6D65A6EE5AAD6119DE800B0D03DA0C5289714@MS_LEU1>
References: <Pine.LNX.4.44.0307071345550.16552-100000@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0307071345550.16552-100000@localhost>
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

> By the way, if you make a custom kernel with the PPTP NAT 
> patch, then it 
> may cause problems with running a PPTP server on the same machine (at 
> least, I saw this in one case, but I didn't build that kernel 
> so I don't 
> know exactly which patch was used).

I have seen this happening too with kernels I built myself.

http://www.netfilter.org/documentation/pomlist/pom-extra.html#pptp-connt
rack-nat :
----
Note that this code currently has limitations
- can only NAT connections from PNS to PAC
- doesnt' support multiple calls within one session
----

So, what I think I should read here is that it isn't needed (read : you
should not use) if you have Poptop running on the same box as iptables
as no conntrack or nat is needed. (Correct me if I'm wrong, but that is
my experience..)

OTOH, if you have pptp clients (*not* a server) behind iptables then you
should only use ip_conntrack_pptp.
When you have this setup, don't load ip_nat_pptp because you won't be
able to connect to Poptop anymore.
In my case ; when I don't load ip_conntrack_pptp then sometimes I can
connect to Poptop and sometimes not. With ip_conntrack_pptp this
behaviour is solved.


Rob


