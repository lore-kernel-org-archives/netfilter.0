From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: help on tc with kernels >= 2.6.27
Date: Sat, 03 Jan 2009 11:11:10 +0100
Message-ID: <495F39BE.1070901@unipex.it>
References: <37b3b63f0901021046n40962c84mef64cab10153261e@mail.gmail.com> <20090102204908.7ec18094@catlap>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090102204908.7ec18094@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Jorge Bastos <jorge.decimal@gmail.com>, netfilter@vger.kernel.org

Marek Kierdelewicz wrote:
>> Hi,
> 
> Hi Jorge & List,

Hi,

> 
>> I just joined the mailing list.
> 
> It's mailing list for netfilter not Linux QoS. I think your issue is
>  more suitable for lartc mailing list (is lartc list alive by the
> way? anyone?).
> 

If I remember correctly, lartc is dead and it's joined to netfilter one.

>> I'm using tc to do traffic shaping for about 6 years Since kernels
>>> = 2.6.27 it just stoped working, and started shaping traffic to
>> 1/2kb /sec. How could this be debug? I don't see other place to 
>> request for help other than this one, and I was adviced to ask for 
>> help here too.
> 

Just tried here (with 2.6.27) with Marek example and some modifies (like
remove the tc filter and add classify into mangle) and it's works well.

Looking at the .27 changelog at:
http://kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.27
seem that there are some patches against the various htb/hfs and so on,
that can (only a supposition) introduce a problems.

Can you recreate a simple working script that show us the problem?

Michele
