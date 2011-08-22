From: Vinicius Massuchetto <viniciusmassuchetto@gmail.com>
Subject: Re: Can't share ppp internet connection
Date: Sun, 21 Aug 2011 21:17:27 -0300
Message-ID: <CAJ1a923xODT+mS8EKkTrsWUh8xKNN4yQy3NGRDf7yr_+onV8+w@mail.gmail.com>
References: <CAJ1a921b0HqJmUxTfqmsO+RG56w+DS6tBoWWhPBFQb8t2cHQCQ@mail.gmail.com>
 <CAA2qdGWCeRLwrJBrXujXjf_mk=4DQ6GS+KascfZv9=sDSRw=Rg@mail.gmail.com>
 <CAJ1a920B=sXLdAXZ_Oc9MGT=MdPzV4RaWtQpsvfm1HkeX4oP9g@mail.gmail.com> <CAA2qdGUa=REEFe3861GoNUwY11yxCxYTJkhuuzSfALdu02vh6Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=ypbUn1zo865uLlsuXsM8LVg4TueJvusjxbZKpAgdjXU=;
        b=BMekUs2xHFIbI/bialqdtQ9aIsvmqUeZlSBSIOMumTUzPZbazind2tUKEC27datWVK
         HI/RoCCxZxGGXzHQ33Q6JLWtEEbokvLGj9vHW/U5payNnda3W3IkCJ8VUwf5FN6U5Yf8
         RwgyI2MYyopYVzSsSv2DLtPtXq8NF+x3eoNZ8=
In-Reply-To: <CAA2qdGUa=REEFe3861GoNUwY11yxCxYTJkhuuzSfALdu02vh6Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: Netfilter <netfilter@vger.kernel.org>

2011/8/21 Pandu Poluan <pandu@poluan.info>:
> (sorry for top posting; Gmail mobile java client sucks)
>
> No, it should be port 68 (got my web access, I can now verify the number).
>
> We want all packets *outgoing* of the box *destined* for port 68 (DHCP
> server's listening port) to bypass NAT.

I ran the command line you showed me for both ports. Got the same results, too.

-- 
Vinicius Massuchetto
