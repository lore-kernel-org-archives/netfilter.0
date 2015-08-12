From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: Ipset Error : ipset v6.25.1: Kernel error received: set type not
 supported (on Kernel 4.1.4)
Date: Wed, 12 Aug 2015 12:20:13 +0530
Message-ID: <CAA5aLPgeDDPzMD=4aoLY=2asWg1JN8nhWLV1qbY0XbhwwTP6wQ@mail.gmail.com>
References: <CAA5aLPh-_ySu=PFqkyyG+AzTWQo_cUc35ZcnH3W5ojQPeJeG4g@mail.gmail.com>
	<alpine.DEB.2.10.1508111211280.9289@blackhole.kfki.hu>
	<CAA5aLPj7LA3bN4NBCTvQ=FjDMy-8GZqh9nWk3groyMYOj5nQUQ@mail.gmail.com>
	<alpine.DEB.2.10.1508111320400.9289@blackhole.kfki.hu>
	<CAA5aLPhO7643BnLNNe4Kp+h6Nivvn_jtgVdRXBfWGPPPLf_kXA@mail.gmail.com>
	<alpine.DEB.2.10.1508111416010.9289@blackhole.kfki.hu>
	<CAA5aLPiNcE51=3UYfuRa8U_ueq6U7cJJPR0Tyd2cqH143vd9wg@mail.gmail.com>
	<CAA5aLPjaE_LbNwhVFjnHYUN2EsQKJKZRuXBmOxhx=6gqT+oWuw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=oYxIjTOR6r8XkMSJojwWeIhkEkmy1mo8PeyE7HGpXNQ=;
        b=tAbY3ev40+s4xLOkQMS8n89Z5sJDNNTXjBmPmHbMABperzqtHhTVGOUCgD2ykHRns1
         po0k4rMgIqeDaI4gJCe/xaTkXSla294qB+3d4lhBlJwMv7lgyqFsVLVy9HoiL1HtcJss
         sQrSNiyCWvXR9ilIZPMluwAhyMVbQeCs8EAFOodqKCDIslh1y5tiV3bsfb/dB2LmsLTk
         rtrzxL8s1KVaNwPirfUYletTCiIGnDb1Zb5+yzJ2Qk6reJjnfp3ltlVE39GYhvy9IJvu
         sJdtdCUkp/tnoZawuaHcKoXLsgvPkRLVIN6NqHbcrGzksqY2DCE9361PalXKOTtcd26Z
         2zTw==
In-Reply-To: <CAA5aLPjaE_LbNwhVFjnHYUN2EsQKJKZRuXBmOxhx=6gqT+oWuw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Well ... quite a number of tests passed succesfully... but then some
test have failed.
partial o/p of 'make tests' is

hash:mac.t: MAC: Check listing: passed
hash:mac.t: MAC: Destroy test set: passed
comment: Bitmap comment: create set: passed
comment: Bitmap comment: Check invalid length of comment: passed
comment: Bitmap comment: Add comment with max length: passed
comment: Bitmap comment: Add element with comment: passed
comment: Bitmap comment: Test element with comment: passed
comment: Bitmap comment: List set: passed
comment: Bitmap comment: Check listing: passed
comment: Bitmap comment: Delete element with comment: passed
comment: Bitmap comment: Test deleted element: passed
comment: Bitmap comment: Check listing: passed
comment: Bitmap comment: Add element with comment: passed
comment: Bitmap comment: check listing: passed
comment: Bitmap comment: Re-add element with another comment: passed
comment: Bitmap comment: check listing: passed
comment: Bitmap comment: Flush test set: passed
comment: Bitmap comment: Add multiple elements with comment: passed
comment: Bitmap comment: List set: passed
comment: Bitmap comment: Check listing: passed
comment: Bitmap comment: Delete test set: passed
comment: Bitmap comment: create set with timeout: passed
comment: Bitmap comment: Add multiple elements with default timeout: passed
comment: Bitmap comment: Add multiple elements with zero timeout: passed
comment: Bitmap comment: List set: passed
comment: Bitmap comment: Check listing: passed
comment: Sleep 5s so that entries can time out: passed
comment: Bitmap comment: List set: passed
comment: Bitmap comment: Check listing: --- .foo  2015-08-12
12:14:03.475222428 +0530
+++ comment.t.list12 2015-06-25 14:49:08.000000000 +0530
@@ -1,9 +1,9 @@
 Name: test
 Type: bitmap:ip
 Header: range 2.0.0.1-2.1.0.0 timeout x comment
-Size in memory: 1056896
+Size in memory: 1056928
 References: 0
-Number of entries: 255
+Number of entries: 510
 Members:
 2.0.1.1 timeout x comment "text message 1"
 2.0.1.2 timeout x comment "text message 2"
FAILED
Failed test: diff -u -I 'Size in memory.*' .foo comment.t.list12
make: *** [tests] Error 1

On Tue, Aug 11, 2015 at 7:16 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> looks like things will run ...
>
> I did rmmod ip_set
> then recompiled again
> and then modprobe ip_set
>
>
> and tests are now running ...
> its taking a bit time for these test to run but atleast it has not
> stopped with an error ....
>
>
> Gr8 ... Thanks for all the help
>
> On Tue, Aug 11, 2015 at 7:09 PM, Akshat Kakkar <akshat.1984@gmail.com> wrote:
>> I manually deleted all the ip_set* in kernel 2.6.32 manually
>>
>> then recompiled the ipsets but still same issue....
>>
>> is there something else also which I should delete
>>
>> On Tue, Aug 11, 2015 at 5:51 PM, Jozsef Kadlecsik
>> <kadlec@blackhole.kfki.hu> wrote:
>>> On Tue, 11 Aug 2015, Akshat Kakkar wrote:
>>>
>>>> [root@localhost ipset-6.25.1]# find /lib/modules -name ip_set_hash_ip.ko
>>>>
>>>> /lib/modules/2.6.32-279.el6.x86_64/kernel/net/netfilter/ipset/ip_set_hash_ip.ko
>>>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set_hash_ip.ko
>>>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/kernel/net/netfilter/ipset/ip_set_hash_ip.ko
>>>>
>>>> [root@localhost ipset-6.25.1]# modinfo ip_set_hash_ip
>>>> filename:
>>>> /lib/modules/4.1.4-1.el6.elrepo.x86_64/extra/netfilter/ipset/ip_set_hash_ip.ko
>>>> alias:          ip_set_hash:ip
>>>> description:    hash:ip type of IP sets, revisions 0-4
>>>> author:         Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
>>>> license:        GPL
>>>> srcversion:     E2BD7DC4C7AF706B56E2CBA
>>>> depends:        ip_set
>>>> vermagic:       4.1.4-1.el6.elrepo.x86_64 SMP mod_unload modversions
>>>
>>> The module is there, recognized by modinfo, so it should be loaded
>>> automatically, when the hash:ip type is requested by the "ipset" command.
>>> The output of "ipset help" shows that exactly the same revisions are
>>> supported by both the kernel module and ipset.
>>>
>>> Hm. Maybe older versions of the ip_set modules are already loaded in and
>>> therefore the new ones cannot be autoloaded. Remove all ip_set* modules
>>> and try to create the set again.
>>>
>>> Best regards,
>>> Jozsef
>>> -
>>> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
>>> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
>>> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>>>           H-1525 Budapest 114, POB. 49, Hungary
