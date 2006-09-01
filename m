From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Filter ips
Date: Fri, 01 Sep 2006 12:14:11 +0200
Message-ID: <44F807F3.4030906@plouf.fr.eu.org>
References: <4298.200.87.170.170.1157063657.squirrel@admin.ucbcba.edu.bo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4298.200.87.170.170.1157063657.squirrel@admin.ucbcba.edu.bo>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

nunezj@ucbcba.edu.bo a =E9crit :
>=20
>  I put this rules in the my script:
>=20
>  iptables -A INPUT -s 192.168.0.5/32 -d 0/0 -p tcp --dport 20,21 -j DRO=
P
>=20
>  but it doesn't work.

What do you mean *exactly* ?
--dport expects a port interval, not a port list : --dport 20:21

