From: "Younger Wang" <younger.wang@42networks.com>
Subject: RE: Is it possible to forward broadcasting with IPtables?
Date: Wed, 7 Apr 2004 23:19:11 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c41cb3$b3a03040$1664640a@Younger>
References: <200404071214.40138.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404071214.40138.Antony@Soft-Solutions.co.uk>
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

I tried DNAT in PREROUTING. 

Take an example: 
The broadcasting is send from 10.0.0.22/24 to 10.0.0.255/24. I want the
router( 10.0.0.1, 192.168.0.1 ) to forward it as from 10.0.0.22/24 to
192.168.0.255/24. 

I added:
Iptables -t nat -A PREROUTING -p udp -d 10.0.0.255 --dport 137 -j DNAT
--to-destination 192.168.0.255

The result is: 10.0.0.22-->10.0.0.255 was changed to
10.0.0.22-->192.168.0.255 in PREROUTING. Later on, in routing decision,
it's still put to the INPUT chain because the router also listens to
192.168.0.255. That's the reason why DNAT in PREROUTING does not work
and why I want to transfer the packet from INPUT chain to forward chain.


BR
Younger Wang

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Antony Stone
Sent: Wednesday, April 07, 2004 7:15 PM
To: netfilter@lists.netfilter.org
Subject: Re: Is it possible to forward broadcasting with IPtables?

On Wednesday 07 April 2004 12:07 pm, Younger Wang wrote:

> If the broadcast packets traverse the chains, they should be put to
> INPUT chain. Is there a way to transfer a packet from INPUT chain to
> FORWARD chain?

DNAT in PREROUTING?

In theory this would do what you want, however I'm sure it won't work.

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to
lead all 
customers out of a mire of technological chaos neatly ignores the fact
that 
it was he who, by peddling second-rate technology, led them into it in
the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the
list;
                                                           please don't
CC me.



