From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NATting again
Date: Fri, 16 Jul 2004 17:03:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407161703.42973.Antony@Soft-Solutions.co.uk>
References: <f51b72bc04071608505bc1da93@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <f51b72bc04071608505bc1da93@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 16 July 2004 4:50 pm, Payal Rathod wrote:

> Hi,
> A simple quesiton. I want to nat few ports from my Linux server to
> windows machine.
> I have a seperate IP for it. I want to allow users to connect to port
> 21, 80, 8443 of the windows machine from outside world as well as LAN
> users ( the windows box will be in DMZ). Do I write a seperate command
> for each port?

Yes.

> I am unable to use multiple ports at a time. Can
> someone give an example?

iptables -A PREROUTING -t nat -d a.b.c.d -p tcp --dport 21 -j DNAT --to 
w.x.y.z
iptables -A FORWARD -d w.x.y.z -p tcp --dport 21 -j ACCEPT

a.b.c.d is the public address you want people to connect to (this address must 
be attached to the external interface of the box running netfilter)
w.x.y.z is the "real" internal address of the Windows machine on your DMZ.

> Also, does RELATED & ESTABLISHED rules in
> FORWARD and INPUT chains cover this too?

No, just the FORWARD chain.

Regards,

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


