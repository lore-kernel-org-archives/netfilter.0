From: Ben K <benkloester@gmail.com>
Subject: Re: iptables --string-replace
Date: Mon, 17 Jan 2011 13:44:04 +1100
Message-ID: <AANLkTimq=j65HN=oZ0VDpWnFXXgaivedZBjL4Q-z9UoH@mail.gmail.com>
References: <AANLkTinzEVbR7L8PU_qhJj4MVXKsAOTKxQfA15ZHUWGT@mail.gmail.com>
	<alpine.LNX.2.01.1101170048550.23304@obet.zrqbmnf.qr>
	<AANLkTimG67A38CXt9LYmC-NcnbLKQDF7F8WZEN8Whnk=@mail.gmail.com>
	<alpine.LNX.2.01.1101170218230.24247@obet.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type;
        bh=3w41BKIeU04jBZBN/BRda6nrGsRd6uB6t47lP5zhfGk=;
        b=ZZPVzUD+Hh3t7wjyFhFBMMiTqqnFQetzBCz7Ieicux4AMy43UogjUhPJd+wq7QAjg/
         LAD9KKtQzvwNy0BKYuXsXuHW1u2qZLYfuudT2zPSl+OiK7vymkFVd5CxRZUEZOw3qY+Y
         OAXGnRrJc2qNclCeGjxFg5n1+/uNGocNbQ8Gc=
In-Reply-To: <alpine.LNX.2.01.1101170218230.24247@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Pablo Neira Aysuo <pablo@netfilter.org>

> Don't strip Cc, and don't top post.

Sorry, missed the cc. I read the posting guidelines before mailing and
don't consider my means of quoting to be a top-post (I removed most of
the content and the quote was 'standalone', I just chose to put it at
bottom).

> Matching across packets would incur unwanted complexity.

Just curious, does the current string match implementation match
across packets? If not, then surely adding replace functionality (with
the same compromise) is not overly complex?

On Mon, Jan 17, 2011 at 12:20 PM, Jan Engelhardt <jengelh@medozas.de> wrote:

>
> On Monday 2011-01-17 00:58, Ben K wrote:
>>
>>>Does anyone know if the --string-replace functionality ever made it
>>>into iptables? If not, what are my chances of the patch from 2004
>>>playing nice with the current Git head revision?
>
>>Thank you for the speedy reply.
>>
>>So I'm guessing the answer to the main question below, about whether
>>that patch ever made it into iptables, is "no".
>>Is this because of the limitations of string matching with regards to
>>packet fragmentation, as per your response, or for some other reason
>>(eg unwanted complexity)?
>
> Matching across packets would incur unwanted complexity.
>
>>If the former, then why does iptables include the string match (but
>>not replace) extension, which surely suffers from the same
>>limitations?
>
> You'd have to ask Pablo (cc'd) who added ipt_string.c 5 years ago to
> the kernel, or even Emmanuel Roger who had it added 10 years ago to
> the iptables userspace part.
>
