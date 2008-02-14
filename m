From: "Thomas Boland" <tom@t0mb.net>
Subject: Re: nfq_unbind_pf and nfq_bind_pf return values different in 2.6.23
Date: Thu, 14 Feb 2008 23:38:40 -0000 (UTC)
Message-ID: <60218.88.208.230.12.1203032320.squirrel@t0mb.net>
References: <47B39D5B.9080804@t0mb.net>
    <20080214192819.GB21538@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080214192819.GB21538@bayen.regit.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, tom <tom@t0mb.net>, netfilter@vger.kernel.org

Hi Eric,

Thank you for getting back to me.

> Hi,
>
> On Thursday, 2008 February 14 at  1:46:03 +0000, tom wrote:
>> Hi,
>>
>> I haven't touched C for a while now, and have been using python.  I used
>> supposed to make ipq obsolete anyhow, and the author of python ipqueue
>> now recommends nfqueue.  Unfortunately, it seems that nfqueue has been
>> broken as of kernel 2.6.23 due to changes in the return values of
>> nfq_bind_pf and the unbind equivalent.
>
> Return code of nfq_unbind_pf has to be ignored in recent kernel.
>
>> The code expects 0 to be
>> returned, and complains of failure otherwise.  I was just wondering if
>> someone could tell me how to interpret the return values and then I can
>> fix nfqueue.
>>
>> At the moment, this is the problem unless I just fudge it so it doesn't
>> bail out at this point:
>> If I fudge it so as to just print out the return codes, I get this:
>>
>> localhost Wall # python testq.py
>> NFNETLINK answers: Invalid argument
>> -22
>> NFNETLINK answers: Device or resource busy
>> -16
>
> This is bad ! someone of my team has just encounter a similar problem on
> 2.6.24.2. Did you use compiled-in Netfilter (opposed to Netfilter in
> loadable modules)

Yes, I have been using it compiled in, using 2.6.23.  I am led to believe that
there is no difference on the later kernels, so haven't tried upgrading (despite
the unrelated local root exploit!)

>
> PS: Could you tell me where to find the python binding for NFQUEUE ?
>

I actually got it from the page for the IPQ bindings:

http://woozle.org/~neale/src/ipqueue/


On another note, I tried converting the 3 instances of nfnl_talk to nfnl_query
in libnfnetfilter (or perhaps libnetfilterqueue, I can't remember, I'm at work
at the momment), and it doesn't complain, but I don't think it's working.  My
knowledge of these things isn't enough to debug it properly I'm afraid, but I
gather that it's the return code of nfnl_talk that is causing the problem...  I
haven't got it in front of me (and i should be working at the moment!!!)

Tanks for your help.  Tom.


> BR,
> --
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>


