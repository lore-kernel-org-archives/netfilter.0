From: "security" <security@lea-linux.com>
Subject: Re: list delete bug: kernel crash
Date: Tue, 31 Aug 2004 13:39:24 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <001c01c48f4f$2a7f7140$0a00a8c0@aziz>
References: <003701c48ee9$e1ad1f40$0a00a8c0@aziz>
	<1093949437.2435.4.camel@nienna.balabit>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: KOVACS Krisztian <hidden@balabit.hu>
Cc: netfilter@lists.netfilter.org


>
>  As always, the first thing you should try is testing the memory of
> your computer. The problems seems to be caused by trying to call
> ip_nat_setup_info() on an already confirmed connection, which is known
> to cause hash corruption.
>

I have launch memtest86 and, surprise, i have got memory error. I think i 
have found the faulty module memory (no more memtest86 error when i leave it 
from my computer).
So i will test some day to see if i got no more crash.

I didn't think about memory because all crash was on netfilter and never with 
something else.

thanks for all. 


