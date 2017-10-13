From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Probably bug detected with ip6tables in CentOS6 ...
Date: Sat, 14 Oct 2017 00:20:48 +0200
Message-ID: <20525e2c-d0c8-b59b-e2ac-c1ef2a3271a1@plouf.fr.eu.org>
References: <1b6eda16c4c70db5c0bb1824a002c98a.1507888146@squirrel.mail>
 <alpine.DEB.2.11.1710131601520.2159@blackhole.kfki.hu>
 <59E0DDB6.5030300@mathemainzel.info>
 <alpine.DEB.2.11.1710132201440.6854@blackhole.kfki.hu>
 <59E12B4E.9020005@mathemainzel.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <59E12B4E.9020005@mathemainzel.info>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "Walter H." <Walter.H@mathemainzel.info>, netfilter@vger.kernel.org

(some recipients removed)

Le 13/10/2017 =E0 23:08, Walter H. a =E9crit=A0:
> On 13.10.2017 22:05, Jozsef Kadlecsik wrote:
>> On Fri, 13 Oct 2017, Walter H. wrote:
>>>>>
>>>>> this works:
>>>>> -A INPUT -i eth0 -d prefix::5772:1566:4901 -m tcp -p tcp --dport 25 -m
>>>>> state --state NEW -j ACCEPT
>>>>>
>>>>> but this not:
>>>>> -A INPUT -i eth0 -d prefix:0:5772:1566:4901 -m tcp -p tcp --dport 25 =
-m
>>>>> state --state NEW -j ACCEPT
>>
>> What does it exactly mean "doesn't work"?
> this rule should open tcp/25 for SMTP but it doesn't ...

Did you compare the two resulting rules with ip6tables-save ?
