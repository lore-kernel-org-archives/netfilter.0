From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: failover with iptables?
Date: Wed, 11 Sep 2002 14:54:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111354.g8BDsfv08676@vulcan.rissington.net>
References: <200209111410.14005.roy@karlsbakk.net> <200209111312.g8BDCuv08567@vulcan.rissington.net> <200209111544.46249.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209111544.46249.roy@karlsbakk.net>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Wednesday 11 September 2002 2:44 pm, Roy Sigurd Karlsbakk wrote:

> > Use vrrp for this.   The MAC address *is* important too.
>
> hm ...
>
> vrrp is a protocol - right?

Virtual Router Redundancy Protocol.

Connects two or more machines together and implements floating MAC and IP 
addresses, which are always attached to a working machine.   If one system 
dies, or loses network connectivity, the addresses automatically go to 
another machine so that other system don't know there's anything wrong.

> do you know where I can find a (good?) implementation for it for linux?

http://w3.arobas.net/~jetienne/vrrpd

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

