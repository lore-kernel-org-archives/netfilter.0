From: "Ian McBeth" <imcbeth@telus.net>
Subject: forwarding based on hostname
Date: Sun, 3 Aug 2003 14:09:40 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c359fb$2c7c68c0$8c01a8c0@blackice3>
References: <FDEMKKNJDLAJDPNDPCDDKEDINFAA.georgev@citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDEMKKNJDLAJDPNDPCDDKEDINFAA.georgev@citadelcomputer.com.au>
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

Hello

I have an issue where I have forwarded the ports to an internal mail
server.  Based off ip it works but when you get the hostname in there it
seems to get lost.  No error is given just hangs and outlook says the
connection was interrupted.

Using cat /proc/net/ip_conntrack it does not even appear to be
connecting.

Any help would be great as I am kind of new at iptables NAT
configurations.

Thanx

Ian McBeth

p.s. I have not really looked to deeply into this but can you forward
based off hostnames to your internal network?

e.g.
mail.domainname.net --> NAT --> 192.168.0.x



