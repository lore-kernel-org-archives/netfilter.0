From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: ICMP packets
Date: Tue, 20 Sep 2005 10:18:42 -0500
Message-ID: <200509201018.47739.rob0@gmx.co.uk>
References: <BAY102-F140CB05B42680BA717BE36AE950@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F140CB05B42680BA717BE36AE950@phx.gbl>
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
To: netfilter@lists.netfilter.org

On Tuesday 20 September 2005 09:10, P theodorou wrote:
> now regarding icmp packets . Is it
> applicable to drop inbound echo requests (so otherts cannot see me )

This is a policy question, not, strictly speaking, an iptables / 
netfilter issue. Personally I don't see much point in hiding. It's a 
knee-jerk insecurity reaction of people who don't understand what makes 
(or breaks) security.

You will of course avoid some ping sweeps if you do that, and some of 
those ping sweeps may in fact be preludes to lame attack attempts.

> but i will be able to send icmo echo request to WEB and receive
> replies too .

Yes, if your rules permit. Typically you use a rule like "-m state 
--state RELATED,ESTABLISHED -j ACCEPT" to allow your replies back in. 
Whether that goes in INPUT or FORWARD depends on the network layout. 
(Generally goes in both.)

Um, "Web" is a term which refers to HTTP. HTTP is a high-level protocol 
which runs over TCP. ICMP has nothing to do with HTTP, except that both 
happen to use TCP/IP.

> Sorry if it looks very basic but im confused

I think what you need most is basic TCP/IP understanding. Where to 
start, to find that? I'm not sure. Rusty wrote a basic networking 
HOWTO, the specific name of which I can't recall, but it's among the 
netfilter.org HOWTOs.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

