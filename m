From: angico <angico@yahoo.com>
Subject: Re: strange behaviour
Date: Mon, 26 Feb 2007 08:21:33 -0800 (PST)
Message-ID: <768065.25159.qm@web36815.mail.mud.yahoo.com>
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

GREAT, GUYS! IT WORKED!!!!!! I THANK YOU VERY MUCH for the help!=0Aangico.=
=0A=0A=0A----- Original Message ----=0AFrom: Cedric Blancher <blancher@cart=
el-securite.fr>=0ATo: angico <angico@yahoo.com>=0ACc: netfilter@lists.netfi=
lter.org=0ASent: Monday, February 26, 2007 1:07:55 PM=0ASubject: Re: strang=
e behaviour=0A=0ALe lundi 26 f=E9vrier 2007 =E0 07:35 -0800, angico a =E9cr=
it :=0A> hi, buddys. thanks for your attention, but...=0A> nothing works, y=
et. and this option "--clamp-mss-to-pmtu" just send me an error: "iptables:=
 Invalid argument". =0A> angico.=0A=0AMy mistake.=0AAs Pascal stated, you h=
ave to specify a "-p tcp --tcp-flags SYN,RST SYN"=0Aas well, as TCPMSS clam=
ping only works on TCP packets with SYN flag set:=0A=0A        iptables -t =
mangle -A FORWARD -o ppp0 -p tcp \=0A           --tcp-flags SYN,RST SYN -j =
TCPMSS --clamp-mss-to-pmtu=0A=0AIt should work better.=0A=0A=0A-- =0Ahttp:/=
/sid.rstack.org/=0APGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA24=
0008B480E157E98EE=0A>> Hi! I'm your friendly neighbourhood signature virus.=
=0A>> Copy me to your signature file and help me spread!=0A=0A=0A=0A=0A=0A =
=0A________________________________________________________________________=
____________=0AHave a burning question?  =0AGo to www.Answers.yahoo.com and=
 get answers from real people who know.

