From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT question
Date: Tue, 2 Mar 2004 00:22:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403020022.47603.Antony@Soft-Solutions.co.uk>
References: <1078185401.4043cdb979aab@milliweb.millicom.com.pe>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078185401.4043cdb979aab@milliweb.millicom.com.pe>
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

On Monday 01 March 2004 11:56 pm, Felipe wrote:

> It's necessary to set up phisically the public address used in SNAT rule ?
> For this rule:
>
> iptables -t nat -A POSTROUTING -s 172.21.0.0/16 -j SNAT --to 200.110.2.181
>
> For that rule, its necessay set up phisically the IP 200.110.2.181 over the
> interface ?

No, it is not necessary to set up that address on that interface in order to 
use that rule and send out packets with that source address.

However, if you send out packets with that source address, and you want to 
receive the replies, the address must exist on whatever machine the address 
will get routed to.

If you are only doing UDP transmits, and never expect a reply, it might work.

Regards,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


