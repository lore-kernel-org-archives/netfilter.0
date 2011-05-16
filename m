From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Load Balance
Date: Mon, 16 May 2011 19:42:57 -0300
Message-ID: <BANLkTik2xc-8jK02wyzj4_Dv4wz1==-jsw@mail.gmail.com>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
	<1305480225.1708.2.camel@andybev>
	<BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com>
	<1305581912.2041.15.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305581912.2041.15.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

But is your test environment using one gateway with two routes?
no.

I have two Gateways for my firewall.I put the routes in the table with
line below:

ip route add default scope global equalize nexthop via 201.72.12.17
weight 2  nexthop via 200.247.209.6 weight 1

sometimes data flow outs on gateway 201.72.12.17 and sometimes outs on
200.247.209.6

the two links are of the same ISP.


thank.









Em 16 de maio de 2011 18:38, Andrew Beverley <andy@andybev.com> escreve=
u:
> On Mon, 2011-05-16 at 17:24 -0300, Usu=E1rio do Sistema wrote:
>> >> Hello everyone, I'm deploy an test environment with load Balance =
in my
>> >> Firewall using equalize as follow below
>> >>
>> >> creating the load balance:
>> >>
>> >> ip route add default scope global equalize nexthop via 200.247.20=
9.65
>> >> weight 1 =A0nexthop via 201.72.12.1 weight 1
>> >>
>> >
>> > If you are using 2 completely separate ISPs, then you will need to=
 do
>> > more than just provide equal-weighted gateways. You will need to s=
end
>> > the packets for each connection over the same ISP. The website bel=
ow
>> > gives more information:
>> >
>> > http://www.sysresccd.org/Sysresccd-networking_en_Iptables-and-netf=
ilter-load-balancing-using-connmark
>> >
>
> <top posting fixed>
>
>> well.... the link made available for you shows how to do load balanc=
e
>> with connmark and statistic match module and it doesn't regard globa=
l
>> equalize.
>>
>> so...I wonder there is diferent between them ?
>
> Yes. The example at the link ensures that packets from the *same*
> connection stream are always routed through the same ISP (hence the
> reason for asking the question). If you don't do this, then each gate=
way
> will only see half the packets for a connection stream, which althoug=
h I
> am not an expert, I guess is not a good thing.
>
>> with global equalize is very easy I only insert one line inside of t=
he
>> script and all it's work! at least in my test environment it's
>> working.
>
> But is your test environment using one gateway with two routes?
>
>> I want make an test as your how to but I'm using CentOS 5.6 and
>> doesn't has libxt_statistic.so module because iptables version is
>> 1.3.x
>
> Use a different distro...
>
> Andy
>
>
>
>
