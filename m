From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: RE: Connlimit problem k2.6.18.2 , ipt1.3.7
Date: Tue, 13 Mar 2007 13:23:37 +0100 (CET)
Message-ID: <54930.195.55.244.106.1173788617.squirrel@www.arcoscom.com>
References: <00fd01c76274$a089c3e0$3464000a@oksystem.local><45F4390F.5050106@plouf.fr.eu.org><Pine.LNX.4.61.0703120026370.18623@yvahk01.tjqt.qr>
	<012a01c7647d$96aa6ef0$3464000a@oksystem.local>
	<000301c76552$f723f140$3464000a@oksystem.local>
	<44634.195.55.244.106.1173785610.squirrel@www.arcoscom.com>
	<001901c76565$8edf2740$3464000a@oksystem.local>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001901c76565$8edf2740$3464000a@oksystem.local>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

El Mar, 13 de Marzo de 2007, 12:48, Bc. Miroslav Kopecek escribi=F3:
> Off course I want help of anybody ;-)
>
> What you wrote is actually what I need! Simple step by step which let me
> know, what i need to make connlimit works.
>
> So If I understand, my problem is, that I don't have netfilter connlimit
> extension in my kernel. So I need to use latest patch-o-magic with
> download
> and compile connlimit (which is not standard part of it now) patch my
> kernel
> and add this extension... Am I right?

Yes. Patch your kernel and configure it for use "connlimit" extension.

>
> Many thanks for help. My English is not very well, so maybe I can't
> express
> myself corectlly...
> Mirek
>
>
>>-----Original Message-----
>>From: ArcosCom Linux User [mailto:linux@arcoscom.com]
>>Sent: Tuesday, March 13, 2007 12:33 PM
>>To: netfilter@lists.netfilter.org
>>Cc: kopecek@email.cz
>>Subject: RE: Connlimit problem k2.6.18.2 , ipt1.3.7
>>
>>Yes, there are many guys helping to you, think if you want their help.
>>
>>The solution:
>>   1) Download your kernel and iptables sources.
>>   2) Apply patch-o-matic
>>      a) ./runme --download (connlimit is diferent repository)
>>      b) ./runme connlimit
>>   3) Select the "connlimit" extension into your kernel config.
>>   4) Compile and install
>>   5) Reestart using your new kernel.
>>
>>If you have "iptables -m connlimit --help", then you don't
>>need to rebuild
>>your iptables. The iptables connlimit extension is included
>>yet, you only
>>need kernel netfilter connlimit extension.
>>
>>Sugestions:
>>   1) Use a well known working kernel configuration file and
>>only enable
>>the connlimit extension (plus the predefined and enabled yet).
>>   2) If you don't know how to configure/compile your kernel,
>>this is not
>>the correct list to answer about this questions (try "devel's lists").
>>   3) Patch-o-matic "./runme --help" command can help and
>>you'll need to
>>put your kernel source and iptables source directories.
>>   4) connlimit (patch-o-matic) only patch kernel, your
>>iptables 1.3.7 is
>>prepared with connlimit yet.
>>   5) All distros have their own "kernel compile process", look for it
>>into your distro documentation.
>>
>>Last notes:
>>   1) Well known to working configurations are:
>>      kernel 2.6.19.7 and iptables 1.3.7
>>      kernel 2.6.18.x and iptables 1.3.7
>>   2) When "connlimit" were included into main stream kernel,
>>will be an
>>"official way", for now, you'll need to use patch-o-matic and patch
>>your kernel. Take a look into http://www.netfilter.org and read all the
>>documentation to learn what is the "offical" way.
>>
>>Good luck and enjoy.
>>
>>El Mar, 13 de Marzo de 2007, 10:35, Bc. Miroslav Kopecek escribi=F3:
>>> Hi,
>>>    nobody can help with limiting maximum number of connection per IP
>>> adress?
>>> Is any "supported and official" way to do that?
>>>
>>> Mirek
>>>
>>>
>>>
>>>>-----Original Message-----
>>>>From: netfilter-bounces@lists.netfilter.org
>>>>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
>>>>Bc. Miroslav Kopecek
>>>>Sent: Monday, March 12, 2007 9:08 AM
>>>>To: netfilter@lists.netfilter.org
>>>>Subject: RE: Connlimit problem k2.6.18.2 , ipt1.3.7
>>>>
>>>>Hi,
>>>>  so is any "safer" and "suported" way to limit number of
>>>>connections per IP
>>>>address?
>>>>
>>>>
>>>>
>>>>
>>>>>-----Original Message-----
>>>>>From: netfilter-bounces@lists.netfilter.org
>>>>>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of
>>>>>Jan Engelhardt
>>>>>Sent: Monday, March 12, 2007 12:27 AM
>>>>>To: Pascal Hambourg
>>>>>Cc: netfilter@lists.netfilter.org
>>>>>Subject: Re: Connlimit problem k2.6.18.2 , ipt1.3.7
>>>>>
>>>>>
>>>>>On Mar 11 2007 18:14, Pascal Hambourg wrote:
>>>>>>> I can't add connlimit rule? What's wrong? Any suggestion?
>>>>>>>
>>>>>>> -----------------------------------------
>>>>>>> iptables -m connlimit -h
>>>>>>> connlimit v1.3.7 options:
>>>>>>> [!] --connlimit-above n         match if the number of
>>existing tcp
>>>>>>> connections is (not) above n
>>>>>>> --connlimit-mask n             group hosts using mask
>>>>>>>
>>>>>>> -----------------------------------------
>>>>>>> RouterBM:/home/kopecek# iptables -A FORWARD -p tcp -s
>>>>10.88.99.71 -m
>>>>>>> connlimit --connlimit-above 300 --connlimit-mask 32  -j REJECT
>>>>>>> --reject-with
>>>>>>> tcp-reset
>>>>>>> iptables: No chain/target/match by that name
>>>>>>
>>>>>> Your kernel probably does not support the connlimit match.
>>>>>The connlimit match
>>>>>> is not part of the standard kernel. It used to be included
>>>>>as a kernel patch in
>>>>>> the patch-o-matic-ng, but has been removed from the daily
>>>>>snapshots since
>>>>>> 2006/07/26.
>>>>>
>>>>>connlimit is still there (not in pomng though), it's
>>>>>out-of-out-off-tree,
>>>>>so to say. You have to patch pomng, and then patch the kernel
>>>>>*whirl* ...
>>>>>
>>>>>
>>>>>Jan
>>>>>--
>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>>
>>>>
>>>>
>>>
>>>
>>>
>>>
>>
>>
>>
>>
>
>
>
>



