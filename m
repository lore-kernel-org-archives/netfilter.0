From: Rickard Eriksson <riceri@home.se>
Subject: Re: PPTP
Date: Thu, 10 Oct 2002 18:20:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA5A8CB.1090408@home.se>
References: <E131E9F1848D0148813EAF06A846608F615F70@w2ks-e2k.iconos.be> <3DA490B3.9050001@home.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: Sneppe Filip <Filip.Sneppe@cronos.be>

Rickard Eriksson wrote:

> Sneppe Filip wrote:
>
>> Rickard Eriksson [mailto:riceri@home.se] wrote:
>> >
>> >The z-newnet patch? I can't install that patch.
>> >
>> >BTW, this is the first time i am patching a kernel.
>> >
>>
>> Hi Rickard,
>>
>> What kernel version are you working from ?
>> Basically, newnat is a new API for writing connection tracking/nat
>> modules.
>>
>> The patch has been sitting in p-o-m for a long time now, and all the
>> modules from recent iptables have been converted to work with newnat
>> and don't apply on kernels witout newnat.
>>
>> Newnat has been included in the early 2.4.20-pre kernels, so from
>> 2.4.20 (or the -pre releases if you don't mind running these) onwards,
>> there will be no need to patch the kernel with newnat support anymore
>> before adding conntrackers.
>>
>> Now, if you're working from a pre-2.4.20 kernel, you need to download
>> iptables or check out CVS, then from the patch-o-matic directory
>> run "./runme *" and apply the newnat patch before trying any
>> conntrackers. That sould do the trick. You may need to apply some
>> additional stuff. IIRC, the pptp patch also needs an "unregister"
>> fix of some kind that's probably in p-o-m/pending or /submitted.
>>
>> Good luck,
>> Filip
>>
>>
>>
>
> Well i want to install 2.4.19.
>
> I have installed conntrack+nat-helper-unregister and then i could
> install znewnat-16 and then i could install pptp conntrack module.
>
> I hope it will work when i have build the kernel.
>
> Thanks for all your help!!!
>
> / Rickard
>
>
>
>
Do i need newest iptables to get the modules to work?




