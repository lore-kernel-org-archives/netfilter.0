From: Stewart Thompson <stewart.thompson@shaw.ca>
Subject: RE: log all dropped packets
Date: Tue, 01 Oct 2002 21:59:38 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FLEKIPPLAEDMJMOOBBDPOENCDAAA.stewart.thompson@shaw.ca>
References: <F44BHkJZbK4DAx0hIEA000051cb@hotmail.com>
Reply-To: stewart.thompson@shaw.ca
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <F44BHkJZbK4DAx0hIEA000051cb@hotmail.com>
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

Hi:

=09Try something like this at the end of each set of Rules.

$IPTABLES - INPUT -j LOG --log-level info  --log-prefix "FW INPUT  "
$IPTABLES - INPUT -j DROP
=09Do the same for Forward and Output.

These rules should log all the dropped packets before they hit your
Drop Policy I believe. Hope that helps.

Stu........

-----Original Message-----
=46rom: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of SB CH
Sent: October 1, 2002 6:19 PM
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
=BA=B8=B4=D9 =BA=FC=B8=A3=B0=ED =BA=B8=B1=E2 =C6=ED=C7=D1 =B4=BA=BD=
=BA. =BF=C0=B4=C3=C0=C7 =C8=AD=C1=A6=B4=C2 MSN =B4=BA=BD=BA=BF=A1=
=BC=AD =C8=AE=C0=CE=C7=CF=BC=BC=BF=E4.
http://www.msn.co.kr/news/




