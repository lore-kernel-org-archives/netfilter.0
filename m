From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: DMZ Setup Question
Date: Wed, 30 Nov 2005 13:51:11 -0600
Message-ID: <200511301351.11306.rob0@gmx.co.uk>
References: <FAC4E024BF776842876169173CE2F01313B204@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01313B204@mailbox.vikus.com>
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

On Wednesday 2005-November-30 12:32, Derick Anderson wrote:
> My inclination would be to use NAT (MASQUERADE) for your internal
> hosts just because it makes things simpler (not necessarily more
> secure) and your DMZ doesn't need routes to your internal network.
> Some may say then that simpler is more secure and I agree, but I
> still say that NAT is a routing tool and not a security tool.

The only potential security issue is one that SHOULD have already been 
addressed by disabling packet forwarding on the DMZ machines, and that 
is that an upstream attacker might route packets to your LAN machines 
using [a] DMZ machine[s] as gateway.

Otherwise I agree with you and Derick. I prefer routing when it's a 
possibility.

Even without the LAN routes the DMZ machines should not allow packet 
forwarding.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

