From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: Re: Issue with specifying interface/NIC name with drop packets rule
Date: Tue, 25 Nov 2014 09:45:35 -0800
Message-ID: <CALPbv19G704czh3jKZmRpEgfdd65wxHsNpje=5n_UCr7qOOxsQ@mail.gmail.com>
References: <CAHRwiV37vEOmsFThw+Hhfjqb1SA05aZEUGBm1JQEB+-2WfnWWQ@mail.gmail.com>
	<CALPbv18W=zE5Eq0Wt+Dve10nGvwtB16gHzkFQo3qbkKpukhF4w@mail.gmail.com>
	<CAHRwiV0AxxPXj7OW=V4_SLKKXirdDpb5mQj1eV4Pjia9JzHTBQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=vmO7KdP7h2z1hLoBzUD1aFYg3JYYvnUxYiUHi7kZfYA=;
        b=CymPf4lLV+XINyGJ5cEAQvNLBdP0++xw5BukpknLZvPTJRNNhNnJs/D0G+mBVoAt56
         fZA3nDQLZCbHv+yper4QFr1AbjtKEDv1A3jO5YmCEk8n4g/IbWqx5vtYQOODhBgATHxD
         Nq0D824ODTyCxTPejVhKuhfjINooPf8bod4O875YJoRGAW1WRfsQ2DAKd/u/vBn9VM/0
         UyUmfE3tbuy9B8JwC6SNyZdJx0RXJzd92b4+IADIfU/VaIZRPDZMqm9EfGfTwCQzcZWz
         uiCuPHLCsHnuwrMPe05RcZtxvVkCI9hS3z1qMbqa4nCZRGryx2bLmULhtBb7LRF/ufhf
         6oUQ==
In-Reply-To: <CAHRwiV0AxxPXj7OW=V4_SLKKXirdDpb5mQj1eV4Pjia9JzHTBQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vijay Kumar K <kvijay@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

ya,
I faced same issue, the ipt library cannot be used directly. They
warned in the Readme.

You can do fork-exec of iptables or iptables-restore



On Mon, Nov 24, 2014 at 8:58 PM, Vijay Kumar K <kvijay@gmail.com> wrote:
> Hi Vishy,
>     Thanks for the quick response, we have tried with command line, that
> seems to work fine. But we need to use it through a program, are there any
> known issues with iptables library for this kind of usage?  What options we
> have to reuse the iptables in a programming model instead of command line to
> add rules to allow or drop packets on specific NICs?
>
> Please clarify.
>
> Thanks&Regards
> VijayK
>
> On Tue, Nov 25, 2014 at 2:06 AM, Vijay Viswanathan <vijay.vishy@gmail.com>
> wrote:
>>
>> Have you tried it from command line iptables ... ?
>> The readme of iptables says not to use library/API.
>>
>> On Mon, Nov 24, 2014 at 6:12 AM, Vijay Kumar K <kvijay@gmail.com> wrote:
>> > Hi ,
>> >  I am using iptables library 1.4.15 on my linux machine and building
>> > it to define and add the iptables rules. And I have multiple NIC
>> > cards("eth0" and "eth1") on my machine and i need to add the rules
>> > specific to some of these NICs. Allow and drop rules are working fine
>> > as long as the NIC is not specified, but when I add rule with the
>> > specific NIC name like "eth0" to drop packets,
>> > i see it is droping packets for all the interfaces. Is there any known
>> > issue with specifying NIC name.
>> >
>> > the invocation path is like this:
>> >    addMyRule(srcIp, srcIpNetmask, destIp, destIpNetmask,nicName,
>> > proto, sport_min,sport_max, dport_min, dport_max,precedence, action,
>> > 0) -> iptc_insert_entry
>> >    Invocation with the values:  addMyRule(inaddr_any, 0, inaddr_any,
>> > 0,"eth0", 0, 0, 65535,80,80,2,0,0)
>> > In the implementation of addMyRule, ipt_entry is instantiated and NIC
>> > name is copied to "iniface" attribute of the "ipt_ip" in "ipt_entry"
>> > e = (struct ipt_entry *)malloc(total_length);
>> >     if (nicName)
>> >     {
>> >         strcpy(e->ip.iniface, nicName)
>> >      }
>> >
>> >  I searched in the net for the known issues, but I could not find any
>> > related. Any help in this regard would be highly appreciated.
>> >
>> > Thanks&Regards
>> > Vijay
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> > the body of a message to majordomo@vger.kernel.org
>> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
