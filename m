From: Dave Cinege <dcinege-mlists-dated-1113190958.71d069@psychosis.com>
Subject: Re: Captive DNS REDIRECT problems. Need a stateless/fast timeout udp
	connection.
Date: Tue, 5 Apr 2005 23:42:35 -0400
Message-ID: <200504052342.35703.dcinege-mlists@psychosis.com>
References: <200504030138.03902.dcinege-mlists@psychosis.com>
	<200504031740.57517.dcinege-mlists@psychosis.com>
	<200504051927.39797.Alistair@nerdnet.ca>
Reply-To: dcinege-mlists@psychosis.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504051927.39797.Alistair@nerdnet.ca>
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
Content-Type: text/plain; charset="us-ascii"
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

On Tuesday 05 April 2005 19:27, you wrote:

>  Build a rule that sets the initial connection up as NOTRACK?

Docs say:
-------------------------------
Please keep in mind:
if you mark a packet with NOTRACK, then

- all the conntrack functionalities are lost for the packet
  (ICMP error tracking, protocol helpers, etc)
- all the NAT functionalities are also lost.
-------------------------------

Doesn't that mean this won't work for me, as once I touch the packet with that
the REDIRECT rule won't work?

I don't have the raw table in my current kernel to test this....


