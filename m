From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Monitoring NAT functionality
Date: Fri, 6 Sep 2002 13:51:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209061251.g86CpNv02106@vulcan.rissington.net>
References: <20020906100410.27681.qmail@web12902.mail.yahoo.com> <200209061048.g86Amnv01907@vulcan.rissington.net> <00ea01c2559f$9f03e9b0$5f0110ac@kovaiteam.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00ea01c2559f$9f03e9b0$5f0110ac@kovaiteam.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 06 September 2002 1:19 pm, Logu wrote:

> hi all
> Is there a tool that can be run in a machine where nat rules are put to see
> if the packets are properly nated.
> That is I want to see the packets(I mean only the source and destination)
> before and after nating.  I tried with tcpdump. Is there any other tool to
> simply monitor this with timestamp.

I find ethereal nicer to work with than tcpdump - plug that into both 
interfaces and see if it shows original & translated packets conveniently 
close together ?

Antony

-- 

If at first you don't succeed, destroy all the evidence that you tried.

