From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: get byte count per rule and ip address
Date: Sat, 15 Jan 2011 15:15:53 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101151515430.26991@obet.zrqbmnf.qr>
References: <AANLkTimcqgfuk6mxKeANn4tS_saGwbUTGVSJHSTyozQs@mail.gmail.com> <4D31A2DE.1050702@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D31A2DE.1050702@treenet.co.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Amos Jeffries <squid3@treenet.co.nz>
Cc: netfilter@vger.kernel.org

On Saturday 2011-01-15 14:36, Amos Jeffries wrote:

> On 16/01/11 01:09, Mamadou Tour=C3=A9 wrote:
>> Hi, all
>> i've these rule :
>> r1 : iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  bg=
p
>> -j MARK --set-mark 1
>> r2 : iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  bi=
ff
>>  -j MARK --set-mark 2
>>
>> for both r1 and r2 I'd like to get the byte count of packets that ha=
ve
>> match rules.
>> also i'd like to get byte count of packets according to the IP addre=
ss.
>> I need your help plz.
>
> -v shows the packet counters and extra details.
>
> For example:
>  iptables -v -L POSTROUTING
>
> will display the whole table and counters for all rules in it

Better use iptables-save -c for that.

