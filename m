From: dan radom <netfilter@radom.org>
Subject: Re: irc
Date: Mon, 17 Nov 2003 08:41:24 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031117154124.GD10857@hamachi.radom.org>
References: <OF9DF42386.B8AE0536-ON85256DE1.00551398-85256DE1.00552F5A@kal.kalsec.com>
Reply-To: netfilter@radom.org
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <OF9DF42386.B8AE0536-ON85256DE1.00551398-85256DE1.00552F5A@kal.kalsec.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

* trainier@kalsec.com (trainier@kalsec.com) wrote:
> Aye, a familiar face. ;-)
> 
> The 'firewall' in this case, is a transparent proxy server.  The proxy 
> server will be the gateway to the internet.
> I need to allow irc connections through this machine, somehow.  I don't 
> know how to do that.
> 
> Regards,
> 
> Tim Rainier
> 

You can always just allow established and related packets back in.  This
should make almost any connection initiated from the LAN or iptables
machine work.

iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

