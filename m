From: =?ISO-8859-1?Q?J=FAlio_C=E9sar?= de =?ISO-8859-1?Q?Magalh=E3es?=
	<jcesar@fnde.gov.br>
Subject: Target ROUTE
Date: Wed, 5 Jan 2005 09:23:51 -0200
Message-ID: <20050105092351.2652e925@jcesar.fnde.gov.br>
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

i need all my network trafic to any host on 995 port goes to another gatewa=
y then the default. So i execute the following iptables command:
iptables -t mangle -A OUTPUT -p tcp --dport  995 -j ROUTE --gw x.x.x.x
where x.x.x.x is my another gateway .

The problem  when i execute the iptables command above is this:
iptables: No chain/target/match by that name

thanks a lot

J=FAlio C=E9sar de Magalh=E3es
Analista de Suporte - Poliedro/FNDE
(61) 81177547 Bras=EDlia - DF

