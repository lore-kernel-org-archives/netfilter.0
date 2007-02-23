From: Martijn Lievaart <m@rtij.nl>
Subject: Re: iptables: hide the real web server from users
Date: Fri, 23 Feb 2007 12:05:29 +0100
Message-ID: <45DECA79.1050108@rtij.nl>
References: <176687.44934.qm@web33313.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <176687.44934.qm@web33313.mail.mud.yahoo.com>
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
To: Tim Perton <grpanosgr@yahoo.com>
Cc: netfilter@lists.netfilter.org

Tim Perton wrote:
> Thank you all for your quick reply.
> Ok for web traffic squid is fine.
> But if I have a binary socket input/output thread and
> want to pass them transparently between the user and
> System B through System A, i think that only iptables
> can do that in tcp layer.
>
> Any ideas on this?
>   

Look at rinetd.

HTH,
M4


