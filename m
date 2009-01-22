From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Thu, 22 Jan 2009 17:55:20 +0100
Message-ID: <4978A4F8.5060901@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4978425F.1030003@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

Yoann Juet wrote:
> Hi,
> 
> I see tons of messages "[warning] delayed packet?", even before the
> first failover, but nothing related to EINVAL. Does it help ?

That's another known problem of 0.9.6. Probably, you don't see EINVAL
but a message like "N entries can't be committed". I suggest you to
upgrade to latest. I'm about to release 0.9.10, using current would make
my life easier to provide you support.

> FYI, the cluster is a KVM guest using hardware virtualization with net
> virtio.

Interesting. I have never used it in such environment.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
