From: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Subject: netfilter_queue: multi-thread support
Date: Fri, 10 Feb 2012 19:27:06 +0100
Message-ID: <BLU162-W36DE4A651D427FA2FAD276F6780@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello,

 

This is a question related to netfilter_queue (user space) and multiple threads:

 

Can different threads in a single process listen to different (netfilter) queue numbers?

 

Should each of the threads peform, separately, nfq_open/nfq_unbind/nfq_bind ? Or should that be executed only once and then each thread do nfq_create_queue ? 



Thanks 		 	   		  