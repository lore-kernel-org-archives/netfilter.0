From: =?iso-8859-15?Q?Mart=EDn?= <martin@familia-fiumara.com.ar>
Subject: Redirect and change the source IP
Date: Mon, 03 Nov 2003 11:12:20 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <oprx2e2upppvmot6@192.168.2.1>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


En Mon, 03 Nov 2003 16:00:27 +0200, Ray Leach=20
<raymondl@knowledgefactory.co.za> escribi=F3:

> On Mon, 2003-11-03 at 15:24, Mart=EDn wrote:
>> How can I redirect inbound traffic and also change the source IP of this=
=20
>> traffic?
> iptables -t nat -A POSTROUTING -i eth0 -s 123.321.123.321 -p tcp --dport
> 80 -j SNAT --to 1.2.3.4


This would change the SOURCE IP, but I need also to redirect the traffic to=
=20
another machine
How can I do both things?
Supose the linux machine has IP 192.168.1.1, the traffic is comeing from=20
192.16.1.2 and I want to recive that traffic in 192.168.1.1 cange its=20
source IP to 192.168.1.2 and also redirect that trafic to 192.168.2.1.

--=20
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/

