From: "Sebastiao Antonio Campos \(GWA\)" <sa.campos@datasulsp.com.br>
Subject: Re: Two netwok cards to access the internet.
Date: Tue, 22 Mar 2005 21:51:03 -0300
Message-ID: <011c01c52f42$64b4ba80$280211ac@PIVT>
References: <010801c52f29$bb2cd7d0$280211ac@PIVT> <opsn18jrxh76nf2y@xonix>
Reply-To: "Sebastiao Antonio Campos \(GWA\)" <sa.campos@datasulsp.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: Netfilter list <netfilter@lists.netfilter.org>, Sertys <sertys@supportivo.org>

Thanks.

It is working good.



----- Original Message ----- 
From: "Sertys" <sertys@supportivo.org>
To: "Netfilter list" <netfilter@lists.netfilter.org>
Sent: Tuesday, March 22, 2005 7:24 PM
Subject: Re: Two netwok cards to access the internet.


On Tue, 22 Mar 2005 18:54:26 -0300, Sebastião Antônio Campos
<sa.campos@datasulsp.com.br> wrote:

Well, that's easy. When you know the ports you want to map through the
interfaces, just do

iptables -t nat -A POSTROUTING -m multiport -p tcp -s 172.17.1.8 --dports
25,110,1723,1701,47 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 172.17.0.0/16 -o eth2 -j MASQUERADE
or even better
iptables -t nat -A POSTROUTING -s 172.17.0.0/16 -o eth2 -j SNAT
--to-source $ETH2_IP

Those are simple states, you might add --syn or -m state, it's a choice of
yours anyway.


> Hi!
>
> I have the following:
>
> A RedHat 9.0 with 3 Network cards: One we use in local network (eth1)
> and the other (eth0 and eth2)  to access the internet.
>
> I'd like to separate the traffic. In the eth0 use only with the e-mail
> server (pop, smtp, 1723, 1701 and protocol 47) and the eht0 with others
> traffis (http, https, msn....).
>
> I tried
>
> iptables -t nat -A POSTROUTING -o eth2 -s 172.17.1.8 -j MASQUERADE
> (--this ip addrs is pop and smtp server)
> iptables -t nat -A POSTROUTING -o eth0 -s 172.17.0.0/16 -j MASQUERADE
>
> But when I did this I could not access the port 1723, 1701 and protocol
> 47 using the eth2.
>
> I tried too use only iptables -t nat -A POSTROUTING -o eth2 -s
> 172.17.0.0/16 -j MASQUERADE
>
> And I got the same prob.
>
> If I use iptables -t nat -A POSTROUTING  -s 172.17.0.0/16 -j MASQUERADE
>
> I will get a success access. Only when I use iptables -t nat -A
> POSTROUTING  -s 172.17.0.0/16 -j MASQUERADE (without -o eth2 or -o eth0).
>
>
> Who could help me?
>
> Thanks
>
>
> Sebastiгo Antфnio Campos
> Infojoi Computadores Ltda
> Joinville -SC - R. Iririъ, 3587
> Cml. (47) 437-0796 - Cel. (47) 9927-5349
> tiao@infojoi.com.br
> http://www.lupusnet.com.br



-- 
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'm
a punk, cause of the hairstyle(220V).
end


