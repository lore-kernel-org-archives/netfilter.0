From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Rout looping through local host.
Date: Tue, 21 Aug 2007 16:21:06 -0500
Message-ID: <46CB5742.4080300@riverviewtech.net>
References: <46CB0F78.3060107@riverviewtech.net>	<cba9bb580708211026p721c0de8md6d66b3440d5b298@mail.gmail.com>	<46CB3835.80401@riverviewtech.net>
	<cba9bb580708211347u459897bcofce3a48a59e50a93@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cba9bb580708211347u459897bcofce3a48a59e50a93@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/21/07 15:47, michel banguerski wrote:
> Grant, You are 100% right about return path, it needs to be set up 
> and I hope the VRF will prove to be more adequate for your needs.

Michel, thank you for your help.  I will keep what you have pointed out 
in mind.  However for now I'm pursuing the VRF route as I think it will 
better handle my problem and scale better, especially considering I need 
to not NAT what is coming out of eth1 on its way to eth2.

I'll keep everyone apprised on what I find out.



Thanks again,

Grant. . . .

