From: Gregory Carter <gcarter@aesgi.com>
Subject: Re: persistent packet marking for use in VPN creation.
Date: Fri, 11 May 2007 10:18:43 -0500
Message-ID: <46448953.50807@aesgi.com>
References: <464461C4.7090602@clue.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <464461C4.7090602@clue.co.za>
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

Could you explain why the destination would be interested in your VPN's 
packet markings?

I mean, windows doesn't have any software I am aware of that would be 
interested in your markings under Linux, so what is the point in this 
persistance you require?

What are you trying to accomplish through persistance?

-gc

Sven Agnew wrote:

> Hi all,
>
> I am trying to set up a windows Road warrior VPN connection to a 
> Gentoo Linux server running Linux Openswan U2.4.7/K2.6.18-gentoo-r6 
> (netkey).
>
> I know that an option to persist encrypted packet marks across 
> de-capsulation used to exist and that this feature has now gone away ( 
> or so I am told ).
>
> Could anyone tell me if there is a way to cause encrypted packets to 
> be marked and then, after de-capsulation, have the mark persist onto 
> the de-capsulated packet?
> If this is not possible, could anyone suggest another way to produce 
> the results of getting a Windows VPN connection to a Linux server 
> using Openswan?
>
> Any suggestions would be welcome.
>
> Thanks for your time,
> Sven
>


