From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Re: Native support of counting rules?
Date: Wed, 2 Jan 2013 23:11:01 +0800
Message-ID: <CAJZVxR=mr+-12jWqYEXHJzUTRvZ+JeOivSf09FeoNpJaR=h_iw@mail.gmail.com>
References: <20130102134421.GA17997@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=tLOtRQwXDdiHmXHNxeorYCCb9FmpiT1QF5gPCqBmY8Y=;
        b=fkGz4KG582YyUAqOrGKuz6TdULWka1XOTjjZMJCkirGwpv42BzwkzrZObiYe/WJI8+
         j2qTVadX/ZCV6a+K+srCG5j8lXGxNo3OLz7Pm3xsJyJptB9UgkEbybHUklURrJfd58hK
         fDYLS/5BYbzg9zCzIXI4bN3gq8Z5910m5472mYidNtgKG385emdaGb2PNgF7XXJky7j3
         3eLhBFXrpB39Y6vIsQiP6ex3zqihRd64ZIBb/k0Zq9LLQogezeJ5pWBppUkuX+wtK7qw
         vqLszCItUl1l/A+hgrptXlpMVdbLncieuufNVjR3V6hBNnqt+wwC0qmAyphQuNxeiHx0
         /2GQ==
In-Reply-To: <20130102134421.GA17997@devnull>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Just FYI,

I'm not in a hurry .. for now I did a little tweak to the iptables
program and accomplished this.

libiptc isn't in a stable state, right?

On Wed, Jan 2, 2013 at 9:48 PM, Aaron Lewis <the.warl0ck.1989@gmail.com> wrote:
> Hi,
>     I want to know if I could get how many rules are present, i.e in
>     filter table?
>
>     Now I do `iptables -L | wc -l` like stuff, I know it's not right,
>     but iptables itself doesn't seem to count rules anyway.
>
>     I need this just to let user to know how many rules are present,
>     without root privileges, and now being able to view actual rules.
>
> --
> Best Regards,
> Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
> Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E



-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
