From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: get byte count per rule and ip address
Date: Sun, 16 Jan 2011 02:36:30 +1300
Message-ID: <4D31A2DE.1050702@treenet.co.nz>
References: <AANLkTimcqgfuk6mxKeANn4tS_saGwbUTGVSJHSTyozQs@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimcqgfuk6mxKeANn4tS_saGwbUTGVSJHSTyozQs@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

On 16/01/11 01:09, Mamadou Tour=C3=A9 wrote:
> Hi, all
> i've these rule :
> r1 : iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  bgp
> -j MARK --set-mark 1
> r2 : iptables  -t mangle  -A POSTROUTING     -m layer7 --l7proto  bif=
f
>   -j MARK --set-mark 2
>
> for both r1 and r2 I'd like to get the byte count of packets that hav=
e
> match rules.
> also i'd like to get byte count of packets according to the IP addres=
s.
> I need your help plz.

-v shows the packet counters and extra details.

=46or example:
   iptables -v -L POSTROUTING

will display the whole table and counters for all rules in it

AYJ
