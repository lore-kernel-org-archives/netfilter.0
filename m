From: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
Subject: Return pack to the same local server using DNAT
Date: Mon, 16 May 2005 11:58:35 -0300
Message-ID: <003901c55a27$c5ca6fd0$160211ac@PIVT>
Reply-To: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
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

Hi,

Hown can I do the follwing:

I have a firewall (172.17.1.6) using a "Linka" default gw is of the =
provider (200.204.151.65) and I have a PREROUTING with DNAT to the local =
server 172.17.1.7 port 21.

The local server 172.17.1.7 has another link "Linkb" and the default gw =
is of the provider (200.204.140.1).=20

This is the problem. The packet is returning using the link default gw =
the linkb.=20

For request for port 21 I'd link to use the 172.17.1.6


Hown can I do this??



Sebasti=E3o Ant=F4nio Campos
