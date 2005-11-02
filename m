From: Peter.Muller@gmx.at
Subject: libipq: How to get PIDs for packets
Date: Wed, 2 Nov 2005 17:17:18 +0100 (MET)
Message-ID: <19264.1130948238@www61.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello!

I'm using libipq to filter packets in userspace. Is there a way provided by
the API of libipq to get the PID of the process the packet is going to or
coming from?

If this is not possible I'm thinking of determinig the PIDs with the port
values in the packets via lsof. The disadvantge is that this is not possible
for every protocol (eg ICMP). Thus, this is not an ideal solution.

Any other ideas are welcome.

-Peter

--=20
10 GB Mailbox, 100 FreeSMS/Monat http://www.gmx.net/de/go/topmail
+++ GMX - die erste Adresse f=FCr Mail, Message, More +++

