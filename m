From: "Matt Parlane" <matt@zevi.net>
Subject: Forwarding packets within local network
Date: Tue, 24 Sep 2002 14:03:18 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0d3d01c2636e$8d112a60$0200a8c0@bart>
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

Hi all...

I am trying to set up iptables to forward all packets on port 80 to an
internal machine - the only difference to the normal DNAT setup is that the
web server is on another internal machine.  Let me explain...

The gateway is at 192.168.0.1.

The webserver is at 192.168.0.2, and is DNATed, so it can be seen from the
outside, and the inside - as per the chapter entitled 'Destination NAT Onto
the Same Network' in the unreliable guides.

I go to www.google.com from my workstation which is 192.168.0.3, and I am
forwarded by iptables through to the internal webserver, and it serves my
request.  One caveat is that I want to be able to specify which IP addresses
are allowed straight out as per normal, and which ones are forwarded to the
internal webserver.

Is this possible?  And if it's not possible using iptables, does anyone know
any other way of doing this?

Regards,

Matt Parlane
Zevi Interactive
matt@zevi.net


