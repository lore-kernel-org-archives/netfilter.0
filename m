From: Martijn Lievaart <m@rtij.nl>
Subject: Re: [NEWSENDER] - Re: destination load balancing - Message is from
 an unknown sender
Date: Fri, 22 Sep 2006 08:57:13 +0200
Message-ID: <45138949.6060606@rtij.nl>
References: <F88399957644AA41B09BBDE2704CCEA8F4F0EB@raoxch01.arrow.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F88399957644AA41B09BBDE2704CCEA8F4F0EB@raoxch01.arrow.ca>
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
To: Radovan Jablonov <rjablonov@arrow.ca>, netfilter@lists.netfilter.org

Radovan Jablonov wrote:

>Hi Martijn,
>  
>

Hi,

Please keep your replies on list, and please don't toppost.

>How should I hook my custom match to iptables? Do I have to adjust
>source code? If yes, where?
>  
>

Download patch-o-matic-ng and look at the documentation for writing new 
matches. Look at existing matches, find one that you can use as a 
starting point, copy and modify.

HTH,
M4


