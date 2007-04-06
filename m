From: Dupond Jean <mootrul@yahoo.fr>
Subject: IETF RFC 4787 and NAT behaviour recommendations
Date: Fri, 6 Apr 2007 02:45:47 -0700 (PDT)
Message-ID: <689965.86296.qm@web51408.mail.re2.yahoo.com>
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

=0A=0AHi,=0A=0A=0A=0AI saw new recommendation about NAT behaviour have been=
 (or are about to be) released :=0A=0Ahttp://tools.ietf.org/html/draft-ietf=
-behave-tcp=0A=0Ahttp://tools.ietf.org/html/rfc4787=0A=0A=0A=0AI=0Amade a r=
apid test that seems to show that actual version of=0Anetfilter/iptables wi=
th a basic SNAT or MASQUERADE rule like this :=0A=0Aiptables -t nat -A POST=
ROUTING -o ppp0 -j MASQUERADE=0A=0Aimplement a "Address and port dependant =
filering behaviour" (for UDP).=0A=0A=0A=0A(recommendation is Endpoint indep=
endent or Address dependent filtering)=0A=0A=0A=0AIs it possible (how ?) to=
 have a "Endpoint independent" for example ?=0A=0AIf not, is the netfilter =
developpement team generaly tending to try to be compliant with IETF recomm=
endations ?=0A=0A=0ABest Regards,=0A=0A=0AJean=0A=0A=0A=0A=0A=0A=0A=0A=09=
=0A=0A=09=0A=09=09=0A______________________________________________________=
_____________________ =0AD=E9couvrez une nouvelle fa=E7on d'obtenir des r=
=E9ponses =E0 toutes vos questions ! =0AProfitez des connaissances, des opi=
nions et des exp=E9riences des internautes sur Yahoo! Questions/R=E9ponses =
=0Ahttp://fr.answers.yahoo.com

