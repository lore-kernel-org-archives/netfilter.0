From: "Michael Frank" <mhf@linuxmail.org>
Subject: Qustion wrt state RELATED,ESTABLISHED
Date: Wed, 07 Jul 2004 11:48:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsaq0vou24evsfm@smtp.pacific.net.th>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org


Is my  assumtion correct that state RELATED,ESTABLISHED checks all flags
for match and thus this state can (and should be for performance reasons)
be the first in each table ?


Chain INPUT (policy DROP 0 packets, 0 bytes)
  pkts bytes       target     prot opt in     out     source             =
  destination
15172 2029K ACCEPT     all  --  any    any     anywhere             anywh=
ere           state RELATED,ESTABLISHED
  0       0             BADTCP     tcp  --  any    any     anywhere      =
       anywhere           tcp flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
....

Chain BADTCP (6 references)
  pkts bytes target     prot opt in     out     source               dest=
ination
     0     0 LOG        all  --  any    any     anywhere             anyw=
here           limit: avg 3/min burst 3 LOG level alert prefix `ipt - Blo=
cked Bad TCP flag: '
     0     0 DROP       all  --  any    any     anywhere             anyw=
here

	Thank you
	Michael

