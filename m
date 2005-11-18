From: Rob Carlson <rcarlson@kitchenandassociates.com>
Subject: Forward Ipset and Clear DNAT entry
Date: Fri, 18 Nov 2005 11:34:44 -0500
Message-ID: <437E02A4.40407@kitchenandassociates.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I have a 2 part question.  The first is how to do
something, the second is how do I clear up my
failed attempts to accomplish the first.

I would like to be able to forward an ipset tied
to certain ports to a different machine.  I know
how to create an IPSet and bind that set to
certain ports-- I would like to be able to forward
that  set to another machine instead of doing a
straight reject.  My aim in the testing is to have
a machine I can ssh to, from which I can mail,
and then later verify that the mail sent to my
firewall gets routed properly.

To this end I created a set and a corresponding
table-- dischash and DISCHASH

ipset -N disc nethash
ipset -A dischash xxx.xxx.xxx.xxx/xx
ipset -N discports portmap --from 1 --to 1024
ipset -A discports 25
ipset -B dischash :default: -b discports
   (Here I am not clear if I need the table, but
created it anyway)
iptables -N DISCHASH
   (With a straight LTREJECT I would create a
FORWARD and INPUT, but here, I'm not sure)
   (Then I did this:)
iptables -t nat  -A PREROUTING -m set --set
dischash dst -j DNAT --to-destination --to
yyy.yyy.yyy.yyy

Now, I can't ssh to the machine in the set, my ssh
(verified by a traceroute) fails to
yyy.yyy.yyy.yyy-- which is what I would expect if
I didn't have the ipset bound to port 25.  I tried
several iterations of this last command (verifying
my insanity) and now when I do:

iptables -L -t nat
I get entries at the end reading:
DNAT       all  --  anywhere             anywhere
            set dischash dst to:xxx.xxx.xxx.xxx

So,
Is there syntax to clear single DNAT entries
without flushing ALL prerouting?

And is there syntax which will allow me to reroute
traffic from a particular ipset going only to
bound ports (i.e. mail) to a second address?


Thanks very much for any help.

Rob Carlson




