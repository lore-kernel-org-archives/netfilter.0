From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: queue buffer size increasing howto? - solved
Date: Tue, 7 Sep 2004 19:39:13 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <876ef97a040907163945871569@mail.gmail.com>
References: <1093182015.17276.24.camel@debian>
	<876ef97a0408220750591cc852@mail.gmail.com>
	<1094285774.6293.44.camel@debian> <1094574626.15915.4.camel@debian>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094574626.15915.4.camel@debian>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Banszki Gabor <banszki.gabor@chello.hu>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 07 Sep 2004 18:30:26 +0200, Banszki Gabor
<banszki.gabor@chello.hu> wrote:
> Hi everybody!
> 
> I solved the problem by using pthread.h
> 
> The main thread in my process is reading from the queue buffer and open
> new threads for the long time tasks.
> 
> In this case I don't need to increase the buffer size of the netlink
> socket.

You will still lose some data under high enough load. This is exactly
what I did, as well, and I still needed to pump up the size of the
socket recv buffer.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

