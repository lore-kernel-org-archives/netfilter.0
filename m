From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: 2 NICs on same subnet
Date: Fri, 05 Nov 2004 08:47:14 -0600
Message-ID: <418B9272.8040706@pbl.ca>
References: <20041105123843.GB11016@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041105123843.GB11016@zion.homelinux.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Sven Schuster wrote:
> Hi everybody,
> 
> I have a problem which I'm quite sure can be resolved easily, but
> at the moment I'm lacking the "how" :-)
> I have a machine (RH ES 3) with two Intel e1000 cards attached to
> a gigabit switch, each interface is assigned an IP address on the
> same subnet (say 1.2.3.4 on eth0 and 1.2.3.5 on eth1).
> What's happening is that if a connection to either of these addresses
> is made, it's always received via the same interface (eth1 most of the
> time), and the replies go out via this interface, too. But what I'd
> like is that packets to 1.2.3.4 come in via eth0 and packets to 1.2.3.5
> come in via eth1 and that replies from 1.2.3.4 leave via eth0, from
> 1.2.3.5 via eth1.
> I've already tried to resolve this issue with arptables, doing

Probably not easilly solvable.  The thing is that both interfaces are 
valid for sending responses out.  So the kernel will probably use the 
first where it gets the match (not sure about exact algorithm, so it may 
as well be the last, or random).

Anyhow, said that, there are couple of things to try out.

For incomming packets, I do remember that there's kernel option to 
instruct Linux kernel to send ARP responses from matching interface, 
instead of interface ARP request was made on (ARP request is broadcast, 
so both interfaces will get it, and by default Linux doesn't send from 
"matching" interface).  This way, client will get correct MAC address, 
and switch will send packets down the correct wire.  Might help, but on 
the other hand it might not.

For outgoing packets, mark packets in INPUT chain of mangle table with 
different marks depending if source is 1.2.3.4 or 1.2.3.5.  Than you can 
use fwmark with Linux Advanced Routing (see examples in howto, 
http://www.lartc.org/lartc.txt, chapter 11) to route packets to eth0 or 
eth1 depending on the fwmark.  Should work (tm).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

