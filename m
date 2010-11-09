From: Tommaso Calosi <tcalosi@gmail.com>
Subject: Re: balance traffic between virtual interfaces on the same network
Date: Tue, 9 Nov 2010 17:10:05 +0100
Message-ID: <AANLkTinLZReuh8ZXYUN0L0Lipju+zMS0h-yv938BrV_t@mail.gmail.com>
References: <AANLkTikQ7HBAsiYZDhCZNNTFXUuFxHDFA8sSvN1L1QjO@mail.gmail.com>
	<alpine.LNX.2.01.1011091452410.2491@obet.zrqbmnf.qr>
	<AANLkTimy_Um5z=MDeUqVfY5Kea1HpbHPg9ik3CKoE0+Q@mail.gmail.com>
	<4CD96BB1.8050109@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=qnOt7QFYWN4e/ml1cfxGviRojrAX4fyO1jLcGorJvaw=;
        b=vFbIANJkUzVt1D+Kw5I1uRPelcdr4waBVWq35y6m8xApHFY2jjfQnF0l1EFE2WQtA6
         AyflCJo2AQalIdazoE5oZOOo239gszpInUv7DHfjf9BjjlK7zXrMHjKH/FPlCGAiy+Vd
         xOKEEXzFU1q/8eFX3MPLnakWtdDNZnU5+BIgc=
In-Reply-To: <4CD96BB1.8050109@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Thanks SNAT is what I was looking for!

On Tue, Nov 9, 2010 at 4:41 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Tommaso Calosi a =E9crit :
>> That's why i wrote "virtual interfaces".
>
> eth0:* are not virtual interfaces, not interfaces at all. They are ju=
st
> IPv4 aliases. Virtual interfaces are a different thing : they are "re=
al"
> interfaces (from the network stack point of view) which are just not
> related to real hardware.
>
>> If t's not possibile, then
>> it'd have the same effect to masquerade outgoing connection with a n=
at
>> pool made by 192.168.1.10, 192.168.1.20 and 192.168.1.30 but since
>> they're originating from the firewall itself, again I don't know how=
=2E
>
> You can use SNAT. It does not matter that the traffic originates from
> the box. However your addresses are not contiguous and the support fo=
r
> multiple --to-source options was removed long ago, so you'll have to =
do
> the balance by other means, for example with the statistic match.
>
> Note that it won't balance the source address on a packet basis but o=
n a
> connection basis. So if you have one very active connection and one
> mostly inactive connection, most of the packets will have the same
> source address.
>
