From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 14:22:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201422.00324.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it> <200405201330.31625.Antony@Soft-Solutions.co.uk> <200405201454.50355.liste@zerozone.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201454.50355.liste@zerozone.it>
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

On Thursday 20 May 2004 1:54 pm, O-Zone wrote:

> On Thursday 20 May 2004 14:30, Antony Stone wrote:
>
> > It's the reply packets which are the problem.
> >
> > http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html
>
> i've read that manual but i't not so clear. It say to do a:
>
> # iptables -t nat -A POSTROUTING -d 192.168.1.1 -s 192.168.1.0/24 \
>         -p tcp --dport 80 -j SNAT --to 192.168.1.250
>
> but  can't understand what it say for 192.168.1.250. As in my config, i've
> write down that rule:
>
> $IPTABLES -t nat -A POSTROUTING -d 151.8.47.B -s 192.168.0.0/24 -p tcp -j
> SNAT - --to 192.168.0.1
>
> ...where 192.168.0.1 is the DMZ interface of ROUTER. It don't work. Where's
> the error ?

You need to make sure that the reply packets go back through the firewall, as 
well as the forward packets.   The easiest way to do this is by adding a SNAT 
rule so that as far as the destination server is concerned, the packets came 
from the firewall, not the real client, and therefore the server sends the 
replies back to the firewall (which then reverse-NATs them and returns the 
replies to the original client machine).

Therefore in your case something such as:

iptables -A POSTROUTING -t nat -s 192.168.0.0/24 -d 192.168.0.0/24 -j SNAT 
--to 192.168.0.1

should do the trick.

The above rule matches packets coming from an internal client (-s 
192.168.0.0/24) and going to an internal server (-d 192.168.0.0/24), and 
forces the source address to be that of the firewall (192.168.0.1) so the 
replies go back by the same route.

Regards,

Antony.

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.

                                                     Please reply to the list;
                                                           please don't CC me.


