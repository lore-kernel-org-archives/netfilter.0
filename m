From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Win2K + and NAT
Date: Mon, 19 Sep 2005 14:59:08 -0400
Message-ID: <1127156349.25000.14.camel@localhost>
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
To: Netfilter users list <netfilter@lists.netfilter.org>

Does anyone have a work around for Outlook and Windows File & Print
services through a NAT gateway in a Win2K and XP environment with Active
Directory? We have a situation where we do have to pass this kind of
traffic through such a gateway and it breaks.

We see the client send SAM LOGON requests on netbios datagram service
138/udp.  I would guess the client is registering but I'm not sure.  The
problem is that the netbios header contains the source IP address.  Once
we NAT, this does not match the IP header IP address.  We see the
packets arriving at the AD controller with the NAT address but we see
the replies being sent to the original address (the one in the NetBIOS
header).

It appears there is no nat helper for netbios dgm although there is the
start of one at http://suif.stanford.edu/~csapuntz/ip_nat_netbios.c - in
fact, if no one has a work around, we might be interested in sponsoring
someone to finish and submit this patch.  Please let me know if you are
interested.

Has anyone gotten such a set up to work? Perhaps there is a way to
manipulate the behavior of Outlook and Windows to get the information
via a different protocol? Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


