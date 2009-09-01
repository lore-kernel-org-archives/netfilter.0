From: Thomas Berg <thomas.berg@branndal.se>
Subject: Re: ULOG The kernel doesn't support a certain ebtables extension,
 consider recompiling your kernel or insmod the extension.
Date: Tue, 01 Sep 2009 14:17:35 +0200
Message-ID: <4A9D10DF.1050307@branndal.se>
References: <4A9C2F4C.9050405@branndal.se> <200908311534.19700.rob0@gmx.co.uk> <4A9CD19C.6040107@branndal.se> <4A9D08FF.7070705@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9D08FF.7070705@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Patrick McHardy <kaber@trash.net>
Cc: /dev/rob0 <rob0@gmx.co.uk>, netfilter@vger.kernel.org

Hi

trying this

rmmod ipt_ulog

modprobe ebt_ulog

ebtables 14108 3 ebtable_broute,ebtable_nat,ebtable_filter
x_tables 14108 5 ebt_ulog,ebt_nflog,ebt_ip,ebt_log,ebtables


module is then loaded, great but still the same error when trying to ad=
d=20
a ebtables rule with ulog.

br0:~# /sbin/ebtables --modprobe /sbin/modprobe -A FORWARD=20
--in-interface eth1.4 --protocol IPv4 --ip-protocol udp=20
--ip-destination-port 67 -j DROP --ulog
The kernel doesn't support a certain ebtables extension, consider=20
recompiling your kernel or insmod the extension.

unloading ebt_ulog and then trying to add a rule with ulog ends up with=
=20
ebt_ulog loaded but still getting the same error message

The kernel doesn't support a certain ebtables extension, consider=20
recompiling your kernel or insmod the extension.

So ebtables is loading ebt_ulog if ipt_ulog is unloaded but still there=
=20
is this error message that the kernel need to be recompiled or try to=20
load module.

I=C2=B4ll have to check out nfnetlink_log and se if I can use that inst=
ead,=20
is it forwaring the whole packet to userspace?

Best regards,
Thomas

Patrick McHardy skrev:
> Thomas Berg wrote:
>  =20
>>>> ebt_ip                  1752  29
>>>> ebt_log                 3268  32
>>>> ebtable_broute          1740  0
>>>> ebtable_nat             2000  0
>>>> ebtable_filter          2028  1
>>>> ebtables               14108  3
>>>> ebtable_broute,ebtable_nat,ebtable_filter
>>>> ipt_ULOG                6684  1
>>>> x_tables               14108  4 ebt_ip,ebt_log,ebtables,ipt_ULOG
>>>> bridge                 39968  1 ebtable_broute
>>>> 8021q                  17932  0
>>>> garp                    6996  1 8021q
>>>> stp                     2112  2 bridge,garp
>>>>    =20
>>>>        =20
>> br0:/lib/modules/2.6.26-1-686/kernel/net/bridge/netfilter# modprobe
>> ebt_ulog
>> FATAL: Error inserting ebt_ulog
>> (/lib/modules/2.6.30-1-686/kernel/net/bridge/netfilter/ebt_ulog.ko):
>> Cannot allocate memory
>>    =20
>
> ebt_ulog and ipt_ULOG can't be used simultaneously since they both us=
e
> the same netlink unit. I don't think we can fix it at this point sinc=
e
> both are obsolete and this would break existing setups. You can use
> nfnetlink_log and xt_NFLOG/ebt_NFLOG as a replacement.
>  =20

