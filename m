From: "Dennis J." <dennisml@conversis.de>
Subject: Re: NOTRACK not working
Date: Tue, 26 Jan 2010 21:15:50 +0100
Message-ID: <4B5F4D76.200@conversis.de>
References: <4B5F36B7.5010004@conversis.de> <1264531798.4004.67.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1264531798.4004.67.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"; format="flowed"
To: =?KOI8-U?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Cc: netfilter@vger.kernel.org

On 01/26/2010 07:49 PM, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=
=CB wrote:
> =F7 =F7=D4=CF, 26/01/2010 =D7 19:38 +0100, Dennis J. =D0=C9=DB=C5=D4:
>> Hi,
>> For a while now I excluded two IPs on my firewall from connection tr=
acking
>> which works very well. Now I tried adding another IP but that doesn'=
t seem
>> to work. I added the following rules:
>>
>> iptables -t raw -A PREROUTING -s 192.168.10.10 -j NOTRACK
>> iptables -t raw -A PREROUTING -d 192.168.10.10 -j NOTRACK
>>
>> Yet when I look in /proc/net/ip_conntrack I still see 192.168.10.10 =
using
>> up most of the entries.
>> Is there something else that needs to be done to exclude this IP com=
pletely
>> from the connection tracking table?
>
> Probably conntrack has seen packets from this IP before you added tho=
se
> rules, they will remain until connection is "closed" and/or timeout
> occurs. Quick hack is to do "conntrack -F; conntrack -F expect".
>

Makes sense. Where can I find the conntrack command? This is a regular=20
centos 5 system but I can't find any packages that contain this command=
=2E

Regards,
   Dennis
