From: ASHISH <ashishis@gmail.com>
Subject: Re: UDP packet storm
Date: Tue, 28 Dec 2004 02:08:08 +0530
Message-ID: <558224e304122712386be36d59@mail.gmail.com>
References: <1139dfe204122711405ed3a4e7@mail.gmail.com>
	<558224e304122712367f38de5d@mail.gmail.com>
Reply-To: ASHISH <ashishis@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <558224e304122712367f38de5d@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

I would suggest the following method:-

1. Go through  the network activity logs, and estimate the average no
of packets per unit time that you consider as normal to your packet.

2. Then think of a tolerance margin.

3. Write appropriate rules for limting the rate of packets.

I would recommend genarating a cron job that estimates the average
number of packets per unit time after every day, and update the rule
in filter table. Again optimal estimation is not a trivial job as it
depends on several factors.


On Mon, 27 Dec 2004 17:40:26 -0200, Bruno Wallace
<bruno.wallace@gmail.com> wrote:
> hello everybody,
> what rule is implemented to udp packet storm?
> --
> thanks,
> Bruno Wallace
>
>


--
cheers
Ashish


-- 
cheers
Ashish

