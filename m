From: "Manuel Schmitz" <Port17@gmx.net>
Subject: -m iplimit
Date: Wed, 23 Mar 2005 22:16:37 +0100 (MET)
Message-ID: <7866.1111612597@www37.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

Hello,

I would like to limit the number of connections an IP is allowed to open.
(My server is a woody router box.)

# iptables -A FORWARD -s 192.168.0.203 -m iplimit --iplimit-above 100 -j
DROP

The result is always:
# iptables: No chain/target/match by that name

I can't load the module iplimit:
# modprobe ipt_iplimit
# modprobe: Can't locate module ipt_iplimit

while
# modprobe ipt_limit
works fine.=20

I found the libipt_iplimit.so module in the same place as lipipt_limit.so.
So, why doesn't it work?=20

--Manuel




--=20
"Happy ProMail" bis 24. M=E4rz: http://www.gmx.net/de/go/promail
Zum 6. Geburtstag gibt's GMX ProMail jetzt 66 Tage kostenlos!

