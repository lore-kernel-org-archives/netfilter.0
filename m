From: Andrew Dewick <dewick_andrew@yahoo.com>
Subject: -j QUEUE "only if not full"
Date: Thu, 2 Dec 2004 07:16:11 -0800 (PST)
Message-ID: <20041202151611.84057.qmail@web42110.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I'd like to be able to have a user-space process
(snort) examine, and possibly modify, traffic
passing through a network appliance. So far so good,
user-space queueing is built for this.

But,

when traffic rates are high (hundreds of Mb/s in my
application) and the user-space processing is too
slow to handle that volume of traffic, I'd like to
be able to allow the user-space process to handle
as much traffic as it is able to handle (saturating
one CPU) and have the rest of the traffic pass
through the
appliance unimpeded. I can see a couple of ways of
tackling this:

- Run the user-space process as two threads, one of
which feeds packets to the other for processing when
possible, but performs
ipq_set_verdict(...NF_ACCEPT...) on every packet
that
comes in while the other is busy processing. This is
complex, requires incurring the kernel-userspace
transition for every packet and potentially
incurring
userspace inter-CPU synchronisation for every
packet.

- Use iptables' nth, fuzzy or random modules to
control what fraction of the traffic is presented to
the userspace queue. From the "process as much
traffic
as possible, but no more" standpoint, this is
terribly
inefficient as it would require setting the
threshhold
rather low to avoid impeding un-processed traffic.
It
would require manually tweaking any time the CPU
requirements for the userspace processing changes.
Additionally, this fraction would be applied even
when
traffic levels weren't so high.

- Something of a non-option is to move snort into
kernelspace (ugh), but this looks like more work,
moves a mountain of code into the kernel that
doesn't
need to be there, and still leaves the problem of
only
presenting packets that snort has time to process.

- What I'd really like is to have a matching option
for iptables that determines whether or not space
remains in the userspace QUEUE:

# iptables -A FORWARD -m uqs --queue-has-space -j
QUEUE

but as far as I can tell, no module with comparable
functionality exists.

So, questions:

- Does such a module exist that I've overlooked?

- Is there some other way to achieve this?



		
__________________________________ 
Do you Yahoo!? 
Take Yahoo! Mail with you! Get it on your mobile phone. 
http://mobile.yahoo.com/maildemo 

