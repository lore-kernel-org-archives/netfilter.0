From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT Problem
Date: Thu, 22 Apr 2004 12:07:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404221207.12965.Antony@Soft-Solutions.co.uk>
References: <1611.80.0.0.23.1082351242.squirrel@80.0.0.175> <1061.80.0.0.23.1082435491.squirrel@80.0.0.175> <1481.80.0.0.23.1082630400.squirrel@80.0.0.175>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1481.80.0.0.23.1082630400.squirrel@80.0.0.175>
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

On Thursday 22 April 2004 11:40 am, test@seaconindia.com wrote:

> >> iptables -t nat -A POSTROUTING -j MASQUERADE
> >> or
> >> iptables -t nat -A POSTROUTING -j SNAT --to 192.168.0.254
>
> Yes I do have "iptables -t nat -A POSTROUTING -j MASQUERADE"
> And as suggested by you I have modified the above rule with
> respective nic. But no luck.
>
> Can you please advice me on what rule set to use on my firewall. I
> want users from outside to come in for POP & SMTP. But I want
> their request to be forwarded with their real ips and not firewall ip.

I think you need to change your generic MASQUERADE or SNAT rule so that it 
specifies only packets leaving the external interface - not the internal 
interface.

For example:

iptables -A POSTROUTING -t nat -o $extIF -j SNAT --to a.b.c.d

Where a.b.c.d is the external IP of $extIF

Regards,

Antony.

-- 
What makes you think I know what I'm talking about?
I just have more O'Reilly books than most people.

                                                     Please reply to the list;
                                                           please don't CC me.


