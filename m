From: "Gorm Jensen" <gjensen@magma.ca>
Subject: Erratic Logging - References to User Defined Chains
Date: Fri, 15 Nov 2002 17:40:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c28cf8$138e8300$0201a8c0@gorm>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Logging of packets on my RH 7.2 system, using kernel 2.4.19 is
erratic.  Some blocked packets are not logged.  I block and log
packets through a user defined chain, which now has 63 references.

Is there a limit to the number of references to a user defined chain?


