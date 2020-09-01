From: Florian Westphal <fw@strlen.de>
Subject: Re: netfilter_queue tutorial
Date: Tue, 1 Sep 2020 16:41:34 +0200
Message-ID: <20200901144134.GJ7319@breakpoint.cc>
References: <2519CEB2-FFCB-42DD-8C71-7077290831E3@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2519CEB2-FFCB-42DD-8C71-7077290831E3@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomasz W <tomaszw104@gmail.com>
Cc: netfilter@vger.kernel.org

Tomasz W <tomaszw104@gmail.com> wrote:
> Good Morning,
> 
> can anyone, pretty please, guide me or provide me with a decent tutorial on marking packets? Documents and example files are not very helpful. I am trying to integrate netfilter_queue with my software that capture packets with libpcap and analyse those with nDPI.

netfilter_queue is only applicable if you queue/capture packets with 'nft
queue' or the iptables NFQUEUE target.  It can't be used to 'mark'
arbitrary packets coming from a different source.
