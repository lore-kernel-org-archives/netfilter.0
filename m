From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: How to flush the connection state if conntrack is build in the
	kernel
Date: Sun, 16 Jan 2005 21:54:59 -0500
Message-ID: <876ef97a05011618543ebe32c5@mail.gmail.com>
References: <002301c4fc24$916e8ca0$aa0ba8c0@l7.com.tw>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002301c4fc24$916e8ca0$aa0ba8c0@l7.com.tw>
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
To: Vincent <cs83152@csie.chu.edu.tw>
Cc: iptables <netfilter@lists.netfilter.org>

On Mon, 17 Jan 2005 07:38:54 +0800, Vincent <cs83152@csie.chu.edu.tw> wrote:
> If I build the iptables connection tracking into kernel. How can I flush
> the connection state clean.

Without ctnetlink from patch-o-matic in the kernel, you can't. Install
ctnetlink from patch-o-matic and you will be able to write a program
that can delete individual conntrack records with netlink messages.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

