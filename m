From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Can't forward Win2k VPN through NAT
Date: Fri, 6 Sep 2002 19:39:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020906183946.DFYK1968.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

On Friday 06 September 2002 5:15 pm, Don Woodruff wrote:

> Is this really fair? While Windows uses pptp, I believe it is actually
> RFC 2637. PopTop is a perfectly workable pptp solution for Linux -- so
> pptp tunelling is not really a "Windows" issue. While I would prefer to
> use IPSEC where possible, the same issues with NAT still exist (in a
> similar config).

I agree that PPTP is an independent standard, and not a M$-developed
protocol, however I consider it to be by far an inferior way to set up a VPN
than IPsec, and therefore I disapprove of Win2k for having provided users
with PPTP and not IPsec.

Also, I believe that PPTP has significantly greater problems than IPsec with
NAT.   Basically IPsec in transport mode does not work through NAT at all,
but IPsec in tunnel mode works without any need for helpers etc.   As far as
I'm aware, there are limitations on the number of concurrent PPTP sessions
you can maintain through a single NAT device (because of the address
information embedded in PPTP, not because of anything to do with the device),
whereas there is no such limitation with IPsec in tunnel mode.

> As a business-owner, my new focus is "whatever provides the greatest
> profit margin coupled with the most satisfactory experience for the
> customer".

I'm afraid here again I'm going to use Microsoft as an example that these two
objectives can easily turn out to be mutually exclusive (or at least,
competing rivals).

Antony.

--

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

