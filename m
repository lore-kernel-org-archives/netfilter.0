From: mdpeters <michael.peters@lazarusalliance.com>
Subject: Re: insmod: can't read 'ip_queue': No such file or directory?
Date: Mon, 17 Jan 2005 11:47:57 -0500
Message-ID: <41EBEC3D.7090605@lazarusalliance.com>
References: <5.1.0.14.2.20050117155947.00c5adb8@pop.mail.yahoo.it>
	<5.1.0.14.2.20050117153713.00bdfd28@pop.mail.yahoo.it>
	<1105962971.26574.3.camel@nostromo.bgsecm.com>
	<41EA944C.8090904@lazarusalliance.com>
	<1105962971.26574.3.camel@nostromo.bgsecm.com>
	<5.1.0.14.2.20050117153713.00bdfd28@pop.mail.yahoo.it>
	<5.1.0.14.2.20050117155947.00c5adb8@pop.mail.yahoo.it>
	<5.1.0.14.2.20050117173516.00bc90d8@pop.mail.yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20050117173516.00bc90d8@pop.mail.yahoo.it>
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

I ran this:

# /sbin/modprobe ip_queue

It looks like ip_queue is now loaded!

# /sbin/lsmod
Module                  Size  Used by
bridge                 47833  0
atm                    42389  1 bridge
ip_queue               14681  0
md5                     8001  1
ipv6                  239969  18
autofs4                21829  0
sunrpc                135973  1
e1000                  84885  0
e100                   36033  0
mii                     8641  1 e100
sg                     38881  0
microcode              11489  0
dm_mod                 58181  0
video                  19653  0
button                 10577  0
battery                13253  0
ac                      8773  0
ext3                  121929  2
jbd                    57561  1 ext3
ata_piix               12613  3
libata                 44357  1 ata_piix
sd_mod                 19905  4
scsi_mod              116673  3 sg,libata,sd_mod


max bunker wrote:

> Use modprobe instead,on my machine with insmod doesn't work too.
>
> Luis
>
> At 10.05 17/01/2005 -0500, you wrote:
>
>> Here it is.
>> /sbin/modprobe -l |grep ip_queue
>> /lib/modules/2.6.10-1.9_FC2smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>
>> max bunker wrote:
>>
>>> Post the output of :
>>> modprobe -l | grep ip_queque
>>>
>>> Luis
>>>
>>> At 09.52 17/01/2005 -0500, you wrote:
>>>
>>>> I tried this:
>>>>
>>>> # /sbin/depmod -a
>>>> # /sbin/insmod ip_queue
>>>> insmod: can't read 'ip_queue': No such file or directory
>>>>
>>>> Question?
>>>>
>>>> Does the ip_queue get placed into the kernel source by iptables or=20
>>>> is it something already in the kernel that just gets activated?
>>>>
>>>> max bunker wrote:
>>>>
>>>>> Try depmod -a, before loading module.....
>>>>>
>>>>>
>>>>> Luis
>>>>>
>>>>> At 09.21 17/01/2005 -0500, you wrote:
>>>>>
>>>>>> This what I have found:
>>>>>>
>>>>>> # find / -name ip_queue.ko
>>>>>>
>>>>>> /lib/modules/2.6.10-1.9_FC2/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>>
>>>>>> /lib/modules/2.6.5-1.358/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>>
>>>>>> /lib/modules/2.6.5-1.358smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>>
>>>>>> /lib/modules/2.6.10-1.9_FC2smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>>
>>>>>> # /sbin/modprobe ip_queue
>>>>>>
>>>>>> # ls -l=20
>>>>>> /lib/modules/2.6.10-1.9_FC2/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>> -rwxr--r--  1 root root 13624 Jan 13 18:37=20
>>>>>> /lib/modules/2.6.10-1.9_FC2/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>>
>>>>>> # ls -l=20
>>>>>> /lib/modules/2.6.5-1.358/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>> -rwxr--r--  1 root root 10004 May  8  2004=20
>>>>>> /lib/modules/2.6.5-1.358/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>>
>>>>>> # ls -l=20
>>>>>> /lib/modules/2.6.5-1.358smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>> -rwxr--r--  1 root root 14772 May  8  2004=20
>>>>>> /lib/modules/2.6.5-1.358smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>>
>>>>>> # ls -l=20
>>>>>> /lib/modules/2.6.10-1.9_FC2smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>> -rwxr--r--  1 root root 17964 Jan 13 18:37=20
>>>>>> /lib/modules/2.6.10-1.9_FC2smp/kernel/net/ipv4/netfilter/ip_queue.ko
>>>>>> #
>>>>>>
>>>>>> # /sbin/insmod ip_queue
>>>>>> insmod: can't read 'ip_queue': No such file or directory
>>>>>>
>>>>>> Jose Maria Lopez wrote:
>>>>>>
>>>>>>> El dom, 16 de 01 de 2005 a las 17:20, mdpeters escribi=C3=B3:
>>>>>>>
>>>>>>>
>>>>>>>> Does anyone know how I might fix this error? I am running=20
>>>>>>>> Fedora Core 2 fully patched and iptables-1.2.11, kernel=20
>>>>>>>> vmlinuz-2.6.10-1.9_FC2smp.
>>>>>>>>
>>>>>>>> # ./insmod ip_queue
>>>>>>>> insmod: can't read 'ip_queue': No such file or directory
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Try: modprobe ip_queue
>>>>>>> and check that you have the ip_queue.ko file and it's
>>>>>>> readable.
>>>>>>
>>>>>>
>>>>>> --=20
>>>>>>
>>>>>> Best regards,
>>>>>>
>>>>>> Michael D. Peters
>>>>>> Director of Security Services
>>>>>> CISSP
>>>>>> Lazarus Alliance Inc.
>>>>>> M: 502-767-3448
>>>>>> O: 502-231-8017 x8
>>>>>> H: 502-231-6923
>>>>>> F: 502-231-5347
>>>>>>
>>>>>> michael.peters@lazarusalliance.com
>>>>>> www.lazarusalliance.com
>>>>>
>>>>
>>>> --=20
>>>>
>>>> Best regards,
>>>>
>>>> Michael D. Peters
>>>> Director of Security Services
>>>> CISSP
>>>> Lazarus Alliance Inc.
>>>> M: 502-767-3448
>>>> O: 502-231-8017 x8
>>>> H: 502-231-6923
>>>> F: 502-231-5347
>>>>
>>>> michael.peters@lazarusalliance.com
>>>> www.lazarusalliance.com
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
>
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


