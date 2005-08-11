From: "Joris Dobbelsteen" <joris.dobbelsteen@mail.com>
Subject: Use IP connection tracking only for input and output chains
Date: Thu, 11 Aug 2005 13:45:12 +0200
Message-ID: <B9833546B2643B43A56C4E962E13174602A989@nehemiah.joris2k.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: NetFilter User List <netfilter@lists.netfilter.org>

Dear,

I've a question whether it is a supported configuration where the
connection tracking module is solely used for traffic local to the
device.

I don't need any tracking on the forwarded traffic, however for local
traffic it could increase protection. Forwarded traffic only needs some
stateless filtering (drop some specific kinds of traffic I dislike, such
as RIP, OSPF, ...).

The device is a router for my wireless WLAN and will probably be
supplemented by a second system. Connection tracking is not very useful
here...

The device is a Linksys WRT54G running OpenWRT (Linux 2.4) and iptables
1.3.1.

- Joris Dobbelsteen

