From: Jason Opperisano <opie@817west.com>
Subject: Re: protocol 50 unreachable
Date: Thu, 2 Dec 2004 15:56:45 -0500
Message-ID: <20041202205645.GA6266@bender.817west.com>
References: <20041202201102.GA5915@bender.817west.com>
	<Pine.LNX.4.44.0412021120210.25230-100000@gollum.grajagan.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0412021120210.25230-100000@gollum.grajagan.net>
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

On Thu, Dec 02, 2004 at 11:26:22AM -0800, Helge Weissig wrote:
> I mean with "incomplete" that the tcpdump traffic I see does not show up 
> in the logs. I used your rules at the end of your reply and see the same 
> thing: ESP from VPN_SERVER hits $EXTIF, triggers the "protocol 50 
> unreachable" icmp response and no log entry ever shows up in the kernel 
> log from the iptables log rule. I am suspecting that your option 3) is 
> indeed the problem.
> 
> h.

what kernel are you running on this firewall [*]?  the only plausible
explanation at this point (and i'm not even sure that this is possible)
is that you're running an IPsec-enabled kernel that has SPD entries in
it that is scarfing up the ESP packets prior to the PREROUTING netfilter
hooks.  i'm not sure that the last part is even possible though, as i
was under the impression that ESP packets fully travel through PREROUTING
and INPUT before they get processed by the kernel IPsec code...

[*] if the answer is 2.6, the output of "setkey -aPD" should be:
    No SPD entries.

-j

--
"I hope I didn't brain my damage."
        --The Simpsons

