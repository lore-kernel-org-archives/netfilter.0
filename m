From: dhiraj.2.bhuyan@bt.com
Subject: RE: new tcp connections, without SYN
Date: Wed, 9 Apr 2003 17:04:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E09268777@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
Content-Transfer-Encoding: 7bit
To: mklingens@ism.nl, netfilter@lists.netfilter.org

I tried sending an "ACK" packet from behind my Netfilter firewall to a
machine on the public side that actually doesn't exist.

A look in the /proc/net/ip_conntrack tells me that Netfilter tracked this
connection as "ESTABLISHED" but "UNREPLIED". So Netfilter does infact allow
starting a TCP connection with an ACK packet.

dhiraj


-----Original Message-----
From: Martijn Klingens [mailto:mklingens@ism.nl]
Sent: 09 April 2003 14:59
To: netfilter@lists.netfilter.org
Subject: Re: new tcp connections, without SYN


On Wednesday 09 April 2003 15:06, Cedric Blancher wrote:
> Timers for Netfilter's conntrack should be the same as TCP stacks. So,
> if conntrack times out, then destination TCP stack should time out too.
> that means if a ACK gets so delayed that related conntrack entry gets
> dropped, than it would be also dropped by destination TCP stack.

Aaah... that might explain my problem with 'new, not syn'.

Problem is that our firewall is a non-masquerading router for a class C
subnet 
and that we don't have the ability to set the timeouts on all machines
behind 
it.

Isn't there a workaround to avoid this problem on the netfilter machine?

-- 
Martijn



