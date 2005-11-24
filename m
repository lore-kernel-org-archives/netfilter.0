From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Forward Ipset and Clear DNAT entry
Date: Thu, 24 Nov 2005 11:47:12 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511241130310.20155@blackhole.kfki.hu>
References: <437E02A4.40407@kitchenandassociates.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <437E02A4.40407@kitchenandassociates.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Carlson <rcarlson@kitchenandassociates.com>
Cc: netfilter@lists.netfilter.org

Hi Rob,

On Fri, 18 Nov 2005, Rob Carlson wrote:

> I would like to be able to forward an ipset tied
> to certain ports to a different machine.  I know
> how to create an IPSet and bind that set to
> certain ports-- I would like to be able to forward
> that  set to another machine instead of doing a
> straight reject.  My aim in the testing is to have
> a machine I can ssh to, from which I can mail,
> and then later verify that the mail sent to my
> firewall gets routed properly.

I'm not completely sure I understand what you want to achieve, but
anyway...

> To this end I created a set and a corresponding
> table-- dischash and DISCHASH
>
> ipset -N disc nethash
> ipset -A dischash xxx.xxx.xxx.xxx/xx
> ipset -N discports portmap --from 1 --to 1024
> ipset -A discports 25
> ipset -B dischash :default: -b discports
>    (Here I am not clear if I need the table, but
> created it anyway)
> iptables -N DISCHASH
>    (With a straight LTREJECT I would create a
> FORWARD and INPUT, but here, I'm not sure)
>    (Then I did this:)

You mean the DISCHASH chain? As you don't use it, the chain is
unnecessary.

> iptables -t nat  -A PREROUTING -m set --set
> dischash dst -j DNAT --to-destination --to
> yyy.yyy.yyy.yyy
>
> Now, I can't ssh to the machine in the set, my ssh
> (verified by a traceroute) fails to
> yyy.yyy.yyy.yyy-- which is what I would expect if
> I didn't have the ipset bound to port 25.

The ipset is bound to the port, but you did not instruct the set matching
to follow the bindings up to the level you want. You should have typed

iptables -t nat  -A PREROUTING -m set --set \
  dischash dst,dst -j DNAT --to-destination --to yyy.yyy.yyy.yyy
           ^^^^^^^
i.e instruct the set matching to follow one level of bindings and at that
level apply destination matching. Without this, the set matching checked
the dischash set alone and the NAT rule was applied according to the
result.

> I tried several iterations of this last command (verifying my insanity)
> and now when I do:
>
> iptables -L -t nat
> I get entries at the end reading:
> DNAT       all  --  anywhere             anywhere
>             set dischash dst to:xxx.xxx.xxx.xxx
>
> So,
> Is there syntax to clear single DNAT entries
> without flushing ALL prerouting?

You can delete any rule anytime. However, you cannot change the
NAT-related parameters of the living connections known by conntrack. They
must die out (or you can kill the corresponding conntrack entry by the new
'conntrack' tool.)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

