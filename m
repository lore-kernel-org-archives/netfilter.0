From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCRELAY through IPTABLES Firewall
Date: Tue, 29 Oct 2002 10:29:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210291030.g9TAU5e09742@vulcan.rissington.net>
References: <001001c27d72$1352c350$8f33e40f@lsmith5953> <000b01c27f1d$f805e430$8f33e40f@lsmith5953> <001701c27f32$4c7a21c0$8f33e40f@lsmith5953>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c27f32$4c7a21c0$8f33e40f@lsmith5953>
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

On Tuesday 29 October 2002 10:02 am, bigman@monster-solutions.net wrote:

> and I have also looked into this further by putting a sniffer on my DHCP
> server. I see the request come in from the system that is getting an IP
> successfully, but I never see a request from the system that is failing.
> Both systems are on the same subnet so they should be using the same
> netfilter rules.

Would I be right in guessing that the system which works already has a DHCP 
address, and is either renewing it (before its lease runs out) or is 
requesting the same address again (after the lease has run out), whereas the 
system which fails has never had a DHCP address and is trying to get one for 
the first time ?

Antony.

-- 

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

