From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: connmark
Date: Thu, 13 Jan 2005 15:42:58 +0100
Message-ID: <41E688F2.10607@uplink-verein.ch>
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

i have some numbers, which i cannot explain:

  50M   30G CONNMARK   all  --  any    any     anywhere             anywh=
ere            CONNMARK=20
restore
  451K  265M ACCEPT     all  --  any    any     anywhere             anyw=
here            MARK match 0x3
61830   43M ACCEPT     all  --  any    any     anywhere             anywh=
ere            MARK match 0x2
  110K   38M ACCEPT     all  --  any    any     anywhere             anyw=
here            MARK match 0x1

there is an obvious difference. 50M !=3D 451K + 61830 + 110K.

in front of this rule, i have some rules without marking (accept traffic =
for special networks).
after this MARK rules i have a lot of layer7 rules with marking.
my last rule is MARK.

   50M   30G CONNMARK   all  --  any    any     anywhere             anyw=
here            CONNMARK=20
set 0x3
   50M   30G CONNMARK   all  --  any    any     anywhere             anyw=
here            CONNMARK save
   50M   30G ACCEPT     all  --  any    any     anywhere             anyw=
here
(END)

IMHO, traffic for the special network will never reach this mark rules, s=
o this should not influence=20
the numbers. the rest is marked by 1, 2 or 3. unknown traffic should be m=
arked with 3.

any ideas?

regards
moritz

--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland

