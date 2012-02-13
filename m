From: <abirvalg@lavabit.com>
Subject: Re: netfilter_queue: multi-thread support
Date: Tue, 14 Feb 2012 00:26:02 +0200
Message-ID: <20120214002602.70b4e0c8@wwwwww-701SD>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

This is a question related to netfilter_queue (user space) and multiple threads:
Can different threads in a single process listen to different (netfilter) queue \
numbers?

	Yes they certainly can, I do that in my project.

Should each of the threads peform, separately, nfq_open/nfq_unbind/nfq_bind ? 
should that be executed only once and then each thread do nfq_create_queue ? 

	There is no need to perform that by each thread individually. You can perform it in any thread ,e.g. in main()
	It should be executed once for each nf queue you create.
	nfq_create_queue can be done either in main (that's what I do) or in any other thread(never done that, but there is no reason it shouldn't work)

P.S. 
please CC me when replying


	

