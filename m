From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: Unexpected RSTs?
Date: Fri, 11 Oct 2002 16:29:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210111629.26991.mklingens@ism.nl>
References: <200210111434.52124.mklingens@ism.nl> <200210111303.g9BD3mL19306@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210111303.g9BD3mL19306@vulcan.rissington.net>
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

On Friday 11 October 2002 15:03, Antony Stone wrote:
> Depending on what else you're logging, 15% of your log entries could be a
> lot of packets, could be only a few....

It's thousands of them ;-)

(And the timeframe was only a day or so...)

> I'd expect the reason might be a system sending two RST packets (I believe
> this is quite common, but I haven't done any specific network sniffing to
> check it out).   The first one takes down the connection so it is no longer
> ESTABLISHED, the second one gets logged because it doesn't correspond to an
> established connection...

Hmm, besides the obvious questions *why* the second RST is sent and why 
conntrack doesn't have provisions for ignoring subsequent RSTs for a short 
amount of time the reasoning itself makes sense.

> Maybe you could try putting a LOG rule to catch *all* RSTs at the beginning
> of your rules (before even the ESTABLISHED, RELATED rule) and see if this
> shows they are coming along in pairs ?

Good idea. I'm not going to modify the firewall so close before the weekend, 
but will do so next monday. Thanks for the tip and I'll let you know about 
the results!
-- 
Martijn


