From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Redirect Packets From Interface in Promiscuous Mode
Date: Mon, 3 Oct 2005 13:56:28 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031350520.22605@filer.marasystems.com>
References: <BAY103-F251017FCAC7E12DA438E6C968C0@phx.gbl>
	<43402D47.3030004@chello.at>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43402D47.3030004@chello.at>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: Rodre Ghorashi-Zadeh <rodrico7@hotmail.com>, netfilter@lists.netfilter.org

On Sun, 2 Oct 2005, Mart Frauenlob wrote:

> All that is needed is an arp poisoning tool and a few iptables rules.
> If you install an arp poisoning program i.e. ettercap at your testing mysql 
> server, and use it to establish one way poisoning, traffic will go through 
> your testing system and will be transparentely redirected to your production 
> server. Now if you us the iptables MIRROR target (i think it's so called) on 
> your testing server to redirect the mysql queries to localhost, your testing 
> mysql db should receive exactly the same queries as the production one.

Nope, this won't work.

MySQL uses TCP for it's communication, and you can not fork a TCP 
connection like this at the packet level as TCP absolutely requires that 
both enpoints talk to each other and agree on a number of things. Thats 
partly why TCP has the two-way SYN handshake (SYN -> SYN+ACK -> ACK) where 
this is initialized. Having three endpoints on the same TCP connection is 
impossible.

What he needs to do is to somehow extract the MySQL queries from the 
connection to the production server and then send these in new TCP queries 
to the test server.

The problem is not iptables, but to get past the test servers TCP/IP stack 
and get the queries delivered to the MySQL server daemon.

Regards
Henrik

