From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: failover with iptables?
Date: Wed, 11 Sep 2002 14:12:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111312.g8BDCuv08567@vulcan.rissington.net>
References: <200209111410.14005.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209111410.14005.roy@karlsbakk.net>
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

On Wednesday 11 September 2002 1:10 pm, Roy Sigurd Karlsbakk wrote:

> hi
>
> I currently have two identical servers I want to use in parallel with an
> iptables gate in front of them, so if one chrashes, iptables just sorts out
> and redirects to the other.
>
> If iptab_1 fails, iptab_2 should take over ip and (perhaps) mac address of
> iptab_1.

Use vrrp for this.   The MAC address *is* important too.

> ps: I don't think I need connection tracking.

In that case you can do what you want.

In fact, even if you did need connection tracking, you could still do it 
provided you don't also need NAT.

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

