From: Cyrill Gorcunov <gorcunov@gmail.com>
Subject: Re: [PATCH] netfilter: nf_conntrack: release conntrack from rcu
 callback
Date: Tue, 7 Jan 2014 01:44:38 +0400
Message-ID: <20140106214438.GC2360@moon>
References: <1389023672-14351-1-git-send-email-avagin@openvz.org>
 <20140106170235.GJ28854@breakpoint.cc>
 <20140106172130.GA2360@moon>
 <20140106212326.GB9894@breakpoint.cc>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=QytZ/UcuCFgDw5cL8zqxMhj7walto/F4vbddC149+HI=;
        b=lybtvzd9NpmTX58KXA4wheEgacqKD+4KPnKTXBhDqsmwv4qXrjlCuZgTDw5mCKnH9E
         CvlWJ9Ow3aJxqRJWWRM6nMoHOPu3MPuJddcPzM8S7XcKlLmDMkG5bJN8mJYBfFNmpxIp
         9iwH6f4DkxBmPaQfUc9+675X7T25ioNRqFWHDCYs1ChGJfBZ1tplvtMVMKAfGskr4fWh
         +EQxWTIJjpASf4P3QBm6n7o2Pho/LJN8dqvylMzuMiL3Xp7cKy9dnc5puw8hEycpKc8R
         Vu9Olrl1ANa6cO8j6SkG66gpEJLmFSB50F59n2eKNTl9DRUV+T4vv//LvPzOUO1OZU/b
         RJWg==
Content-Disposition: inline
In-Reply-To: <20140106212326.GB9894@breakpoint.cc>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: Andrey Vagin <avagin@openvz.org>, netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, vvs@openvz.org, Pablo Neira Ayuso <pablo@netfilter.org>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>

On Mon, Jan 06, 2014 at 10:23:26PM +0100, Florian Westphal wrote:
> > 
> > No? Or there something obvious I'm missing?
> 
> IMHO this isn't obvious at all :-)
> 
> But, in the example above, the atomic_inc_not_zero() should fail
> until after __nf_conntrack_alloc() re-inits the refcount to 1.
> 
> The mb there should make sure ____nf_conntrack_find() doesn't
> find an outdated tuple before this.

Yeah, thanks!
