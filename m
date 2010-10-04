From: Shihwei Li <lishihwei@gmail.com>
Subject: Re: nfqnl_test exits abnormally while monitoring some TCP packets.
Date: Mon, 4 Oct 2010 11:29:00 -0400
Message-ID: <AANLkTimqAXXU1dYszmHkVDvxT1uPks9SwazoqCwwoUzc@mail.gmail.com>
References: <AANLkTikz1tOWnvTYXZ1Z3cBh+mZLZ_qz2sgmFS94fT3g@mail.gmail.com>
 <AANLkTikR7ok7i+bv7yHS+3HpnsUCNdHyU9zvO=_JrNjQ@mail.gmail.com>
 <AANLkTikGkKeRXZOjVA=Rczts7f7VuEF9knRrpqmHxHGX@mail.gmail.com>
 <AANLkTinzHRReriT5p0GE7fdH1Ko__f3MtLn_Vxxa1eJR@mail.gmail.com> <AANLkTinC-YtR3h2WmxiZwLaKzEr8aL4=rOb-3mKQiwdx@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=JkbykKY/GdJ/NZABeW/dwS19UriTFa95SZoAO5/SWr4=;
        b=PF6jFGE2wKcK/aQl6CYjWpacuYGTuRB2GFEZyEB4w/2Uc4kyrtIXoQUUXZEsH+zW16
         kO8bJMZCBcXlAKMcj3svzFfpYeNGGAjMWESmMJ7Dd1PHonJjYnbyksTh01b2xUvAmHJh
         6RpK86zQFUVmo+w/bsZK0SZTV6XFBCi8JOI1I=
In-Reply-To: <AANLkTinC-YtR3h2WmxiZwLaKzEr8aL4=rOb-3mKQiwdx@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mistick Levi <gmistick@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Yechiel,

Thank you very much. I will try them.

--peter




2010/10/2 Mistick Levi <gmistick@gmail.com>:
> Hi,
>
> You could search some information about "NF_STOLEN" , but you'll have
> to reinject the packet's later... and i don't have enough info about
> that.
>
> and you could also change you're "recv loop" so that it wont execute
> "handle_packet", but instead all it will do is queue the packet in
> you're own queue... and continue extracting packets from the socket,
> and you'll have a =C2=A0different thread (hopefully on other cpu) tha=
t will
> take that packet and execute "handle_packet"...
>
> a good documentation is:
> http://www.netfilter.org/projects/libnetfilter_queue/doxygen/
>
>
> also, you asked before if you could increase the buffer space... you
> can, with the network options of: wmem and rmem... google about it.
>
> Kind regards,
> Yechiel Levi.
>
> On Fri, Oct 1, 2010 at 2:42 PM, Shihwei Li <lishihwei@gmail.com> wrot=
e:
>> Hi Yechiel,
>>
>> Thank you so much. Now I have a better understanding about the probl=
em.
>>
>> Sorry for asking more questions, because it was not easy to find
>> documents describing how the netfilter_queue works..There are still
>> few things I am not clear about:
>>
>> * Verdicts: I am confused by the verdict and the return of the callb=
ack.
>>
>> =C2=A0 From your description, I got the impression that I can issue
>> verdict earlier in the callback, so even though the packet is still
>> processed by the callback (i.e the callback() is not returned yet.),
>> the kernel already can do something, say remove the packet out from
>> the kernel buffer?
>>
>
> NF_STOLEN, but it's not "returning the verdict earlier in the
> callback", its finishing the callback...
>
>> =C2=A0What is the relationship between the buffer space and verdict =
and
>> their relationship to the callback? Can the kernel or the
>> netfileter_queue do anything before the callback() returns?
>>
>
> the buffer that is failing , is the buffer that is used to store the
> packet's in "COPY_PACKET" mode. you extract messages from that buffer
> by using the "recv" on the socket.
>
> the packet's still reside in the kernel queue.. ( which its size is
> defined by the recv option or by set_queue_maxlen function)
>
>
>> =C2=A0 How do I do "save that message in you're own userspace queue =
and
>> issue verdict later..."? Do you mean that I can take the packet and
>> put it into my own queue in the userspace and return the callback w/=
o
>> issuing any verdict? What does the kernel or the netfilter_queue do =
to
>> a packet that is w/o a verdict?
>>
>> * What is the difference between queue_length and buffer space? Will
>> the buffer space increase while the queue_lengh increases?
>>
>>
>> --peter
>>
>>
>>
>> 2010/10/1 Mistick Levi <gmistick@gmail.com>:
>>> Hi,
>>>
>>> the quick answer:
>>> 1. don't die when you get "recv - failed" since it mean's you're
>>> buffer is done, keep on the loop.
>>> 2. don't do any heavy work on the callback.
>>> 3. try to minimize I/O operations in you're callback, since they ar=
e
>>> considered heavy, for example, writing to log will take "TONS" of
>>> time...
>>>
>>> the "no buffer space available" issue is due to the program not
>>> receiving packets fast enough and the allocated kernel buffer is
>>> filling up with message's until you'll receive messages will keep o=
n
>>> dropping.
>>>
>>> what you should do is finish the callback function asap.
>>> you could either:
>>> =C2=A01. issue verdict faster..
>>> 2. if you need to do some work on the packet before issue a verdict=
,
>>> you could save that message in you're own userspace queue and issue
>>> verdict later...
>>>
>>> the problem with the 2nd option is that now the "Queue length" of t=
he
>>> libnetfilter_queue will be filled... you could increase it too when
>>> you initialize the queue, or when you with recv...
>>>
>>> Hope i've helped.
>>>
>>> Kind regards,
>>> Yechiel Levi
>>>
>>
>
