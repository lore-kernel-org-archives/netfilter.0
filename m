From: Jason Opperisano <opie@817west.com>
Subject: Re: ever block *outgoing* packets on your firewall?
Date: Fri, 14 Jan 2005 15:14:04 -0500
Message-ID: <20050114201404.GA27341@bender.817west.com>
References: <20050114200228.GA21562@spawar.navy.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050114200228.GA21562@spawar.navy.mil>
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

On Fri, Jan 14, 2005 at 12:02:28PM -0800, seberino@spawar.navy.mil wrote:
> 
> I'm wondering if it is ever necessary to block
> *outgoing* packets at your firewall.
> 
> As long as you block /incoming/ carefully no hacker
> on the Internet can send spam through a node on
> your network or anything nasty like that right?
> 
> (I'm wondering for a wifi hotspot if any nastiness
> will happen if I don't block outgoing.  I block
> virtually all incoming except ssh.)

i run a default DROP policy on the OUTPUT chain of my firewalls and only
allow out necessary traffic (DNS, HTTP/FTP to update servers, NTP, etc).
but i'm pretty odd when it comes to these things--i don't know how
necessary it is.  the one nice side-effect is that is keeps me from
doing something stupid when i'm ssh-ed into a firewall.

-j

