From: Allan Parreno <atparreno@yahoo.com>
Subject: question about String
Date: Fri, 24 Aug 2007 00:50:16 -0700 (PDT)
Message-ID: <620717.8047.qm@web43138.mail.sp1.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,=0A=0Ahow do i configure that all mp3 extention will block using ipta=
bles --string value?=0A=0Ais this correct?=0A=0A/sbin/iptables -I INPUT -j =
DROP -p tcp -s 0.0.0.0/0 -m string --string "*.mp3"=0A=0Athanks=0A=0A=0A   =
    =0A____________________________________________________________________=
________________=0AYahoo! oneSearch: Finally, mobile search =0Athat gives a=
nswers, not web links. =0Ahttp://mobile.yahoo.com/mobileweb/onesearch?refer=
=3D1ONXIC

