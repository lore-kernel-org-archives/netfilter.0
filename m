From: "E-GIM Security" <security@e-gim.es>
Subject: Problemas with ULOG
Date: Thu, 21 Nov 2002 14:18:58 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NEBBKLENIBMGHGCLGBPIGEPBCCAA.security@e-gim.es>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


	Hi,

	I'm using RH 8.0 and i think kernel is ok (ULOG Target support, ....). I
test with ulog 0.97 and 0.98. I test with kernel 2.4.18 and 2.4.19

	 If I try use ULOG target, for example: iptables -A INPUT -s 192.168.0.1 -p
tcp -j ULOG --log-prfix "test", the command fails and say "Bad argument
'test'". Why? What it not work?

	Thanks

Jos=E9 Antonio Garc=EDa Garc=EDa
Jefe Departamento Desarrollo

GIM - IT Deusto	+34 952700010
	+34 952700670
C/ Merecillas, 54. Bajo	+34 952702928
29200 Antequera (M=E1laga)* security@e-gim.es
ESPA=D1A		http://www.e-gim.es






