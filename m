From: Philip Craig <philipc@snapgear.com>
Subject: Re: creating SYN bursts
Date: Wed, 23 Nov 2005 15:45:43 +1000
Message-ID: <43840207.5080802@snapgear.com>
References: <20051122025400.GD29926@jukie.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051122025400.GD29926@jukie.net>
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
To: Bart Trojanowski <bart@jukie.net>
Cc: netfilter@lists.netfilter.org

On 11/22/2005 12:54 PM, Bart Trojanowski wrote:
> I am doing some syn-flood testing.  I would like to create bursts of
> real connections by using 'wget &' from a loop in user space, and have
> the connections "queued up".  When everything is ready, I would like to
> have all the SYNs sent out at (almost) the same time.
> 
> Is it possible to do something like this?  Can I use existing iptables
> plugins?  If not, what NF primitives should I employ?

Use the QUEUE target to send the packets to userspace, and then
have a userspace application queue them until you are ready.

