From: "=?iso-8859-1?Q?Juliano_Dapper?=" <fjdapper@terra.com.br>
Subject: =?iso-8859-1?Q?Iptables_with_IP_Alias?=
Date: Wed, 13 Nov 2002 01:12:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <H5HQ0H$9919374312372D5676DDD544D0265BEA@terra.com.br>
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
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?netfilter?= <netfilter@lists.netfilter.org>

What's iptables not accept rules in ip alias, eth0:0, eth0:1?=0D=0AI have=
 a linux box with 2 ips and i have create ruls to redirect traffic to int=
ernal machine,ex:=0D=0Aiptables -t nat -A PREROUTING -p tcp -i eth0 --dpo=
rt 25 -j DNAT --to 192.168.0.1=0D=0Aiptables -t nat -A PREROUTING -p tcp =
-i etho:0 --dport 80 -j DNAT --to=0D=0A192.168.0.2=0D=0Aeth0 - 200.200.20=
0.1=0D=0Aeth0:0 - 200.200.200.2=0D=0A=0D=0ATkz...=0D=0A=0D=0A=0D=0A=0D=0A=



