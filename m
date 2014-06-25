From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: LKM with hook that catches iptables hits
Date: Wed, 25 Jun 2014 14:03:14 +0200
Message-ID: <20140625120314.GA8655@localhost>
References: <53AA7C40.2010707@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53AA7C40.2010707@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandru Gheorghe <alghe.global@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Jun 25, 2014 at 10:37:36AM +0300, Alexandru Gheorghe wrote:
> Hi guys. I am trying to think of an LKM which could have a general hook
> in the sense that whatever iptables defines from user space this hook
> will catch when a rule is hit (every rule) and will log it (KERN_INFO).

That sounds like the rule tracing feature (see the TRACE target).
