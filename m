From: Laine Stump <laine@laine.org>
Subject: Re: [libvirt-users] netfilter+libvirt=(smth got broken?)
Date: Wed, 27 Mar 2013 14:22:37 -0400
Message-ID: <515338ED.3060009@laine.org>
References: <5149AFD3.2070108@yandex.ru> <5149BC91.4090502@yandex.ru> <20130321023046.GA4189@localhost> <514A7BFD.5060401@redhat.com> <20130321095542.GA3466@localhost> <20130322105351.GA4182@localhost> <514C9E99.3050201@laine.org> <20130326141839.GA5706@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=hqQ3gQOWUdDzU7AYH7UhxGNbw2iXu2YaNonqUAUwfzY=;
        b=rEfcQxymcFnZ7E2AkzV0IETAL6pSxGTs7LwwblhEaI5StviIwIL00UyTVxwzKOD9yH
         zXO2skXnPHTjFQ6c/jC8C80YFLeiGopsBb0joUgKs+f/2lNyoWQndTnVDBN+C6Vs4vyO
         8zh6MD8Wd17+xsm882iwgcBgMjj/Iwl7VMzEBRP3H+AqD+rArXg5WA1Uc8hUd8pl+0Yi
         9kQeohmXfYs9k9PgKXaZoUWiGtc/5OrUEpkBSIfr44BsNwu33CgCMPZb0fgNRKSd1fxm
         UpIfn2LexCx5/4qRyj40GazEkMKMMl4TqgG7Co54/BO11pC3OKbLm4EfRGUdhskQru2m
         UMDw==
In-Reply-To: <20130326141839.GA5706@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: libvirt-users@redhat.com
Cc: netfilter@vger.kernel.org

On 03/26/2013 10:18 AM, Pablo Neira Ayuso wrote:
> On Fri, Mar 22, 2013 at 02:10:33PM -0400, Laine Stump wrote:
>> On 03/22/2013 06:53 AM, Pablo Neira Ayuso wrote:
>>> On Thu, Mar 21, 2013 at 10:55:42AM +0100, Pablo Neira Ayuso wrote:
>>>> Hi Eric,
>>>>
>>>> On Wed, Mar 20, 2013 at 09:18:21PM -0600, Eric Blake wrote:
>>>> [...]
>>>>>> By looking at the changes you made:
>>>>>>
>>>>>>> --A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>>>>>>> ESTABLISHED -m conntrack --ctdir ORIGINAL -j RETURN
>>>>>>> +-A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>>>>>>> ESTABLISHED -m conntrack --ctdir REPLY -j RETURN
>>>>>> The first rule looks wrong to me indeed, traffic coming in the
>>>>>> original direction will initiate the connection to destination port
>>>>>> TCP/110. Therefore, your change is correct.
>>>>> Correct for the new kernel interpretation, but we also want to support
>>>>> use of libvirt with older kernels, preferably with a runtime check so
>>>>> that a binary compiled on an older kernel will still work after a kernel
>>>>> upgrade.
>>>> My suggestion is to relax that rule-set that you're using, ie. remove
>>>> the --ctdir. The connection tracking table and the TCP tracker already
>>>> take care for those invalid situations that you were trying to catch
>>>> with that --ctdir. You only have to add an iptables rule somewhere to
>>>> catch invalid packets.
>>> In case you need more information, have a look at:
>>>
>>> linux/net/netfilter/nf_conntrack_proto_tcp.c
>>>
>>> Basically, the TCP tracker already validates that traffic is coming
>>> from the correct direction. We have an internal state-machine for
>>> that that will put coming in the wrong direction packets into the
>>> INVALID state. If you have a rule-set whose default policy is drop or
>>> you log and drop invalid packets, it will allow you to obtain the
>>> effect you seem to be looking for. So basically, it's safe to remove
>>> the --ctdir without having a less secure rule-set.
>> So in effect, you're admitting that --ctdir is now more or less
>> unusable, since it's meaning/function can't be relied on, so everyone
>> should just avoid it. In retrospect then, it probably would have been a
>> much better decision to leave it "broken" (but at least in a
>> known/consistent/usable fashion). (Nothing to be done about that now,
>> though, since it's in the wild in both versions).
> This option has also been broken for quite some time in user-space:
>
> http://www.spinics.net/lists/netfilter-devel/msg15827.html
>
> The fix was available starting iptables 1.4.11. The kernel fix went
> into 2.6.39.
>
> I'm trying to help you to find a good solution that works in all
> cases, including old kernels, and to explain why that option, using it
> in the broken way or not, provides no safer ruleset in the TCP case.

Understood and appreciated. I'm just pointing out the futility of
"fixing" something that's already in a published API.

Now I just need to convince Stefan that rulesets without --ctdir are
just as secure (where the limit of my "convince" is "point at your
message on the list" :-)
