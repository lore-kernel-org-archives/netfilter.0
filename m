From: "LinuXKiD" <gregoriandres@yahoo.com.ar>
Subject: RE: vpn masquerading
Date: Thu, 19 Jan 2006 11:33:26 -0300
Message-ID: <NHBBLNDNFKDMKNNKGOMMAEABOCAA.gregoriandres@yahoo.com.ar>
References: <55135.193.173.147.3.1137680352.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <55135.193.173.147.3.1137680352.squirrel@webmail.sterenborg.info>
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
To: netfilter <netfilter@lists.netfilter.org>



-> > -> > lsmod:
-> > -> >
-> > -> > Module                  Size  Used by    Not tainted
-> > ->
-> > -> ...
-> > ->
-> > -> > ip_nat_proto_gre        1508   0  (unused)
-> > -> > ip_nat_pptp             2572   0  (unused)
-> > ->
-> > -> I'm not sure ; perhaps you need to unload ip_nat_pptp. I thought
-> > you
-> > -> needed this when *you* run a PPTP server *behind* the firewall.
-> >
-> > Thank you, but PPTP server is located on Internet, not behind
-> > firewall.
-> 
-> Yes, that's why I mentioned it : you have the same situation as I had
-> back then and I needed to unload this module. But, YMMV.

outch !!


-> Still, we don't know what you rule have so far concerning pptp...
-> It's a little hard to give advice this way.


I only have a "MASQUERADE" rule in POSTROTING nat table.
That's all. 

I need a specific rule to masquerade VPN ?

thank you

