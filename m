From: Alexander Piavka <piavka@cs.bgu.ac.il>
Subject: Re: is NOTRACK modules the only way to avoid connection tracking?
 (fwd)
Date: Wed, 9 Feb 2005 08:47:41 +0200 (IST)
Message-ID: <Pine.GSO.4.33.0502090846230.22322-100000@indigo>
Mime-Version: 1.0
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
To: Samuel Jean <sj-netfilter@cookinglinux.org>
Cc: netfilter@lists.netfilter.org

On Mon, 7 Feb 2005, Samuel Jean wrote:

> On Mon, February 7, 2005 7:00 am, Alexander Piavka said:
> >
> >  Hello, i have a question about connection tracking.
>
> Hi
>
> >
> > if i have at least one iptables rule with -m state ,no matter in which
> > chain,then the conntrack module gets loaded in all iptables hooks and
> > thus all packets will be connection tracked, even if i need to track
> > only a small subset of packets. This means that the only way to avoid
> > connection tracking for most of packes is to use the NOTRACK module in raw
> > table to match them. Is my understanding correct?
>
> Yes. This is right. Keep in mind that conntrack is a hook in the packet
> traversal just like any other hooks (PREROUTING, INPUT, FORWARD, ...)
>
> Usually, that's the first hook ever. But, with the raw table, there's a new
> hook registered before conntrack. That's why you can tell :
>
> That packet which is not going to TCP X and host X, just don't track it
> (NOTRACK).
>
> > Or i can avoid connection tracking without the use of NOTRACK modules?
>
> Without NOTRACK, that's a no conntrack for all or conntrack for all
> condition. There's no beside.

 ok, thanks that's that i thought, it just the author of article "Securing
Linux System with Host Based Firewalls" from Sun blueprints writes:

Stateful packet filtering uses a certain amount of memory per active
connection. To limit the memory impact, we use stateful packet filtering
only where necessary. This strategy limits the impact during a flooding or
DOS attack. For simple inbound services like HTTP and secure shell (SSH),
we do not need to use stateful packet filtering. The FTP protocol is a
different matter, because passive mode FTP does not use a fixed port
number for the data connection...
 and there is a code like:
for port in ${TCP_IN}; do
 case "${port}" in
 ftp) $NEW INPUT -p tcp --dport ${port} --syn -m state --state NEW -j
ACCEPT
    ;;
 *)  $NEW INPUT -p tcp --dport ${port} -j ACCEPT
    $NEW OUTPUT -p tcp '!' --syn --sport ${port} -j ACCEPT
    ;;
 esac
done
 and not a word about NOTRACK or raw table. That got me confused, i guess
the author got it wrong or am i missing something?

 Thanks



