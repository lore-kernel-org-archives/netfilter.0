From: mdpeters <michael.peters@lazarusalliance.com>
Subject: Re: insmod: can't read 'ip_queue': No such file or directory?
Date: Mon, 17 Jan 2005 09:52:40 -0500
Message-ID: <41EBD138.9040806@lazarusalliance.com>
References: <1105962971.26574.3.camel@nostromo.bgsecm.com>
	<41EA944C.8090904@lazarusalliance.com>
	<1105962971.26574.3.camel@nostromo.bgsecm.com>
	<5.1.0.14.2.20050117153713.00bdfd28@pop.mail.yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20050117153713.00bdfd28@pop.mail.yahoo.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: max bunker <neo_italy02@yahoo.it>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I tried this:

# /sbin/depmod -a
# /sbin/insmod ip_queue
insmod: can't read 'ip_queue': No such file or directory

Question?

Does the ip_queue get placed into the kernel source by iptables or is it=20
something already in the kernel that just gets activated?

max bunker wrote:

> Try depmod -a, before loading module.....
>
>
> Luis
>
> At 09.21 17/01/2005 -0500, you wrote:
>
>> This what I have found:
>>
>> # find / -name ip_queue.ko
>>
>> /lib/modules/2.6.10-1.9_FC2/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> /lib/modules/2.6.5-1.358/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> /lib/modules/2.6.5-1.358smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> /lib/modules/2.6.10-1.9_FC2smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> # /sbin/modprobe ip_queue
>>
>> # ls -l=20
>> /lib/modules/2.6.10-1.9_FC2/kernel/net/ipv4/netfilter/ip_queue.ko
>> -rwxr--r--  1 root root 13624 Jan 13 18:37=20
>> /lib/modules/2.6.10-1.9_FC2/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> # ls -l /lib/modules/2.6.5-1.358/kernel/net/ipv4/netfilter/ip_queue.ko
>> -rwxr--r--  1 root root 10004 May  8  2004=20
>> /lib/modules/2.6.5-1.358/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> # ls -l=20
>> /lib/modules/2.6.5-1.358smp/kernel/net/ipv4/netfilter/ip_queue.ko
>> -rwxr--r--  1 root root 14772 May  8  2004=20
>> /lib/modules/2.6.5-1.358smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> # ls -l=20
>> /lib/modules/2.6.10-1.9_FC2smp/kernel/net/ipv4/netfilter/ip_queue.ko
>> -rwxr--r--  1 root root 17964 Jan 13 18:37=20
>> /lib/modules/2.6.10-1.9_FC2smp/kernel/net/ipv4/netfilter/ip_queue.ko
>> #
>>
>> # /sbin/insmod ip_queue
>> insmod: can't read 'ip_queue': No such file or directory
>>
>> Jose Maria Lopez wrote:
>>
>>> El dom, 16 de 01 de 2005 a las 17:20, mdpeters escribi=C3=B3:
>>>
>>>
>>>> Does anyone know how I might fix this error? I am running Fedora=20
>>>> Core 2 fully patched and iptables-1.2.11, kernel=20
>>>> vmlinuz-2.6.10-1.9_FC2smp.
>>>>
>>>> # ./insmod ip_queue
>>>> insmod: can't read 'ip_queue': No such file or directory
>>>>
>>>
>>> Try: modprobe ip_queue
>>> and check that you have the ip_queue.ko file and it's
>>> readable.
>>>
>>>
>>
>> --=20
>>
>> Best regards,
>>
>> Michael D. Peters
>> Director of Security Services
>> CISSP
>> Lazarus Alliance Inc.
>> M: 502-767-3448
>> O: 502-231-8017 x8
>> H: 502-231-6923
>> F: 502-231-5347
>>
>> michael.peters@lazarusalliance.com
>> www.lazarusalliance.com
>>
>

--=20

Best regards,

Michael D. Peters
Director of Security Services
CISSP
Lazarus Alliance Inc.
M: 502-767-3448
O: 502-231-8017 x8
H: 502-231-6923
F: 502-231-5347

michael.peters@lazarusalliance.com
www.lazarusalliance.com


