From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables acting as a TCP proxy
Date: Mon, 15 Mar 2004 12:59:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403151259.38056.Antony@Soft-Solutions.co.uk>
References: <1079349033.10231.14.camel@gdh.walshsimmons.co.uk> <200403151128.20474.Antony@Soft-Solutions.co.uk> <200403151243.31703.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403151243.31703.gdh@acentral.co.uk>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Monday 15 March 2004 12:43 pm, Gavin Hamill wrote:

> On Monday 15 March 2004 11:28, Antony Stone wrote:
> > iptables -A PREROUTING -p tcp --dport 80 -d old.ip.add.ress -j DNAT --to
> > new.ip.add.ress
> > iptables -A FORWARD -p tcp --dport 80 -d new.ip.add.ress -j ACCEPT
> > iptables -A POSTROUTING -p tcp --dport 80 -d new.ip.add.ress -j SNAT --to
> > my.ip.add.ress
>
> A thousand thanks, Antony - you're a giraffe among men - so walk tall :)

Er, thanks.   Never been called that before, but I'll do my best :)

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


