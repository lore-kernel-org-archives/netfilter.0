From: Christian Pernegger <pernegger@gmail.com>
Subject: Re: Extremely slow upload (and more) from behind NAT
Date: Tue, 16 Aug 2011 15:01:55 +0200
Message-ID: <CAKbQEqGpmi0Fs0QfVk+DZmZzrAreXRVdfoBP9Jv4NhR4Lipuaw@mail.gmail.com>
References: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
 <4E4555A2.4090705@tolaris.com> <CAKbQEqG5kBPrqBqdMpyufWpioeE6A0_zpXgEPnYeCuPk3JmpxA@mail.gmail.com>
 <4E457C6C.7080808@tolaris.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=ztptRQRYtuRZHZcCkAf2TFITHMEcaoy193saNrzEJAs=;
        b=iMuOr4QdTZcpMlnXfvmDSyUUH+WG0zSu2SqUWhvU6pm3QJd0p79w18Q5NCtshu7Jrd
         VWzK4NNzTKcmG3r7hEZ1cMnmrnJFKVPS+aniqHu4uZZlrydXznxQKMVud7KAA1NfQ3Ev
         ZB8j+/ZUMJRTNNQHWc8y8VNteuzu0PjoU54lQ=
In-Reply-To: <4E457C6C.7080808@tolaris.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Tyler J. Wagner" <tyler@tolaris.com>
Cc: netfilter@vger.kernel.org

> You said the problem only happens to NAT'ed traffic. What if it's not
> NAT, but eth0, that's the issue? Try swapping eth0 and eth1 and see if
> the problem affects traffic to/from the router as well.

Yes! That was it (in a way). Over the long weekend I cobbled together
a replacement router, booted it from an image of the first one and of
course it worked perfectly ... ...

So it's some kind of hardware issue in the router - or one of the
cables / switches is bad intermittently and all the un-, replugging
and wiggling about "fixed" it for now. Strange that the problem only
affected the upstream, though.

Either way, netfilter's not to blame. I'm terribly sorry for having
wasted your time.

Regards,

Christian
