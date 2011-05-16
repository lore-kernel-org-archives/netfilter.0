From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: Load Balance
Date: Mon, 16 May 2011 17:24:29 -0300
Message-ID: <BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>
	<1305480225.1708.2.camel@andybev>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305480225.1708.2.camel@andybev>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

Thank you Andy for your Return.

I haven't made available in my environment product yet.

well.... the link made available for you shows how to do load balance
with connmark and statistic match module and it doesn't regard global
equalize.

so...I wonder there is diferent between them ?

with global equalize is very easy I only insert one line inside of the
script and all it's work! at least in my test environment it's
working.

I want make an test as your how to but I'm using CentOS 5.6 and
doesn't has libxt_statistic.so module because iptables version is
1.3.x


thank











Em 15 de maio de 2011 14:23, Andrew Beverley <andy@andybev.com> escreve=
u:
> On Sun, 2011-04-17 at 20:22 -0300, Usu=E1rio do Sistema wrote:
>> Hello everyone, I'm deploy an test environment with load Balance in =
my
>> Firewall using equalize as follow below
>>
>>
>> I have two ISPs and one Inside network.
>>
>> creating the load balance:
>>
>> ip route add default scope global equalize nexthop via 200.247.209.6=
5
>> weight 1 =A0nexthop via 201.72.12.1 weight 1
>>
>> Zeroing the ip_filter
>>
>> for eee in /proc/sys/net/ipv4/conf/*/rp_filter; do
>> echo 0 > $eee
>> done
>>
>> creating more one table
>>
>> ip route add default via =A0201.72.12.1 =A0table telemar
>>
>>
>> it's working in my environment. but I haven't done available in my
>> production environment.
>>
>
> Do you mean it doesn't work in your production environment?
>
>> my question is: there is more parameter ,which, I have to set ? for
>> exemplo, timers.
>>
>
> If you are using 2 completely separate ISPs, then you will need to do
> more than just provide equal-weighted gateways. You will need to send
> the packets for each connection over the same ISP. The website below
> gives more information:
>
> http://www.sysresccd.org/Sysresccd-networking_en_Iptables-and-netfilt=
er-load-balancing-using-connmark
>
> Andy
>
>
>
