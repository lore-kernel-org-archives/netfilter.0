From: "Gene Dellinger" <gene@poh.com>
Subject: FORWARD Chain Question
Date: Fri, 9 Dec 2005 14:40:04 -1000
Message-ID: <BOEKIIIKCIBKDMDMHHLLIEPHDEAA.gene@poh.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

On a multi-homed machine being used as a firewall, if
a packet is forward'd from one interface to another.
Does the packet enter the in at PRE-ROUTING portion of iptables
chain again for that interface? It may seem obvious but
I just want to make sure I am clear on that aspect of the
chain traversal.

Thanks
Gene D.

