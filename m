From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: redundancy with Adsl modem
Date: Tue, 3 Jan 2012 13:18:03 -0200
Message-ID: <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com>
	<1325574854.2270.130.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1325574854.2270.130.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks, I found few documentation about lsm on Internet.

if somebody has some how to about lsm post here please.






thanks




Em 3 de janeiro de 2012 05:14, Andrew Beverley <andy@andybev.com> escre=
veu:
> On Mon, 2012-01-02 at 23:54 -0200, Usu=E1rio do Sistema wrote:
>> Hello everyone,
>>
>> I'm searching a way of the redundancy with my firewall CentOs Linux
>> 5.5 that is behind from two adsl modem.
>>
>>
>> well, I wish that when a link adsl comes down ( side from ISP line
>> adsl no Ethernet cable that connects the modem adsl to my firewall )
>> the traffic go to for other link adsl.
>>
>> there is any way to reach this redundancy with Linux iptables ??
>
> I would recommend using LSM[1] and configuring that to run the releva=
nt
> iptables/iproute2 commands should an interface fail.
>
> Andy
>
> [1] http://lsm.foobar.fi/
>
>
