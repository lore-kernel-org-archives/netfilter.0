From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 15:45:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201545.32872.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it> <200405201422.00324.Antony@Soft-Solutions.co.uk> <200405201637.54395.liste@zerozone.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201637.54395.liste@zerozone.it>
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

On Thursday 20 May 2004 3:37 pm, O-Zone wrote:

> On Thursday 20 May 2004 15:22, Antony Stone wrote:
> > You need to make sure that the reply packets go back through the
> > firewall, as well as the forward packets.   The easiest way to do this is
> > by adding a SNAT rule so that as far as the destination server is
> > concerned, the packets came from the firewall, not the real client, and
> > therefore the server sends the replies back to the firewall (which then
> > reverse-NATs them and returns the replies to the original client
> > machine).
> >
> > Therefore in your case something such as:
> >
> > iptables -A POSTROUTING -t nat -s 192.168.0.0/24 -d 192.168.0.0/24 -j
> > SNAT --to 192.168.0.1
>
> But, i think, i need to add other rules because the original connection
> came from 192.168.0.x to 151.8.47.x, right ?

Yes, but that destination address has already been changed by your PREROUTING 
rule, and is now 192.168.0.0/24 - that's the whole point.   If the 
destination address had not been changed (ie: if the client had contacted the 
server's real IP address instead of a pretend one), you wouldn't need to 
change the source address as well.

If you think you need other rules, please explain what they would be and why 
they are needed - it's entirely possible I have missed something about your 
setup.

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


