From: Martijn Lievaart <m@rtij.nl>
Subject: Re: destination load balancing
Date: Thu, 21 Sep 2006 23:27:04 +0200
Message-ID: <451303A8.8010203@rtij.nl>
References: <F88399957644AA41B09BBDE2704CCEA8F4F0C9@raoxch01.arrow.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F88399957644AA41B09BBDE2704CCEA8F4F0C9@raoxch01.arrow.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Radovan Jablonov <rjablonov@arrow.ca>
Cc: netfilter@lists.netfilter.org

Radovan Jablonov wrote:

>Hello,
>
>Has iptables possibility (or will have) to use other load balancing
>methods/algorithms (for example: weighted round-robin, hash, load agent,
>custom algorithm)?
>  
>
No, not directly.

If you can set a fwmark based on some criterium you could implement more 
advance schemes, but that requires some custom match the YOU have to write.

So a hash based load balancing could be implemented faily easily, just 
write a module that sets fwmark based on the hash. I guess more people 
would be interested in this . (If only to load balance over multiple 
links, f.i.).

Load balancing based on some kind of load agent would be more difficult, 
one has to communicate with userspace for this. I imagine many people 
would be interested in this.

Weighted round robin is actually fairly easy by using the nth match. 
lets say you want 2/3 go to A and 1/2 3 go to B. Just use nth to devide 
in 3's and send cases 0 and 1 to A and case 2 to B.

M4


