From: "Yogini Parkhi" <yparkhi@bivio.net>
Subject: RE: log all dropped packets
Date: Thu, 3 Oct 2002 15:20:00 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <385DA3327471554CA86AACAA2BBB81302513D9@plstnexc01.corp.networkrobots.com>
Reply-To: "Yogini Parkhi" <yparkhi@bivio.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="euc-kr"
To: SB CH <chulmin2@hotmail.com>, netfilter@lists.netfilter.org

For Q1. You can do a little trick and create a user chain called LOGDROP =
and then use that.
e.g.
iptables -N LOGDROP
iptables -j LOG -log-preifx "LOGDROP: "

now, where ever you were using target DROP, use LOGDROP instead. This =
way you can make sure you log things before dropping.

For logging traffic handled by default policy you will have to have a =
last rule in all default chains - INPUT, OUTPUT, FORWARD that logs =
traffic with the right prefix.

Iptables -A INPUT -j LOG -log-prefix "INPUTDEFAULT: "
Iptables -A INPUT -j LOG -log-prefix "FORWARDDEFAULT: "
Iptables -A INPUT -j LOG -log-prefix "OUTPUTDEFAULT: "

Hope this helps you.
-Y



-----Original Message-----
From: SB CH [mailto:chulmin2@hotmail.com]
Sent: Tuesday, October 01, 2002 6:19 PM
To: netfilter@lists.netfilter.org
Subject: log all dropped packets

Hello, all.

my two questions are similar.

Question1.
I would like to log all Dropped packet.
How can I write a log about all dropped packet?


Question2.
Surely, my default policy is DROP.
and one can't log about related default Policy.
How can I log packet information about default policy related?


Thanks in advance.



_________________________________________________________________
=BA=B8=B4=D9 =BA=FC=B8=A3=B0=ED =BA=B8=B1=E2 =C6=ED=C7=D1 =B4=BA=BD=BA. =
=BF=C0=B4=C3=C0=C7 =C8=AD=C1=A6=B4=C2 MSN =B4=BA=BD=BA=BF=A1=BC=AD =
=C8=AE=C0=CE=C7=CF=BC=BC=BF=E4.
http://www.msn.co.kr/news/

