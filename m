From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: iptables acting as a TCP proxy
Date: Mon, 15 Mar 2004 12:43:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151243.31703.gdh@acentral.co.uk>
References: <1079349033.10231.14.camel@gdh.walshsimmons.co.uk> <200403151128.20474.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403151128.20474.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

On Monday 15 March 2004 11:28, Antony Stone wrote:

> iptables -A PREROUTING -p tcp --dport 80 -d old.ip.add.ress -j DNAT --to
> new.ip.add.ress
> iptables -A FORWARD -p tcp --dport 80 -d new.ip.add.ress -j ACCEPT
> iptables -A POSTROUTING -p tcp --dport 80 -d new.ip.add.ress -j SNAT --to
> my.ip.add.ress

A thousand thanks, Antony - you're a giraffe among men - so walk tall :)

Yep this works a treat, and you're quite right the fact that requests will all 
come from the firewall doesn't matter :)

Cheers,
Gavin.

