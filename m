From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Filter ips
Date: Fri, 01 Sep 2006 09:46:35 +0200
Message-ID: <44F7E55B.5000406@freemail.hu>
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
To: nunezj@ucbcba.edu.bo
Cc: netfilter@lists.netfilter.org

nunezj@ucbcba.edu.bo =EDrta:
> Hi everyone
>
>        I have some problems when I want to filter some ips in  my netwo=
rk
>
>  I put this rules in the my script:
>
>  iptables -A INPUT -s 192.168.0.5/32 -d 0/0 -p tcp --dport 20,21 -j DRO=
P
>
>  but it doesn't work. The same I put in the Output rules but it doen't
> work....
>
>   How can I make this filter?
>
> regards,
>
>              Jorge Enrique
>  =20
Maybe this line will help you:

iptables -A INPUT -s 192.168.0.5 -p tcp -m multiports --dports 20,21 -j D=
ROP

This only filters the incoming traffic
To filter the forward traffic use this:

iptables -A FORWARD -s 192.168.0.5 -p tcp -m multiports --dports 20,21=20
-j DROP


iptables -vnL              is you friend !!! :)
iptables -t nat -vnL       also !!! :)

Swifty

