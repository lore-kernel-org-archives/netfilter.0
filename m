From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: firewall rules for subinterfaces
Date: Fri, 15 Oct 2004 15:06:59 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e504101505062bc7c26c@mail.gmail.com>
References: <20041015035535.GA19170@clifford.headnut.org>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041015035535.GA19170@clifford.headnut.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

The -i is for interfaces only, not ip aliases. Try

iptables -A INPUT -p icmp -i eth0 -d 192.168.1.1 -j DENY
iptables -A INPUT -p icmp -i eth0 -d 192.168.2.1 -j ACCEPT

And, I don't thing there is such a thing called DENY unless You -N it.

On Thu, 14 Oct 2004 23:55:35 -0400, Chris Verges <squirrel@headnut.org> wrote:
> Hey,
> 
> Is there a way to add firewall rules for subinterfaces?  I'm
> trying to do the equivalent of:
> 
>   eth0   Intel Pro 10/100
>     eth0:0   192.168.1.1
>     eth0:1   192.168.2.1
> 
>   iptables -A INPUT -p icmp -i eth0:0 -j DENY
>   iptables -A INPUT -p icmp -i eth0:1 -j ACCEPT
> 
> When I try to do this at the command line, iptables spits back
> an error about how colons (:) are not allowed in the interface
> name.  That brings up the interesting question of how to do this
> whole thing ...
> 
> Any advice or insight is greatly appreciated!
> 
> Thanks,
> 
> chris
> --
> http://headnut.org
> squirrel@headnut.org
> 
> 


-- 
Bla bla

