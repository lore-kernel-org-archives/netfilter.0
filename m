From: =?ISO-8859-1?Q?Vlado_Drz=28=EDk?= <vlado@ttx.sk>
Subject: Re: (Ab)using iptables to record byte count per IP?
Date: Sat, 10 Jan 2009 00:27:14 +0100
Message-ID: <4967DD52.2050904@ttx.sk>
References: <2d460de70901090327y625afd60g792467e843d3f1d@mail.gmail.com> <f08c15d10901090723h3c3f0edbhbc4dfe674fbd653b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f08c15d10901090723h3c3f0edbhbc4dfe674fbd653b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Payam Chychi <pchychi@gmail.com>
Cc: Richard Hartmann <richih.mailinglist@gmail.com>, netfilter@vger.kernel.org

It depends on number of IPs that you want to account and what traffic
(pck/s) will be comming through your router.
The IP tables accouning based on adding IPs to chains (iptables -A
somechain -s <src_IP>) is simple but scales well just for small packet
counts and number of rules.
But for you it's probably best choice as it's really easy to implement.
=46or example create 2 tables:
iptables -N ACCT_IN
iptables -N ACCT_OUT

Add to forward somewhere before accepting rules (nearly begening of cha=
in):
iptables -A FORWARD -i <inet_nic> -j ACCT_IN
iptables -A FORWARD -o <inet_nic> -j ACCT_OUT
Add IP addreses
iptables -A ACCT_IN -d <ipaddress 1> -j RETURN
iptables -A ACCT_IN -d <ipaddress 2> -j RETURN
=2E...
Add oposite diraction:
iptables -A ACCT_OUT -s <ipaddress 1> -j RETURN
iptables -A ACCT_OUT -s <ipaddress 2> -j RETURN


If you are going to count many users >1000 it's better to consider
external modules like ipt_ACCCOUNT:
http://www.intra2net.com/de/produkte/opensource/ipt_account/
It scales very well for large numbers of IPs but bigest drawback is tha=
t
it's out of tree module and you need to compile kernel+iptables (so it'=
s
really not a option for you).

If I understand the conntrack (CT) accounting correctly I see that ther=
e
is problem that it's flow based so if some flows are dismissed from CT
table quickly you can get unaccurate results if you read CT table in
wider intervals.

I'd much like to see also packet based accounting (not just flow based
one) in kernel. Do someone use conntrack based accounting in real life?

- vlado

Payam Chychi  wrote / nap=EDsal(a):
> Hi,
>=20
> Thats possible by using the pre-nat table. You will need to place an
> accept all rule for each individual /32 ip address that you want to d=
o
> accounting for ( I use accept so that I can see all traffic destined
> for the ip)
>=20
> -Payam
>=20
>=20
> On Fri, Jan 9, 2009 at 3:27 AM, Richard Hartmann
> <richih.mailinglist@gmail.com> wrote:
>> Hi all,
>>
>> I need to log the traffic each local IP in a NAT'ed network generate=
s
>> per day.
>>
>> Unfortunately, the environment is rather restricted and compiling ne=
w
>> software is not an option. Thus, I am wondering if I can abuse iptab=
les,
>> which is in use anyway, to log for me, as well.
>>
>> The end result should be a log which contains IP, date and traffic
>> generated. I don't really care about the output format as I will per=
l it
>> into the format I need, anyway.
>>
>>
>> Thanks for all input,
>> Richard
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>=20
>=20
>=20

