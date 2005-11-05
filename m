From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: conntrack
Date: Sat, 05 Nov 2005 21:54:57 +0100
Message-ID: <1131224098.3954.175.camel@bibo.spenneberg.de>
References: <20051105202050.GA24788@awa.mat.agh.edu.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051105202050.GA24788@awa.mat.agh.edu.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: Pawel Oleksik <oleksik@awa.mat.agh.edu.pl>
Cc: netfilter@lists.netfilter.org

You need Linux Kernel 2.6.14 and need to specifiy the kernel directory
while compiling.

Ralf

Am Samstag, den 05.11.2005, 21:20 +0100 schrieb Pawel Oleksik:
> Hello,
> 
> I'd like to check the 'conntrack' tool. However, I can not compile it.
> (Actually, I cannot compile libnetfilter_conntrack-0.0.20)
> There is neither "linux_list.h" nor
> "libnetfilter_conntrack/libnetfilter_conntrack_extensions.h" header files.
> I know, where to find the first of them, but what about the second?
> 
> Could you give me some hints?
> 
> P.O.
> 
-- 
Ralf Spenneberg
OpenSource Training                     http://www.opensource-training.de
Webereistr. 1                           48565 Steinfurt           Germany



