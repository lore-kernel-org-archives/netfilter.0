From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: nf-mark
Date: Tue, 11 Jan 2005 11:38:10 +0100
Message-ID: <41E3AC92.3020104@uplink-verein.ch>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

hi

can I use netfilter marks as:

6402 6617K MARK       icmp --  *      *       0.0.0.0/0            0.0.0.=
0/0           icmp type 0=20
MARK set 0x1

in my own application?
which library?

goal: i want to change bandwidthd (at the moment it classifies packets by=
 dst-port).

cheers
moritz

--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland

