From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: inner workings of IP tables
Date: Tue, 1 Oct 2002 13:51:50 +0800 (MYT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0210011349550.5900-100000@dodobirdy.nestac.com>
References: <Pine.LNX.4.40.0209291918280.19073-100000@klepto.security.algx.lan>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.40.0209291918280.19073-100000@klepto.security.algx.lan>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, 29 Sep 2002, Kevin Dwyer wrote:

> http://www.linux-ha.org
> http://w3.arobas.net/~jetienne/vrrpd/
> (and more, peep the linux-ha site for a huge list of resources)
>
> Netfilter doesn't have the code to pass the state table across
> machines (and would be a neat feature) but you can make a firewall
> pair by either using VRRPd or Linux-HA.  You'll drop active
> connections, but CP did too up until recently I think.

I _think_ PIX still has the option for either failover. With state and
without state depending on what you're willing to lose and how much $$$
you're willing to shell out :)

(snip rest)


