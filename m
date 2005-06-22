From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: "No chain/target/match by that name" when using -m state
Date: Wed, 22 Jun 2005 17:21:08 +0200
Message-ID: <007401c5773e$0c6e2570$4206a8c0@loki>
References: <87eeecff050622080541743401@mail.gmail.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi everybody,

On Wednesday, June 22, 2005 5:05 PM,
Ami Ganguli wrote:

> [...]
> so I figure I must have the necessary bits installed.
>
> Any ideas or hints on what I should do next to debug this?

It's possible that just the ipt_state module is missing. You can try
modprobe ipt_state
If it works after that, everything is fine, but if it complains that the 
module cannot be found, you might have to reconfigure, recompile your kernel 
(modules) or get another kernel image from your distribution so you have the 
code either built into the kernel, or as module, where module should be the 
better choice under normal conditions.

Good luck,

Marius 


