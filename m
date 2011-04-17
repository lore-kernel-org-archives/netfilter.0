From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Fwd: iptables redirect inbound traffic to tun
Date: Sun, 17 Apr 2011 19:09:53 -0300
Message-ID: <BANLkTi=tynzUHTx4wXQaRabhBpsaYJ_emw@mail.gmail.com>
References: <BANLkTim2+_Q967uPAU1HA-VO939OMk6GPg@mail.gmail.com>
	<BANLkTinzSaZbJSWEfW7+Hn4RDgsh-RYJ2w@mail.gmail.com>
	<1302887141.4938.69.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302887141.4938.69.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: JOSE FELIX HERNANDEZ BARRIO <jose.hernandez@isthari.com>, netfilter@vger.kernel.org

Try add the lines below in your scritp.


ip rule del fwmark 1
before you add: ip rule add fwmark 1 table 100

at the end in the your script
ip route flush tables







2011/4/15 Andrew Beverley <andy@andybev.com>:
> On Fri, 2011-04-15 at 18:51 +0200, JOSE FELIX HERNANDEZ BARRIO wrote:
>>
>> My problem is when traffic source is B when the packet come back to =
B
>> its destination ip matches local IP so it's not redirected to tun1
>> ands it's not processed. Incoming packets on local ip are not
>> processed by prerouting chain.
>>
>> what i use to redirect its:
>> iptables -A PREROUTING -t mangle -i eth0 -t tcp -j MARK --set-mark 1
>> iptables -A PREROUTING -t mangle -i eth0 -j ACCEPT
>>
>> ip rule add fwmark 1 table 100
>> ip route add default dev tun0 table 100
>
> Have you tried marking the packets in the mangle table of OUTPUT?
> Looking at the kernel packet flow diagram[1], packets get a reroute
> check after that table.
>
>>
>> someone suggested to use iptables -j ROUTE to force routing even in
>> this case. But there's no way to use this patch on recent kernel.
>
> I believe that functionality was moved into iproute2.
>
> Andy
>
> [1] http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-pack=
et-flow.svg
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
