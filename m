From: Ajay Lele <ajay.lele@gmail.com>
Subject: Re: nfq_bind_pf() simultaneously in 2 separate programs?
Date: Mon, 10 Jan 2011 15:36:22 -0800
Message-ID: <AANLkTi=OUOR+txCwyQiMmSOOUpnpjYB=FXC_TuVPP2o0@mail.gmail.com>
References: <AANLkTikumMyi8wSQt1ipz10w0TDyjqo6g8Wet-QJ63Pq@mail.gmail.com>
	<1294698289.29036.8.camel@ice-age>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=yukH75tuvlXgkFNJ5QRDEsuaUOvSeSU6vtjtFYvBTOs=;
        b=VD3xn3/FfFMXnaZXJ/jqAUk3cA427nrF/hY8KIFBCYoEHUDx+irRZvk+/axb73NF4P
         ihsPzeyJrXsKGc8bwIhNSGIb8OSwEybT4zphigH0mAsEZ306HttMazsILeGbX2fM31GK
         RlA0JI+uFJRnqRwxmL85t28YoGuOThBJNf21Y=
In-Reply-To: <1294698289.29036.8.camel@ice-age>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Leblond <eric@regit.org>
Cc: netfilter@vger.kernel.org

On Mon, Jan 10, 2011 at 2:24 PM, Eric Leblond <eric@regit.org> wrote:
> Hello,
>
> Le lundi 10 janvier 2011 =E0 12:31 -0800, Ajay Lele a =E9crit :
>> Hi All
>>
>> I am using netfilter_queue library (version 1.0.0, nfnetlink version
>> 1.0.0) to queue certain packets to user-space and it works great
>>
>> Now I want to run 2 instances on this program simultaneously with ea=
ch
>> program receiving and processing packets received on a different
>> queue. The 1st instance of program runs fine, but call to
>> nfq_unbind_pf()/nfq_bind_pf() for AF_INET fail in the 2nd instance
>>
>> Is it not possible to use netfilter_queue APIs simultaneously in 2
>> programs when each one of them is listening to a separate queue? Any
>> other approach which can be used to get this to work? - I don't want
>> to merge the processing of packets on the 2 queues into a single
>> program
>
> nfq_bind_pf() call is linking the kernel nf_queue capability with the
> nfnetlink_queue module for a given protocol. This has only to be done
> once on a system (as nfnetlink_queue is the only userspace queuing
> module for now).
>
> Thus your program can simply ignore the return on nfq_[un]bind_pf()
> function.

Thanks Eric for your quick reply

I tried ignoring the return from nfq_[un]bind_pf() but
nfq_create_queue() fails with return value NULL. Target machine is
running CentOS 5.3

Regards
Ajay

>
> BR,
>
>>
>> Thanks in advance
>>
>> Regards
>> Ajay
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
> --
> Eric Leblond <eric@regit.org>
>
