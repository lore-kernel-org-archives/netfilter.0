From: Jason Opperisano <opie@817west.com>
Subject: Re: input filter
Date: Wed, 5 Jan 2005 10:48:57 -0500
Message-ID: <20050105154857.GA24445@bender.817west.com>
References: <20050104223520.2120.qmail@web53904.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050104223520.2120.qmail@web53904.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Tue, Jan 04, 2005 at 02:35:20PM -0800, Bhasker Allam wrote:
> Hi,
> I am a newbie and I was reading the howto for packet
> filter. The howto has the following picture:
> 
> Incoming                 /     \         Outgoing
>        -->[Routing ]--->|FORWARD|------->
>           [Decision]     \_____/        ^
>                |                        |
>                v                       ____
>               ___                     /    \
>              /   \                   |OUTPUT|
>             |INPUT|                   \____/
>              \___/                      ^
>                |                        |
>                 ----> Local Process ----
> 
> The input filtering is done only for local bound
> packets and after the routing decision. Is the above
> true ?

yes.

> Is there a facility to perform input filtering
> before the routing decision ? Thanks.

yes:  -t mangle PREROUTING

-j

--
"Look, just give me some inner peace, or I'll mop the floor with ya!"
        --The Simpsons

