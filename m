From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: NAT table bypass for local traffic
Date: Sat, 1 May 2010 09:53:40 +0530
Message-ID: <AANLkTil6_D7v6GBvdzz0js12Mb48MtgrUoyuzX-vP241@mail.gmail.com>
References: <q2xcfeab66d1004282325wbf9a93aduf3a8fc2d82ee90b0@mail.gmail.com>
	 <001636c5c15232dea504855f65c2@google.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type;
        bh=VQDXuQedc6j4+dEIaBrkR7uDv2N5Q6kSX8sdf8ujnb0=;
        b=IoAzq7ZUKRXwSMmqbZxRSUWJBed1Bpjp2lYT4no7XSSVr9F4vgsqABUex6PLU12a+I
         h7vw4RAsk3sUhRMu7/Hg8UeHtV6McnkyvlQO6K3ml9sGDrMSof1mmr95IHodrOOLbf4O
         b5e3yuJOL0qJBWVnQf3+gFoRb3NIfSKlAyiCQ=
In-Reply-To: <001636c5c15232dea504855f65c2@google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: billprozac@gmail.com
Cc: Jan Engelhardt <jengelh@medozas.de>, netfilter@vger.kernel.org

>On Thu, Apr 29, 2010 at 6:07 PM,  <billprozac@gmail.com> wrote:
> The echo-reply does not.
>
> On Apr 29, 2010 2:25am, ratheesh k <ratheesh.ksz@gmail.com> wrote:
>>  >>the outgoing echo-reply matches to it and thus does
>>
>> > not show up in nat OUTPUT/POSTROUTING.
>>
>>
>>
>> Does echo reply will show up in nat PREROUTING chain ?
>>
>>
>>
>> Thanks,
>>
>> Ratheesh

Is icmp different from other protocol packets ?

My understanding is  : - { In a router }  whenever a packet hits
PREROUTING  chain , a tuple is created  and state is made NEW by
conntrack module . When the packet goes out of POSTROUTING chain,
install  original and reply direction tuples in hash table . When
reply packet comes back and hits PREROTUING chain , state is made
ESTABLISHED .

So , in icmp , whenever request goes out itself  , state will be made
ESTABLISHED ???

Thanks,
Ratheesh
