From: John Howard <howardjohn@google.com>
Subject: Re: REDIRECTing many ports to one leads to 4-tuple conflicts
Date: Mon, 18 Jul 2022 07:32:17 -0700
Message-ID: <CAFH-bQzdH9Pv3fSFozQaA_eviodFW6yX-9EHTxm-NXjRsCAvpA@mail.gmail.com>
References: <CAFH-bQzpRd+ng4=cEdJgOSApSQVbQPN1pT_Q7RZd3DFNJBCs6A@mail.gmail.com>
 <CAKcfE+Zj2TJbS6pSTJDGWiMwuTi=B8O0kfaH1=GY7kYe0zjr+w@mail.gmail.com>
 <CAFH-bQzgPeeibj5qxz_qrTTK+=gjjP5PVT7W+z8ZSRxTG3g6Ug@mail.gmail.com> <CAKcfE+Zz+m8mgRTWkZ47EeviPAbizVqDSRN0Cfm+dWgnn07WeQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UrfACPA9xZdXPB67f+UyEGQE7aNlpBDdUgqgybW9lVQ=;
        b=lsejISxoW5otGZuLUJAjkfLuol8QFdKdtXxjOaBdz0r9MMk36BAGk/GPuGkPyTQ6Yb
         F1ctl9QD3bkfwKL0irxlk6fdIfTMZnrI7IqPryxwgOYcjcwM7k2AkhxEHa2im36Qbe9G
         00FRDCKzsuYBqPps9IT5CsmaBNDOhcbamekA+GC1rtqgWBfD57LsqwOTuMkSaTBM8sje
         5UDQcAJuxx767sPDh/6Jshb+qoXoVrThTGoNclk+Onw/y2wFxzuvbvh853G+aMYTAiQG
         Gd2Q88j2E/nQf9sbIuu9tbFbC35x9sEPz9Ll5eo+6Z6SoyQ+ePdFe52fibMGbyQ+jpGR
         OtGQ==
In-Reply-To: <CAKcfE+Zz+m8mgRTWkZ47EeviPAbizVqDSRN0Cfm+dWgnn07WeQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balazs Scheidler <bazsi77@gmail.com>
Cc: netfilter@vger.kernel.org

> The privilege requirement could be lifted I think, I guess you want to run this in an unpriv container?

Yes, we have a privileged component that enters the network namespace
of unprivileged containers to setup rules. So we can setup iptables
rules, etc, but in our user space proxy doing things that require
privileges link setting marks or IP_TRANSPARENT won't work.
