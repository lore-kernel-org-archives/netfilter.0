From: Sky <xmaillist@skynet.be>
Subject: Re: input filter
Date: Wed, 05 Jan 2005 16:06:55 -0100
Message-ID: <41DC1EAF.1000701@skynet.be>
References: <20050104223520.2120.qmail@web53904.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bhasker Allam <allambhasker@yahoo.com>
Cc: netfilter@lists.netfilter.org

Bhasker Allam wrote:
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

   Yes, done for only for packets which are not forward (so
   packets which are for you).
	

>Is there a facility to perform input filtering
> before the routing decision ? Thanks.
> 
> Bhasker.

  Of course, see NAT, mangling, masquerading.
  (http://iptables-tutorial.frozentux.net/ is good.)

