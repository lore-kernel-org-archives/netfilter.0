From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this firewall good enough?
Date: Wed, 9 Jun 2004 10:48:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406091048.04303.Antony@Soft-Solutions.co.uk>
References: <20040608091436.84113.qmail@web14712.mail.yahoo.com> <200406081623.15400.Antony@Soft-Solutions.co.uk> <40C61D59.1090505@linuxmail.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C61D59.1090505@linuxmail.org>
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

On Tuesday 08 June 2004 9:11 pm, Feizhou wrote:

> > That rule allows packets *to* port 80 - I was asking how you deal with
> > *reply* packets - the ones *from* port 80 on the remote server.
>
> iptables -A tcp_packets -p --sport 80 --dport 1024:65535 -j ACCEPT

That is not my idea of a secure firewall rule - you are allowing an external 
scanner  / attacker to access the machine on any TCP port from 1024 to 65535, 
simply by setting their source port to 80.

Sheesh - we might as well go back to stateless routers with access control 
lists.

> Stateful is expensive. If you have a high traffic load, it is not worth
> it. The context is when the box is a server. If you are protecting your
> home box, by all means, use stateful.

Hm - strange, then, that Checkpoint, Cyberguard, Netscreen, Gauntlet etc. all 
seem to say that Stateful is better / more secure

However, you are quite correct - you have the choice of using stateful 
connection tracking or not using it, as you prefer.

My choice is to have the security of having my ports closed by using stateful 
filtering.   I don't have a fast enough Internet connection for performance 
to be a problem, and I don't know many people who do.

Regards,

Antony.

-- 
Most people have more than the average number of legs.

                                                     Please reply to the list;
                                                           please don't CC me.


