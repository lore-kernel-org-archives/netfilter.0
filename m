From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: VPN issue
Date: Mon, 29 Mar 2004 14:52:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403291452.18713.Antony@Soft-Solutions.co.uk>
References: <JFEPKPDIGFAKJOGHOICDAECBCAAA.mani@manikandan.org>
Reply-To: "Netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <JFEPKPDIGFAKJOGHOICDAECBCAAA.mani@manikandan.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Monday 29 March 2004 2:39 pm, Manikandan wrote:

> Dear all,
>
> A Linux server is acting as gateway/firewall to route traffic from my LAN
> to Internet using one public IP.
> The issue is, I am able to make only one connection to the VPN server

What sort of VPN server?   What VPN protocol are you using?   IPsec?   PPTP?   
Something else?

> through my firewall. The second connection fails with an error 721.

What does this error message mean (it doesn't come from netfilter)?

> I mapped another unused public IP to one of my local LAN system. I am able
> to make one more connection to the server as the public IP is different. So
> NATing seems to be the problem.

Sounds like you're probably using PPTP then (but please confirm anyway).   Do 
you have the PPTP-nat/conntrack helpers loaded?

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


