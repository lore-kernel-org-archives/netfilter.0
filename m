From: "Sussman, Scott" <ssussman@starentnetworks.com>
Subject: connection refused trying to bind AF_INET to AF_NETLINK/NETFILTER
	socket
Date: Mon, 14 May 2007 17:24:49 -0400
Message-ID: <7CCD07160348804497EF29E9EA5560D702233BA1@exchtewks2.starentnetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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


Hi,=20
I am trying to use the NETFILTER libraries to read from iptable=20
queues. I am running linux 2.6.15 and have super-user priv's. But when=20
I try to run the sample program from netfilter (nfq_test.c) it complains =
that the connection was refused during the unbind, bind, or  =
create_queue=20
routines. I verified that the socket gets created correctly but then I =
get:=20

melty4:/localdisk/stargen# ./a.out
opening library handle=20
Socket: 3=20
unbinding nfnetlink_queue as nf_queue handler for AF_INET=20
sendmsg on socket: 3=20
nfnl_talk: sendmsg(netlink) Connection refused=20
error during nfq_unbind_pf()=20


Any help would be greatly appreciated.

thanks,=20
Scott=20


"This email message and any attachments are confidential information of =
Starent Networks, Corp. The information transmitted may not be used to =
create or change any contractual obligations of Starent Networks, Corp.  =
Any review, retransmission, dissemination or other use of, or taking of =
any action in reliance upon this e-mail and its attachments by persons =
or entities other than the intended recipient is prohibited. If you are =
not the intended recipient, please notify the sender immediately -- by =
replying to this message or by sending an email to =
postmaster@starentnetworks.com -- and destroy all copies of this message =
and any attachments without reading or disclosing their contents. Thank =
you."

