From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 17:57:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C6DF0E.4020404@linuxmail.org>
References: <Pine.LNX.4.33.0406091112130.5934-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406091112130.5934-100000@blackhole.kfki.hu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: David Cannings <lists@edeca.net>, netfilter@lists.netfilter.org

Jozsef Kadlecsik wrote:
> On Wed, 9 Jun 2004, Feizhou wrote:
> 
> 
>>>Is there any good reason not to load connection tracking?
>>
>>SLOW. It isn't good enough to use on a high traffic server.
> 
> 
> Could you back your claims up with data?

What kind of data?

I can tell you what I observed.

I have two dnscaches running dnscache. Single PIII 800 cpus with 512MB 
of RAM.

One box had the command iptables -t nat -L -n run and that caused 
ipt_conntrack to be loaded.

Instantly queries to that box took over 200ms to return (cached entries) 
and sometimes timeouts even occured while the other box happily kept 
return times to under 20ms for cached entries.

These are with a RH 2.4.20-20 with XFS patches applied.

> 
> At testing connection tracking we could pump trough two million concurrent
> connection at 200000pps rate with opening up 20000 new connection per
> second on a dual Xeon PC with Serverworks chipset and Intel copper GE
> cards. Best results were achieved by Linux kernel 2.6.x with conntrack
> locking and TCP window tracking patches applied and NAPI enabled.
> I'd say that's not bad at all.


Which tcp window tracking patches? On my mail gateways, I had 2.6.4 with 
e100 driver and NAPI enabled and that proved to be a disaster. I had to 
turn NAPI off and also muck around:

net.ipv4.tcp_max_syn_backlog = 2048
net.ipv4.route.gc_thresh = 65536

to keep the box accessible. Otherwise, the kernel would spew dst cache 
overflow/BUGTRAP errors or oops or even garbage.

