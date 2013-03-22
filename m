From: Laine Stump <laine@laine.org>
Subject: Re: [libvirt-users] netfilter+libvirt=(smth got broken?)
Date: Fri, 22 Mar 2013 14:10:33 -0400
Message-ID: <514C9E99.3050201@laine.org>
References: <5149AFD3.2070108@yandex.ru> <5149BC91.4090502@yandex.ru> <20130321023046.GA4189@localhost> <514A7BFD.5060401@redhat.com> <20130321095542.GA3466@localhost> <20130322105351.GA4182@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:sender:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=SSfeycgDhKjzsmVAUxVmKl/gSWZWSuI5U4oep18zHEs=;
        b=kDejYxnJCKFYQhkg+oeGxPpkdNDMiYK0S+tJOecQ4qFmO30K5CFMQfCyBB0dtzr9OW
         e7eiUP6C3YRqp3hEed8F97Ca2u3P5JaBVy9blNwJv4ozLWcw2rOJ2s7WWrGXJKApJBuV
         6uB86adMA3O1p+7yhj8SyBWg+Kh4uHCtkHIbU7TtmTPy6d4cNATD5HVp9eGiB3C1zrz4
         oORNmDuUUUmHAf8LR64NZ5sBVmfRfnzCDE8cnb68c6c4alLGCWv3vaS3DFfXaqiHJQBK
         G8Q1qpT9iZGX7ZRJdsNh27TRgVYoKvuy23LmINXdE5rMudIdOUajRqeczgcGHsbWxpQV
         1mig==
In-Reply-To: <20130322105351.GA4182@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, libvirt-users@redhat.com

On 03/22/2013 06:53 AM, Pablo Neira Ayuso wrote:
> On Thu, Mar 21, 2013 at 10:55:42AM +0100, Pablo Neira Ayuso wrote:
>> Hi Eric,
>>
>> On Wed, Mar 20, 2013 at 09:18:21PM -0600, Eric Blake wrote:
>> [...]
>>>> By looking at the changes you made:
>>>>
>>>>> --A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>>>>> ESTABLISHED -m conntrack --ctdir ORIGINAL -j RETURN
>>>>> +-A FI-vnet0 -p tcp -m tcp --sport 110 -m conntrack --ctstate
>>>>> ESTABLISHED -m conntrack --ctdir REPLY -j RETURN
>>>> The first rule looks wrong to me indeed, traffic coming in the
>>>> original direction will initiate the connection to destination port
>>>> TCP/110. Therefore, your change is correct.
>>> Correct for the new kernel interpretation, but we also want to support
>>> use of libvirt with older kernels, preferably with a runtime check so
>>> that a binary compiled on an older kernel will still work after a kernel
>>> upgrade.
>> My suggestion is to relax that rule-set that you're using, ie. remove
>> the --ctdir. The connection tracking table and the TCP tracker already
>> take care for those invalid situations that you were trying to catch
>> with that --ctdir. You only have to add an iptables rule somewhere to
>> catch invalid packets.
> In case you need more information, have a look at:
>
> linux/net/netfilter/nf_conntrack_proto_tcp.c
>
> Basically, the TCP tracker already validates that traffic is coming
> from the correct direction. We have an internal state-machine for
> that that will put coming in the wrong direction packets into the
> INVALID state. If you have a rule-set whose default policy is drop or
> you log and drop invalid packets, it will allow you to obtain the
> effect you seem to be looking for. So basically, it's safe to remove
> the --ctdir without having a less secure rule-set.

So in effect, you're admitting that --ctdir is now more or less
unusable, since it's meaning/function can't be relied on, so everyone
should just avoid it. In retrospect then, it probably would have been a
much better decision to leave it "broken" (but at least in a
known/consistent/usable fashion). (Nothing to be done about that now,
though, since it's in the wild in both versions).

(I'm especially sensitive about this type of problem because this is the
3rd time in a week that I've been burned by incompatible changes to
kernel ABI. I feel like Joe Btfsplk.)
