From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: Stateful filtering for IPv6?
Date: Sun, 07 Nov 2004 20:58:09 -0800
Message-ID: <04DAB2BC29B83CEEE2E931F4@[10.0.0.4]>
References: <20041108014229.GA9070@tintin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041108014229.GA9070@tintin>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

--On Monday, November 08, 2004 2:42 AM +0100 Nicolas Boullis 
<nboullis@debian.org> wrote:

> I thought this question would be a FAQ, but I could not find it answered
> on http://www.netfilter.org/documentation/FAQ/netfilter-faq.html.
> Currently, only stateless filtering is available for IPv6. Hence, I'd
> like to know what the status of stateful filtering for IPv6 is. Is it
> some work in progress? Is it supposed to be a very complex task? Is it
> thought to be impossible for some reason?
>
> I'd love to switch to IPv6, but a good firewall would be a requirement,
> and I'm very happy with netfilter for IPv4.

I was just looking into this the other day. Actually, I was investigating 
why the IPv6 REJECT target is considered "unstable" by Red Hat and found 
sort of an answer in the same place, but this section should answer your 
question:

<http://www.netfilter.org/documentation/conferences/nf-workshop-2004-summary.html#AEN482>



