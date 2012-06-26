From: Andrew Beverley <andy@andybev.com>
Subject: Re: connmark problem
Date: Tue, 26 Jun 2012 22:35:42 +0100
Message-ID: <1340746542.1654.26.camel@andrew-desktop>
References: <CAAo+KFkwRHnyxPPaEjbhzBJaB-x3qf5w_6ogg-dJQipqP4npyg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAAo+KFkwRHnyxPPaEjbhzBJaB-x3qf5w_6ogg-dJQipqP4npyg@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1340746546;
	bh=x0sr1FagMGVJVZjy8DZt5fnBqQ9PEmhysb0rMKZts5A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=hZhrsELAIGyqAE0Pi8X3c+o8YD2T9JXmrKmsxBrJx6fNnBDLRU/sekC3HLqGawD/5
	 lB548yB3gmXNtuUFPco8VhyywLI1rmugmmb+4JapKZCoQboIkqzP2Q8AGGgENYW3/k
	 2lyb6v1o4osGe+PPNr0rD4I3F4vf/7QUXhdVck3k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2012-06-26 at 11:38 +0300, Oguz Yilmaz wrote:
> Hi
> 
> I use connmark in raw table. Please look at the following -L output.
> At the beginning of the chain I copy packet mark to the connection. -m
> mark matches packets. However -m connmark not matches. It is clearly
> visible from packet counters.
> How can we explain this?

I'm guessing this is because the raw table is traversed before
connection tracking. See:

http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg

Andy


