From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall problem continued
Date: Tue, 10 Aug 2004 19:45:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408101945.46837.Antony@Soft-Solutions.co.uk>
References: <20040809081216.GA12643@tranquility.scriptkitchen.com> <200408101014.22969.Antony@Soft-Solutions.co.uk> <20040810114645.GA27182@tranquility.scriptkitchen.com>
Reply-To: Netfilter ML <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040810114645.GA27182@tranquility.scriptkitchen.com>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Tuesday 10 August 2004 12:46 pm, Payal Rathod wrote:

> On Tue, Aug 10, 2004 at 10:14:22AM +0100, Antony Stone wrote:
> > > No idea. I thought that is recommended. I mean every machine should
> > > be able to access itself using all its IPs.
> >
> > That would mean "all IPs on all interfaces of the machine".   It doesn't
> > include arbitrary IPs which some other machine may choose to translate to
> > an IP on this machine's interface.
>
> Let me rephrase it. A mail server needs to connect to any IP in the world
> so why cannot it connect to an IP which is in its subnet.

Because the public IP is not in its own subnet.

Your mail server's real address is 10.10.10.2, with a /8 netmask.

Its public IP (as far as the firewall is concerned) is 1.2.3.4.

Those are different subnets.

Regards,

Antony.

-- 
Never automate fully anything that does not have a manual override capability. 
Never design anything that cannot work under degraded conditions in emergency.

                                                     Please reply to the list;
                                                           please don't CC me.


