From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Microsoft VPN
Date: Wed, 30 Jun 2004 18:42:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406301842.32108.Antony@Soft-Solutions.co.uk>
References: <76408279273F86419EA113F4CC5BB13D026C5E@EXCHANGE.InsideNCS.local>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <76408279273F86419EA113F4CC5BB13D026C5E@EXCHANGE.InsideNCS.local>
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

On Wednesday 30 June 2004 6:27 pm, Narti Kitiyakara wrote:

> We're having trouble accessing our Microsoft VPN server through an iptables
> firewall.  The first person to connect gets in fine, but we can't make
> concurrent VPN connections.

Sounds like you don't have the PPTP NAT Conntrack helper loaded.

Check patch-o-matic for details.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


