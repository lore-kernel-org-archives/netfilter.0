From: Mogens Valentin <monz@danbbs.dk>
Subject: Re: TCP_CONNTRACK_ESTABLISHED 5days
Date: Tue, 03 May 2005 12:48:22 +0200
Message-ID: <427756F6.9000803@danbbs.dk>
References: <42762C02.8060300@danbbs.dk>
	<427634ED.1030204@danbbs.dk>	<427639CD.6080107@riverviewtech.net>
	<42764CF2.9060503@danbbs.dk>
	<1403218a0505030123f2e857c@mail.gmail.com>
Reply-To: monz@danbbs.dk
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a0505030123f2e857c@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>
Cc: Mohamed Eldesoky <eldesoky.lists@gmail.com>

Mohamed Eldesoky wrote:
> On 5/2/05, Mogens Valentin <monz@danbbs.dk> wrote:
> 
>>Taylor, Grant wrote:
>>
>>>>Moritz, thanks for pointing that out.
>>>>Your suggested 10 minutes seems a bit short, though..
>>>
>>>
>>>I would not set ip_conntrack_tcp_timeout_established to any thing lower
>>>than tcp_fin_timeout.  I would be tempted to set
>>>ip_conntrack_tcp_timeout_established to approximately double what
>>>tcp_fin_timeout is set to.  I don't know of any reason that conntrack
>>>would need to keep things for twice tcp_fin_timeout, but I'd rather be
>>>safe than sorry.  Besides even double of tcp_fin_timeout is CONSIDERABLY
>>>less than 5 days.
>>
>>Hmm, dunno if various distros set tcp_fin_timeout differently.
>>With 2.6.10, it's 60 secs (not a distro kernel, and I didn't set this).
>>Are you saying that Mouritz' 10mins will in some (distro?) cases violate
>>   ip_conntrack_tcp_timeout_established >= tcp_fin_timeout * 2 ?
>>
> 
> 
> In debian3.1 it is 5 days too !!!

Yes, it's kernel defined, distros doesn't set it any differently, AFAIK.

> The question now, what troubles would happen if we kep it/changed it !?!?!

None. When sessions timeout, so be it. When need be, a new session will 
be setup. Works fine for me now.

-- 
Kind regards,
Mogens Valentin


Horse dropping have an easy life,
they don't have to work and can smoke..
   -- Mogens Valentin


