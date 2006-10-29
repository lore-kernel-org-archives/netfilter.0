From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: How to block Chikka chatting
Date: Sun, 29 Oct 2006 11:23:34 +0100
Message-ID: <000b01c6fb44$4bc09ce0$0101000a@tanjian>
References: <009101c6fa16$23191a30$7700000a@comservwinxp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <009101c6fa16$23191a30$7700000a@comservwinxp>
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

> Hi,
>     Anyone can advice me how to block chikka chatting at firewall ?  
> thank in advance. 

What have you tried already?

This post seems to allow Chikka. If that works then it shouldn't be too
hard to rework the rule for iptables to block Chikka.
http://lists.freebsd.org/pipermail/freebsd-net/2003-October/001578.html

This list has a posting with hints about blocking Chikka servers:
http://www.freelists.org/archives/isalist/02-2006/

To be short: use a packet sniffer to see where a Chikka clients connects
to and block that.


Grts,
Rob


