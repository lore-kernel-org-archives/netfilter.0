From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 19:43:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407151943.09315.Antony@Soft-Solutions.co.uk>
References: <20040715170323.24191.qmail@web40707.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040715170323.24191.qmail@web40707.mail.yahoo.com>
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

On Thursday 15 July 2004 6:03 pm, Real Cucumber wrote:

> I'm trying to determine the best practice for allowing
> the required ICMP messages to ensure stable
> networking, while at the same time not allowing pings
> or other unnecessary parts.

Personally, I simply use the ICMP types which are matched by "-m state --state 
RELATED".   They seem to do enough for me.

> Also do I need to allow those in all 3 chains or just
> the forward since it does not allow direct connections
> to it anyhow?

I would allow the firewall to send ICMP messages through its OUTPUT chain, and 
if it can generate any connections from itself, then you should allow them in 
through the INPUT chain as well, however you say you do not allow outgoing 
connections (not even DNS??), so this may not be needed.

Regards,

Antony.

-- 
"The future is already here.   It's just not evenly distributed yet."

 - William Gibson

                                                     Please reply to the list;
                                                           please don't CC me.


