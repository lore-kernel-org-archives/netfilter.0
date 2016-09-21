From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Invalid argument on 1.4.4 w/DisableExternalCache On (Kernel
 4.7.4)
Date: Wed, 21 Sep 2016 19:40:08 +0200
Message-ID: <20160921174008.GA6176@salvia>
References: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMJqGp6c2SaAb=nrCaxPVVx3_yD+RvNwmxsqW3tLRGFBSFnB1w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Burton <lburton@mrow.org>
Cc: netfilter@vger.kernel.org

On Wed, Sep 21, 2016 at 03:00:00AM -0700, Lee Burton wrote:
> Are there known issues with DisableExternalCache currently?  I was
> trying it earlier and got a ton of:
> [ERROR] inject-upd1: Invalid argument

What is the line that just follows after this? You should get a line
printing the conntrack in the log file, similar format to what you get
via conntrack -L.

> [ERROR] inject-add2: Invalid argument

This EINVAL means the kernel is rejecting the command because an
attribute is missing. With the conntrack line I mentioned, we can
guess what attribute is actually triggering the problem.

What kernel version are you using BTW?
