From: "Thomas Hilgert" <Thomas.Hilgert@hilgert.de>
Subject: RE: AW: snat dnat question
Date: Sun, 7 Jul 2002 13:51:53 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <8C14C590A51EB74285ADCA3DAD1A9DD705C11E@hilgert-srv1.internal.hilgert.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Content-Class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Here is a small picture and the iptables commands

#
# Setup masquerading for DMZ AND LAN
#
#                 ETH1: External (212.23.129.186)
#                       |
#                 +----------------+
#                 |    NATBOX      |
#                 +----------------+
#  ETH2:10.2.0.1  /               \   ETH0: 10.1.0.1
#               /                   \
#             /                       \
#  DMZ   +-----------+           +------------+ LAN
#
#
# SNAT all outgoing traffic
#
iptables -t nat -A POSTROUTING -o  eth1 -j MASQUERADE
#
# DNAT all incoming traffic to out DMZ WEB and MAIL Server (10.2.0.2)
#
#
iptables -t nat -A PREROUTING -i eth1 -j DNAT --to 10.2.0.2
#

