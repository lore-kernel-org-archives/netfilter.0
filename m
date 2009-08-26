From: Peter Chacko <peterchacko35@gmail.com>
Subject: Re: What category of Firewall does Netfilter fall under?
Date: Wed, 26 Aug 2009 14:31:19 +0530
Message-ID: <1f808b4a0908260201r7c8b7e90q1434112e85a09080@mail.gmail.com>
References: <f66b95be0908260147k3676be79h10842cc9a49754ef@mail.gmail.com>
	 <56378e320908260153s34603098s34debbf22f0c9b43@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=xZQ69vkzbeQwrKrdYSdL4KcvYSiWvEVhl98M6Cr5D1U=;
        b=A4BguQDHo5+mohtuMywtXm7IFjnp029UM9TugFMRvU4Cg5JQgIg9eY/db+NsFoQBin
         y62O1V3ICpZBIWjsTUEzXzknRf5z41qmvHbvSDfdqD9a6Hj3HhgnLDoZRqiRRVAVg88u
         T6z+HoxZE/lo06/Lgb2DFpVVwClMmLhoNNyJ0=
In-Reply-To: <56378e320908260153s34603098s34debbf22f0c9b43@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: tom murphy <tommurphy105@gmail.com>, netfilter@vger.kernel.org

One clarification related to this, whats the difference between
advanced string matching capability and L7 filter based firewall ? The
obvious difference i see is string matching is a kind of stateless ,
L7 filter if we are using urls as the strings.
if string matching is integrated with  ftp/http connection tracking
module, do we really need L7 -filter module also ?

Thanks in advance for sharing your inputs.
Peter chacko.

On Wed, Aug 26, 2009 at 2:23 PM, Richard Horton<arimus.uk@googlemail.co=
m> wrote:
> 2009/8/26 tom murphy <tommurphy105@gmail.com>:
>> Dear experts,
>>
>> How would one classify netfilter?
>>
>> Its seems there are at least 3 categories of firewall:
>> 1) packet filter (stateless filtering)
>> 2) stateful filter
>> 3) appliaction-level filter (aka. proxy filter)
>
> And as outlined by yourself and below by me... ipt is atleast 2 of th=
e 3.
>
> [snip]
>> Any opinions or comments on helping me pigion hole Netfilter/iptable=
s.
>> Perhaps stateful filter implies packet filter also.
>
> Just my personal opinion but for a firewall to be a stateful firewall
> it must by definition carry out packet filtering.
>
> iptables in its base form is a packet filtering firewall. Add the
> conntrack support and it becomes a stateful firewall. Add the advance=
d
> matching abilitiy and the L7 capability and it becomes an application
> firewall.
>
> I'd be inclined though to classify ipt as a stateful firewall though
> for most uses as the application firewall ability is provided by
> additional components and may, depending on definition, not fully
> qualify as an application firewall.
>
>
>
>
>
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian =
=46orest Cats
> http://www.pbase.com/arimus - My online photogallery
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Best regards,
Peter Chacko

NetDiox computing systems,
Network storage & OS  training and research.
Bangalore, India.
www.netdiox.com
080 2664 0708
