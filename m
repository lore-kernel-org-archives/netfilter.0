From: a.ledvinka@promon.cz
Subject: Re: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 18:07:13 +0100
Message-ID: <OF74BCB516.8410C7F4-ONC1256F43.005D4240-C1256F43.005E0B73@promon.cz>
References: <418B9272.8040706@pbl.ca>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <418B9272.8040706@pbl.ca>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

netfilter-bounces@lists.netfilter.org wrote on 05.11.2004 15:47:14:

> Probably not easilly solvable.  The thing is that both interfaces are 
> valid for sending responses out.  So the kernel will probably use the 
> first where it gets the match (not sure about exact algorithm, so it may 

> as well be the last, or random).

check the iproute2 package (program called "ip") and look at the grammar 
in "ip route help" output. there is way to assign "source" ip per route. 
so if you use the system for backups (initiated by the host in question) 
then it should work if you can't use binding.

btw is not this thread a little offtopic on this list then? ;-)

example:
here is what i used some time ago for nat box to set it's ip traffic the 
only allowed source address on firewall short after booting.
ip route change default via 212.96.166.17 dev eth1 src 212.96.166.18
you just substitute the "default" which is alias for 0.0.0.0 and also 
"eth1" for wahtever you want.

you possibly need 2.2+ kernel (which is true with iptables) and not sure 
if advanced routing enabled in kernel (i guess not because this is 
somewhat trivial function)

