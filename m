From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: A simple question
Date: Mon, 5 Apr 2004 23:40:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404052340.23077.Antony@Soft-Solutions.co.uk>
References: <4072150B.8060400@tin.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4072150B.8060400@tin.it>
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

On Tuesday 06 April 2004 3:25 am, Gianni Pucciani wrote:

> Hi all,
> I'm new to the use of iptable. I set this script for my home
> workstation, but when I apply these rules anything stop functioning.
> I guess I'm doing something stupid but this is my very first time with
> iptables, so sorry.

The major problem with your ruleset is that you have no rules in either your 
INPUT or OUTPUT chains to allow reply packets.

My recommendation is to start simple, and add things bit by bit.   Then if 
something goes wrong, you only need to look at the (simple) thing you added 
most recently.

For a home workstation, try the following ruleset (which will allow more 
traffic than you say you want, but is still secure from the outside world).

You can add more specific rules to allow only the correct traffic, and to 
allow limited connections from the outside, as you want to.

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -j ACCEPT

Regards,

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


