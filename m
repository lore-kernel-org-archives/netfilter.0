From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Thu, 2 Dec 2004 12:12:25 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412021211390.25230-100000@gollum.grajagan.net>
References: <20041202205645.GA6266@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041202205645.GA6266@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

My kernel is 2.4.18-24.8.0 - h.

On Thu, 2 Dec 2004 at 15:56 -0500, netfilter-bounces@lists.netfilter.org wrote:

JO> On Thu, Dec 02, 2004 at 11:26:22AM -0800, Helge Weissig wrote:
JO> > I mean with "incomplete" that the tcpdump traffic I see does not show up 
JO> > in the logs. I used your rules at the end of your reply and see the same 
JO> > thing: ESP from VPN_SERVER hits $EXTIF, triggers the "protocol 50 
JO> > unreachable" icmp response and no log entry ever shows up in the kernel 
JO> > log from the iptables log rule. I am suspecting that your option 3) is 
JO> > indeed the problem.
JO> > 
JO> > h.
JO> 
JO> what kernel are you running on this firewall [*]?  the only plausible
JO> explanation at this point (and i'm not even sure that this is possible)
JO> is that you're running an IPsec-enabled kernel that has SPD entries in
JO> it that is scarfing up the ESP packets prior to the PREROUTING netfilter
JO> hooks.  i'm not sure that the last part is even possible though, as i
JO> was under the impression that ESP packets fully travel through PREROUTING
JO> and INPUT before they get processed by the kernel IPsec code...
JO> 
JO> [*] if the answer is 2.6, the output of "setkey -aPD" should be:
JO>     No SPD entries.
JO> 
JO> -j
JO> 
JO> --
JO> "I hope I didn't brain my damage."
JO>         --The Simpsons
JO> 


