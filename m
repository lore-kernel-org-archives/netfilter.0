From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: track bandwith used
Date: Wed, 30 Jun 2004 13:51:41 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <138c01c45ec2$8467d480$49caa8c0@caris.priv>
References: <00e501c45ea3$28e2d110$49caa8c0@caris.priv> <200406301441.22500.Antony@Soft-Solutions.co.uk> <12a101c45eab$99055aa0$49caa8c0@caris.priv> <200406301717.52224.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

You could make a connection out to a remote server.  That remote server
might try to make a connection back to us that has nothing to do with the
reason we connectd to them.  But the server may see it as related and allow
it.


----- Original Message ----- 
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Wednesday, June 30, 2004 1:17 PM
Subject: Re: track bandwith used


On Wednesday 30 June 2004 3:07 pm, Peter Marshall wrote:

> ya, that was great.  I guess there was one thing that you said that
worried
> me ... you said almost all packets will match the ESTABLISHED,RELATED
check
> on the forwared chain ... would that not be a bad thing ... is it
dangerous
> to have RELATED as an option on the FORWARD CHAIN. ???

No, in fact it is essential for many purposes.

1. The FTP data channel will be matched as RELATED to the initial control
channel, so RELATED in FORWARD is needed if you are going to allow FTP.

2. ICMP error responses (usually seen in reply to UDP packets which fail for
some reason) match as RELATED, and (as is already being discussed on another
thread on this list), it is not a good idea to stop all ICMP packets from
getting through your firewall.

There are other examples of why RELATED packets are necessary, but these are
the most common and obvious ones.

You will generally find that all tutorials and netfilter examples match
ESTABLISHED and RELATED in the FORWARD chain.

What makes you think that RELATED is dangerous?

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from
a
poem by Virgil entitled "Moretum", which is about cheese and garlic salad
dressing.

                                                     Please reply to the
list;
                                                           please don't CC
me.



