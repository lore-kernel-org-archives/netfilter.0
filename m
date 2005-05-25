From: Jason Opperisano <opie@817west.com>
Subject: Re: useing mangle to mark packets
Date: Wed, 25 May 2005 08:41:04 -0400
Message-ID: <20050525124104.GA16703@bender.817west.com>
References: <4294256F.2060007@konabi.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4294256F.2060007@konabi.de>
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

On Wed, May 25, 2005 at 09:12:47AM +0200, Sven Neukirchner wrote:
> iptables -t mangle -o $DEV -A POSTROUTING -p ICMP -j MARK --set-mark 1
> 
> Is there a way to check if the packets get marks?
> 
> I tryed following:
> 
> iptables  -A FORWARD   -p ICMP -m mark --mark 1 -j LOG --log-prefix 
> "mark " --log-level 6
> 
> But it doesnt work.

because mangle:POSTROUTING is traversed after filter:FORWARD.

> I want to set up traffice shaping using tc.
> So I need to mark packets so I can put them in order.

mark your packet in either mangle:PREROUTING or mangle:FORWARD.

-j

--
"Susan Sarandon: I'm Susan Sarandon. Most of you know me as Tim
 Robbins' mother, but actually I'm his wife!"
        --Family Guy

