From: Yuwen Dai <yuwend@gmail.com>
Subject: Re: internal host can not access hotmail
Date: Wed, 23 Feb 2005 22:17:37 +0800
Message-ID: <f7e5481105022306175a6b09dc@mail.gmail.com>
References: <f7e5481105022104583d0d3b19@mail.gmail.com>
	<421A9F1F.5080906@zhmail.com>
Reply-To: Yuwen Dai <yuwend@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <421A9F1F.5080906@zhmail.com>
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
To: Wenzhuo Zhang <wenzhuo@zhmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 22 Feb 2005 10:55:27 +0800, Wenzhuo Zhang <wenzhuo@zhmail.com> wrote:
> Yuwen Dai wrote:
> > Any advice to diagnose this problem?  I once thought maybe something
> > wrong with the FORWARD rules, and tried to log the blocked
> > packages. But there's no log info.
> 
> Probably you're encoutering the Path MTU Discovery problem. There are
> serveral solutions to this problem.
> 
> 1. Lower the MTU of the network interface of your internal host.
> 
> 2. Use the clamp-mss-to-pmtu feature of iptables:
>     # iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS \
>          --clamp-mss-to-pmtu

Thank you.  I used this rule to solved the problem.



> 
> 3. Use the clamp MSS feature of rp-pppoe (e.g. -m 1412).
> 

Now ppp uses a rp-pppoe.so plugin in peers/dsl-provider:
plugin rp-pppoe.so eth0

instead of
pty "/usr/sbin/pppoe -I eth0 -T 80 -m 1452"

So I don't know if I can use an option.

Best regards,
Dai Yuwen

