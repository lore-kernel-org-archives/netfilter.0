From: Sertys <sertys@supportivo.org>
Subject: Re: Two netwok cards to access the internet.
Date: Wed, 23 Mar 2005 00:24:53 +0200
Message-ID: <opsn18jrxh76nf2y@xonix>
References: <010801c52f29$bb2cd7d0$280211ac@PIVT>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <010801c52f29$bb2cd7d0$280211ac@PIVT>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="utf-8"
To: Netfilter list <netfilter@lists.netfilter.org>

On Tue, 22 Mar 2005 18:54:26 -0300, Sebasti=C3=A3o Ant=C3=B4nio Campos =20
<sa.campos@datasulsp.com.br> wrote:

Well, that's easy. When you know the ports you want to map through the =20
interfaces, just do

iptables -t nat -A POSTROUTING -m multiport -p tcp -s 172.17.1.8 --dports=
 =20
25,110,1723,1701,47 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.17.0.0/16 -o eth2 -j MASQUERADE
or even better
iptables -t nat -A POSTROUTING -s 172.17.0.0/16 -o eth2 -j SNAT =20
--to-source $ETH2_IP

Those are simple states, you might add --syn or -m state, it's a choice o=
f =20
yours anyway.


> Hi!
>
> I have the following:
>
> A RedHat 9.0 with 3 Network cards: One we use in local network (eth1) =20
> and the other (eth0 and eth2)  to access the internet.
>
> I'd like to separate the traffic. In the eth0 use only with the e-mail =
=20
> server (pop, smtp, 1723, 1701 and protocol 47) and the eht0 with others=
 =20
> traffis (http, https, msn....).
>
> I tried
>
> iptables -t nat -A POSTROUTING -o eth2 -s 172.17.1.8 -j MASQUERADE   =20
> (--this ip addrs is pop and smtp server)
> iptables -t nat -A POSTROUTING -o eth0 -s 172.17.0.0/16 -j MASQUERADE
>
> But when I did this I could not access the port 1723, 1701 and protocol=
 =20
> 47 using the eth2.
>
> I tried too use only iptables -t nat -A POSTROUTING -o eth2 -s =20
> 172.17.0.0/16 -j MASQUERADE
>
> And I got the same prob.
>
> If I use iptables -t nat -A POSTROUTING  -s 172.17.0.0/16 -j MASQUERADE
>
> I will get a success access. Only when I use iptables -t nat -A =20
> POSTROUTING  -s 172.17.0.0/16 -j MASQUERADE (without -o eth2 or -o eth0=
).
>
>
> Who could help me?
>
> Thanks
>
>
> Sebasti=D0=B3o Ant=D1=84nio Campos
> Infojoi Computadores Ltda
> Joinville -SC - R. Iriri=D1=8A, 3587
> Cml. (47) 437-0796 - Cel. (47) 9927-5349
> tiao@infojoi.com.br
> http://www.lupusnet.com.br



--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

