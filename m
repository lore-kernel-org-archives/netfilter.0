From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Having NAT problems
Date: Thu, 1 Apr 2004 20:39:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404012039.48071.Antony@Soft-Solutions.co.uk>
References: <20040401192505.3100.69461.Mailman@vishnu.netfilter.org> <20040401192728.M69316@niesc.k12.in.us>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401192728.M69316@niesc.k12.in.us>
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

On Thursday 01 April 2004 8:30 pm, Adam Kennedy wrote:

> This is driving me up a wall.
> I have a NAT entry such as thus:
>
> iptables -t nat -A PREROUTING -d 1.2.3.4 \
>         -p tcp --dport 5631 -j DNAT --to 192.168.1.1

What other nat rules do you have?

> The thing doesn't work. If I run a telnet session from the NAT box to the
> internal machines port of 5631, it responds. But, when doing that from the
> outside world, it doesn't. And yes the outside IP is bound to the NAT box,
> as eth0:2 actually.

Good :)   Someone was bound to ask about that :)

> Any ideas?

Show us the rest of your ruleset (if it's complicated, please try reducing it 
to the simplest possible which you think should work but still shows the 
problem).   The output from
iptables -L -nvx; iptables -L -t nat -nvx
would be good.

Regards,

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


