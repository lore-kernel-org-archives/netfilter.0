From: "T. Horsnell (tsh)" <tsh@mrc-lmb.cam.ac.uk>
Subject: Re: p.o.m-ng+linux-2.6.2+ctnetlink
Date: Thu, 19 Feb 2004 19:11:02 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AttZe-001HQX-W5@alf1.lmb.internal>
References: <739652C2AFA4834AAB5986A215F68CEC0165A5@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <739652C2AFA4834AAB5986A215F68CEC0165A5@svr1.home.compsup.net> from
 Carl Farrington at "Feb 19, 2004 05:01:52 pm"
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Carl Farrington <carl@compsup.net>
Cc: netfilter@lists.netfilter.org


I'm likewise confused. Maybe I'm jumping the gun a bit. I just
want to experiment with nfnetlink-ctnetlink-0.13, so perhaps
I'll revert to a late 2.4 kernel.

Thanks,
Terry.

>Well it looks like patch-o-matic-ng doesn't support 2.6 yet. I find it
>very confusing. The only information I found on kernel 2.6 was a very
>short "News" from December 2003 which said "expect a patch-o-matic-ng
>which will support 2.6". Which led me to think NG would work on 2.6 but
>alas not yet.
>
>> -----Original Message-----
>> From: T. Horsnell (tsh) [mailto:tsh@mrc-lmb.cam.ac.uk]
>> Sent: 19 February 2004 15:41
>> To: netfilter@lists.netfilter.org
>> Subject: p.o.m-ng+linux-2.6.2+ctnetlink
>> 
>> Problem using patch-o-matic-ng-20040217 to patch kernel 2.6.2
>> and iptables-1.2.9, to include the nfnetlink-ctnetlink-0.13 patch.
>> 
>> When I use .runme to test this patch, it reports:
>> 'Patch nfnetlink-ctnetlink-0.13 applies cleanly'
>> When I actually install the patch, it reports errors,
>> but installs it anyway.
>> 
>> Re-make of the kernel then fails:
>> 
>> [root@dev1 linux-2.6.2]# make bzImage
>>   HOSTCC  scripts/modpost.o
>>   HOSTLD  scripts/modpost
>> make[2]: `scripts/fixdep' is up to date.
>> scripts/kconfig/conf -s arch/i386/Kconfig
>> net/ipv4/netfilter/Kconfig:593: syntax error, unexpected T_WORD
>> net/ipv4/netfilter/Kconfig:595: invalid menu option
>> make[2]: *** [silentoldconfig] Error 1
>> make[1]: *** [silentoldconfig] Error 2
>> make: *** [include/linux/autoconf.h] Error 2
>> 
>> Any advice?
>> 
>> Cheers,
>> Terry.
>> 
>> 
>> 
>> 
>> 
>>
>========================================================================
>=
>> Welcome to Patch-o-matic (1.11)!
>> 
>> Kernel:         /usr/src/linux-2.6.2
>> Iptables:       /usr/src/iptables
>> 
>> Each patch is a new feature: many have minimal impact, some do not.
>> Almost every one has bugs, so don't apply what you don't need!
>> -------------------------------------------------------
>> Already applied:
>> 
>> Testing nfnetlink-ctnetlink-0.13... not applied
>> The nfnetlink-ctnetlink-0.13 patch:
>>    Author: Harald Welte <laforge@gnumonks.org>, Jay Schulist
>> <jschlst@samba.org>,
>>    Status: Under development, but stabilizing now.
>> 
>>         Patrick McHardy <kaber@trash.net>
>> 
>>    Add recent work by patrick (notifiers, event messages to userspace.
>> 
>> -----------------------------------------------------------------
>> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] t
>> Patch nfnetlink-ctnetlink-0.13 applies cleanly
>> -----------------------------------------------------------------
>> Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
>> ERROR (7 rejects out of 52 hunks)
>> 
>> Excellent! Source trees are ready for compilation.
>>
>========================================================================
>=
>> 
>> Checking whether the patch was actually installed:
>> 
>> 
>>
>========================================================================
>=
>> Welcome to Patch-o-matic (1.11)!
>> 
>> Kernel:         /usr/src/linux-2.6.2
>> Iptables:       /usr/src/iptables
>> 
>> Each patch is a new feature: many have minimal impact, some do not.
>> Almost every one has bugs, so don't apply what you don't need!
>> -------------------------------------------------------
>> Already applied:
>> 
>> Testing nfnetlink-ctnetlink-0.13... applied
>> 
>> Excellent! Source trees are ready for compilation.
>>
>========================================================================
>=
>> 
>
>
>


