From: angico <angico@yahoo.com>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 07:35:09 -0800 (PST)
Message-ID: <416274.29873.qm@web36802.mail.mud.yahoo.com>
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

hi, buddys. thanks for your attention, but...=0Anothing works, yet. and thi=
s option "--clamp-mss-to-pmtu" just send me an error: "iptables: Invalid ar=
gument". =0Aangico.=0A=0A----- Original Message ----=0AFrom: Cedric Blanche=
r <blancher@cartel-securite.fr>=0ATo: Pascal Hambourg <pascal.mail@plouf.fr=
.eu.org>=0ACc: netfilter@lists.netfilter.org=0ASent: Monday, February 26, 2=
007 12:09:25 PM=0ASubject: Re: strange behaviour=0A=0ALe lundi 26 f=E9vrier=
 2007 =E0 15:53 +0100, Pascal Hambourg a =E9crit :=0A> I doubt this is a fi=
rewall issue. It may be an MTU issue.=0A=0AHowever, Netfilter can help:=0A=
=0A   iptables -t mangle -A FORWARD -o ppp0 -j TCPMSS --clamp-mss-to-pmtu=
=0A=0A=0A-- =0Ahttp://sid.rstack.org/=0APGP KeyID: 157E98EE FingerPrint: FA=
62226DA9E72FA8AECAA240008B480E157E98EE=0A>> Hi! I'm your friendly neighbour=
hood signature virus.=0A>> Copy me to your signature file and help me sprea=
d!=0A=0A=0A=0A=0A=0A=0A =0A________________________________________________=
____________________________________=0ABe a PS3 game guru.=0AGet your game =
face on with the latest PS3 news and previews at Yahoo! Games.=0Ahttp://vid=
eogames.yahoo.com/platform?platform=3D120121

