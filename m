From: Jason Opperisano <opie@817west.com>
Subject: Re: nat:REDIRECT on localhost not working in Kernel 2.6
Date: Fri, 19 Nov 2004 12:54:06 -0500
Message-ID: <20041119175406.GA20966@bender.817west.com>
References: <200411191836.07261.su@su2.info>
	<20041119174100.GA20905@bender.817west.com>
	<4f3930a704111909551b7e4d85@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4f3930a704111909551b7e4d85@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Nov 19, 2004 at 11:55:21AM -0600, Josh Nerius wrote:
> I'll second what Jason said here.
> 
> I've had the same issue in the past and resolved it by enabling option
> Jason mentioned.
> 
> This can also be found in menuconfig here:
> 
> Device Drivers >> Networking Support >> Networking Options >> Network
> packet filtering >> IP: Netfilter Configuration >> [   ] Nat of local
> connections.

i just booted up a SuSE 9.2 machine (kernel 2.6.8-24), and it does not
have IP_NF_NAT_LOCAL set in its config.

-j

--
"When will I learn? The answer to life's problems aren't at the bottom
 of a bottle, they're on TV!"
        --The Simpsons

