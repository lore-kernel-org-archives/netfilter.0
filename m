From: Val Schmidt <vschmidt@ldeo.columbia.edu>
Subject: Masquerade with multiple routes
Date: Thu, 8 Jul 2004 13:02:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8788FC46-D100-11D8-B22D-000D93C19C8E@ldeo.columbia.edu>
Mime-Version: 1.0 (Apple Message framework v618)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

In previous posts here and elsewhere, there was a bug listed in which a 
Masquerade statement would fail when there are multiple routes to a 
network. One would see "MASQUERADE: Route sent us somewhere else" in 
the system log.

Does anyone know if this has been fixed in any of the latest versions?

I have a network redundant meshed network in which routes are generated 
dynamically using ospf. However I get these errors when trying to route 
to networks in which the number of hops is the same in more than one 
direction.

Anyone have any ideas?

-Val
------------------------------------------------------------------
Val Schmidt
Lamont-Doherty Earth Observatory of Columbia University
61 Route 9W
Palisades, NY 10964
m: 614 286 3726
vschmidt[at]ldeo.columbia.edu


