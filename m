From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: How to create rule from log file information ?
Date: Wed, 27 Jan 2010 08:34:26 +0530
Message-ID: <4B5FAD3A.6050704@infoservices.in>
References: <20100125230202.60f24a5a@infoservices.in> <4B5DE797.4070801@tana.it> <4B5E110B.90507@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B5E110B.90507@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Mart Frauenlob wrote:
> On 25.01.2010 19:49, netfilter-owner@vger.kernel.org wrote:
>  =20
>> On 25/Jan/10 18:32, J. Bakshi wrote:
>>    =20
>>> I have collected the iptables log against nmap scan. Like
>>>
>>> [omitted almost identical log lines]
>>>
>>> Can I make rule-set to prevent the above scan from the info collect=
ed
>>> at the log ?
>>> Kindly enlighten me. Then I can make more rule sets from the log.
>>>      =20
>> I'm not an nmap expert, but AFAIK nmap is designed to avoid just tha=
t. I
>> have installed some logging iptables rules, similar to the ones in y=
our
>> previous message (from Arno's iptables scripts, IIRC) and sometimes =
some
>> of them fire, presumably because inappropriate flags had been given =
to
>> nmap.
>>
>> To recognize a scan, one may look at almost simultaneous TCP syn
>> occurring to several nearby ports/ addresses, and not followed by an
>> ack. This would require specific connection tracking code that I've
>> never heard about. At any rate, you /have/ to respond to syn request=
s,
>> because they may be legit. You may recognize that they were scans by
>> analyzing the logs some time later, presumably for banning the relev=
ant
>> IPs from further accessing your server...
>>
>>    =20
>
> I have not tried them yet, but there is are extensions in
> xtables-addons. Might worth trying:
>
> =20
Thanks for the info.  Is there anyone already working with the module ?
Please share your experience.

Thanks

--=20
=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=8D=
=E0=A6=B8=E0=A7=80

