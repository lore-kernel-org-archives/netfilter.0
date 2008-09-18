From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Possibilities and performance of conntrackd, NATing cluster
Date: Thu, 18 Sep 2008 16:25:02 +0200
Message-ID: <48D264BE.5030900@netfilter.org>
References: <fc69e1200809160716u3ce5a9e2wce6b0035b4f58cc3@mail.gmail.com>	 <48CFFE1A.2070205@riverviewtech.net> <48D0DD27.70109@netfilter.org> <66c343c00809180026m36cc868bpf86ea32f104df7ce@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <66c343c00809180026m36cc868bpf86ea32f104df7ce@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: julien vehent <julien@linuxwall.info>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

julien vehent wrote:
> That sounds really interesting.
> Pablo : do you have more information/articles on what is done around
> conntrackd and how to set it up in a test bed environment ?

I'm finishing the user manual for the conntrack-tools right now. It will
be available in the upcoming 0.9.8 that should be out soon - once I
finish some QA tests.

But you can check a simple testbed here [1].

> I saw you published a paper earlier this year about that, but it's not
> available online. Is there any way to get it ?

Indeed. There are a couple of them, but they are mostly about design. I
expect to publish some drafts of them as they are copyrighted (those are
university works and the publishers impose important restrictions there,
that sucks but I had no choice).

[1] http://conntrack-tools.netfilter.org/testbed.html

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
