From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: problem reach the internal.
Date: Sat, 30 Nov 2002 12:44:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE8A48D.5040405@fugmann.dhs.org>
References: <20021130010348.58897.qmail@web14507.mail.yahoo.com> <3DE815EA.9040303@fugmann.dhs.org> <200211292120.41544.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@newkirk.us
Cc: "james.Q.L" <shijialeeee@yahoo.ca>, netfilter@lists.netfilter.org

Joel Newkirk wrote:
> On Friday 29 November 2002 08:35 pm, Anders Fugmann wrote:
>>It cannot be done, as the webserver will try to give an answer to the
>>query directly, and not back through your router, and thus the client
>>will not accept the reply.
>>
>>For a more complete explanation, search the email archives. This
>>question has been asked and answered numerous times.
> 
> 
> That's what his SNAT rule should handle: (snippet from original message)
Thanks for the correction. I see that it can be done, allthough I guess 
that some serious network degradation will result, especially on a half 
duplex network.

Regards
Anders Fugmann


