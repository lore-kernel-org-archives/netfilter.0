From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: CISCO VPN clients behind firewall
Date: Wed, 5 May 2004 01:53:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405050153.18201.Antony@Soft-Solutions.co.uk>
References: <00f101c43236$e54f0380$0300a8c0@indoakses2>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f101c43236$e54f0380$0300a8c0@indoakses2>
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

On Wednesday 05 May 2004 1:21 am, bino_oetomo wrote:

> Hi All
>
> Is there any clue/docs on hoe to let multiple clients behind firewall =
> connecting to CISCO vpn concentrator ?

As far as I know, Cisco VPNs use IPsec - no problem there for netfilter 
(although maybe problems if you're using transport mode and doing nat).

If you're not using IPsec, then what protocol/s are you talking about here?

If you don't know what the problem with netfilter is, add some LOGging rules 
to your FORWARD chain so you can see what's trying to get through (and 
failing).

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


