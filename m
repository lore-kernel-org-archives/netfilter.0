From: Scott McWhirter <scottm@saucelabs.com>
Subject: Kernel Panic in nf_nat_cleanup_conntrack
Date: Mon, 5 May 2014 13:47:36 -0700
Message-ID: <CANB1jnDFqnTJLGmVMyVWNW45dEbpQ2rzZSd-k=+YtTi0zFMAZQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

We've been bumping into this bug
https://bugzilla.kernel.org/show_bug.cgi?id=65191 on several of our
research machines when using lxc with nat.

I see that Pablo has been working on that area of netfilter lately and
was wondering if there were a set of patches that would help us with
this issue?

I've already applied a couple to no success. I can replicate the panic
fairly easily, so I can test if the patches work if I can get an idea
of which ones to apply. We've been working with 3.11.10 and 3.13.0 on
ubuntu.

Thanks,


-- 
Scott
