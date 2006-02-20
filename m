From: "James Strickland" <jstic04@cp.centennialcollege.ca>
Subject: Tricking NMAP
Date: Mon, 20 Feb 2006 12:15:41 -0500
Message-ID: <00d301c63641$476e6870$020a0aac@SOUTHWEST>
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

Hello, i am trying to set up something to further trick port scanners.  I
want to dnat all new connections to an inside server, and not have the
router crash!

currently, with my setup, a port scan on all ports should return that all
ports from 1-65534 are filtered. this is done by dnat'ing all new
connections to my wan interface over to an internal host.  The internal host
software responds with an RST.  Unfortunately, with all the new entries for
the router, it crashes.

is there anything i can set in proc to reserve more processes for such a
thing?  how about adding more memory, will that help?




