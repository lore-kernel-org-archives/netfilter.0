From: Andreas Jellinghaus <aj@dungeon.inka.de>
Subject: netfilter and kernel 2.5.* ipsec
Date: 14 May 2003 18:35:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052930126.918.21.camel@simulacron>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

using setkey I can create rules based on
 - src ip, dst ip, src port, dest port, proto

using netfilter I can create rules on (but not limited to)
 - src ip, dst ip, src port, dest port, proto, state,
   incoming interface, outgoing interface, ...

so netfilter is a lot better. but netfilter cannot set
requirements for ipsec?

Is there any guide how to combine these two?

I could allow more or less anything with iptables
(only filter bogus packets etc.), and restrict access
to certain ports in the SPD database.

But isn't there a nicer way to do that?
I have real trouble with the combination of
SPD and dynamic ip: 
  my machine has a dynamic ip, and of course I want
  restrict access to most ports, unless an ipsec
  connection is used. using spdadd I need to specify
  my IP as target, so that is quite ugly. e.g.

spdadd 0.0.0.0/0 192.168.0.10[25] -P in deny;

I would need to change that rule everytime my ip changes,
so I don't like doing that.

Also good security is always about shutting everything down
and then making small holes where necessary. I don't want
to have a big fat hole in my iptables config, but I don't see
how else I can allow access to certain ports, but restrict
the access to ipsec connections.

With kernel 2.4.* the ipsec0 interface was used in rules
to match whether a packet is coming in via ipsec or not.
Is there a similiar way to do the same thing?

Regards, 

Andreas


