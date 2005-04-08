From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: Iptables vs. Cisco PIX
Date: Fri, 8 Apr 2005 13:28:34 -0400
Message-ID: <561dc326050408102860ab8b4b@mail.gmail.com>
References: <038201c53c4c$6e94e540$0200a8c0@ale>
Reply-To: Jiann-Ming Su <sujiannming@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <038201c53c4c$6e94e540$0200a8c0@ale>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

On Apr 8, 2005 11:05 AM, Alejandro Cabrera Obed <sisdis@tournet.com.ar> wrote:
> Hi people !!!
> 
> This time I want to know your opinion about iptables vs. Cisco PIX....where
> would you use each of them ????
> Is it the same using iptables or PIX in big corporations with heavy Internet
> traffic ???? Which is considered the "best" and why ???
> 
> I use iptables since a long time, but my network is under 50 workstations.
> 
> Thanks for your comments, they're welcome.
>
 
From personal experience, iptables shrugs off syn flood attacks better
than anything out there.  You can't beat it for the price.  A
colleague tested a PIX 550(?) and his Nokia running Checkpoint.  We've
tested Checkpoint running on Quad Xeon Dell PowerEdge 6650.  A DDoS
attack from a irc bot will render them useless.  Checkpoint is just
bad architecture.  Even though you explicitly tell Checkpoint to drop
certain packets, Checkpoint will still add those dropped packets to
its connection table.  You can try reducing the timeout, but we
haven't found it to be terribly useful.  He also found that
SmartDefense just chokes HTTP traffic.  The only Checkpoint product to
do better was SecurePlatform using Corrent's Turbocards.  While the
connection table doesn't fill up on the PIX, the CPU still gets
overloaded, so you can't make new legitimate connections easily.  I
don't know how the more industrial versions of PIX will do, though.

We have a quad PIII Dell PowerEdge 6450 running iptables protecting
the residence halls on a college campus.  It gets syn flooded
constantly, handles 90k peak connections, load average of 1.0, all on
1GB of RAM.  The only short coming of iptables is the lack distributed
management and lack of a high availability solution.  Distributed
management is only a problem if you're managing more than several
firewalls.  And, lack of HA makes it harder to deploy iptables fully
on the enterprise.
-- 
Jiann-Ming Su
"I have to decide between two equally frightening options. 
 If I wanted to do that, I'd vote." --Duckman

