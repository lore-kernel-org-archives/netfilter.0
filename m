From: Pawel Oleksik <oleksik@awa.mat.agh.edu.pl>
Subject: Re: conntrack
Date: Sun, 6 Nov 2005 09:02:23 +0100
Message-ID: <20051106080223.GA26011@awa.mat.agh.edu.pl>
References: <20051105202050.GA24788@awa.mat.agh.edu.pl>
	<1131224098.3954.175.camel@bibo.spenneberg.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1131224098.3954.175.camel@bibo.spenneberg.de>
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
Content-Transfer-Encoding: 7bit
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: netfilter@lists.netfilter.org

On Sat, Nov 05, 2005 at 09:54:57PM +0100, Ralf Spenneberg wrote:
> You need Linux Kernel 2.6.14 and need to specifiy the kernel directory
> while compiling.
> 
> Ralf
> 

Of course, I did it.
Actually, I've compiled 2.6.14 but still running 2.6.13.
So, for configuration of I run:
./configure --with-kernel=/usr/src/linux-2.6.14

But it didn't help.

P.O.

ps. The mentioned file
(libnetfilter_conntrack/libnetfilter_conntrack_extensions.h) is not present in
any of sources of: libnetfilter_conntrack-0.0.20, libnfnetlink-0.0.11,
conntrack-0.90, iptables-1.3.[34].

Moreover, linux_list.h is in sources of iptables-1.3.4, but installation will
not copy it in any include/ directiory. So, one has to do it himself.


