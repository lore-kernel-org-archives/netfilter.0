From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Re: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 12:21:10 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040715192110.11412.qmail@web40702.mail.yahoo.com>
References: <200407151943.09315.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407151943.09315.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> I would allow the firewall to send ICMP messages
> through its OUTPUT chain, and 
> if it can generate any connections from itself, then
> you should allow them in 
> through the INPUT chain as well, however you say you
> do not allow outgoing 
> connections (not even DNS??), so this may not be
> needed.

The fedora box doesn't do dns or anything. It's sole
purpose is a packet forwarding router that doesnt'
allow any input or output, just forwards.  Currently
it only forwards SSH packets. I may add other
forwarding later but the idea is the same still, no
direct incoming/outgoing connections to it, just
forwards.

That is why I'm not sure if I need ICMP supported on
it or not, and not sure where do add the ICMP support
(input, output, forward).


		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 

