From: "Tarek W." <ticallion@terra.net.lb>
Subject: ip_conntrack and the mark target
Date: Sun, 01 Dec 2002 19:05:17 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1038776693.2023.19.camel@carve.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Is there any patches I should be aware of that make the mark persist in
incoming packets if I have an outgoing connection (dst port) match which sets the
mark?! I'm thinking in conjunction with ip_conntrack?!

If yes, would it eat more cpu cycles then to have a separate match for
the incoming traffic of that connection which marks the packets
appropriately?!


