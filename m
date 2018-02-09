From: Omri Bahumi <omri.il@gmail.com>
Subject: Re: Unable to query reply direction with conntrack-tools / libnetfilter_conntrack
Date: Fri, 9 Feb 2018 10:02:27 +0200
Message-ID: <CANtbet2EAcrua23JHmbRzqVvTJ1b-0p4=Zj5KYMeVPejquS+XA@mail.gmail.com>
References: <CANtbet1vQmGGFw7f7MkSC=+x1QWEnJA-_rEu0AT22QH4zF-FNg@mail.gmail.com>
 <c7021b70-1006-759c-bc89-15616160323a@trustiosity.com> <dc9650cb-2335-0878-0948-23ed7d5a3327@trustiosity.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Yq0BJcxXdJk86lappYsxGQ73UmuX7qqhBFuq3whKKcc=;
        b=vIcjaJhh9Z63tVlIIfFm7V3YbmMtTF5x6Vkq2pL8quLkZ4wHnVNXDXtRx0gBkxZyFa
         2l4vKJTitrD4kF+tRBdVx6yHYHDXSeY6UUB6VdwskMniJQg3nv7fADuCVP7OoXH9N2Em
         xegRSnRgvuELk/mOz+G/9ss5uGiM/iypCd7aisi5xcuQclyK9fKooXPzgcmRgwqRqTC2
         JqfqAkuCZadJyBT1jIiA1vYvC4u5qDlc5oED6WhahNoHiyqOyubur/2DmiTOh0qZtV1L
         gysF3Q/+FARjrmLGZ1BlHet8+la/XMu69n7THDOpPoLAvUOqR/sQfjShOyvwzaoscifA
         F69g==
In-Reply-To: <dc9650cb-2335-0878-0948-23ed7d5a3327@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: zrm <zrm@trustiosity.com>
Cc: netfilter@vger.kernel.org

Thanks for the prompt response! I tried the example code again with
just swapping orig with reply like you suggested and it worked!
Where is the documentation describing this behaviour?

I also tried conntrack -G again - it was consistent with the behaviour
you were describing.
I ran it under strace -e sendto,recvfrom and it seems like it does get
flows back from the kernel, it just doesn't print anything - like you
described.
It probably applies the same filtering logic it runs on -L when running -G.

I guess this all boils down to a conntrack-tools bug then?

Thanks again for the help!
Omri
