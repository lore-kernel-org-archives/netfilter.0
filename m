From: Joshua Jackson <iptables@vortech.net>
Subject: Re: PPTP Nat Module
Date: Wed, 10 Dec 2003 13:17:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312101317.46696.iptables@vortech.net>
References: <200312092139.12609.iptables@vortech.net> <3FD691D3.9060708@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD691D3.9060708@snapgear.com>
Content-Disposition: inline
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
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

On Tuesday 09 December 2003 22:24, Philip Craig wrote:
> Joshua Jackson wrote:
> > My iptables firewall rules include a default policy of DROP for INPUT and
> > FORWARD, ACCEPT for OUTPUT. The first line in the rules includes an
> > ACCEPT for the INPUT chain for established and related connection. There
> > is also a rule allowing any traffic for all protocols to any host which
> > originates from the protected network on the internal interface.
>
> Do you an ACCEPT for the FORWARD chain for established and related
> connections?

Yes, it also accepts established and related connections.


