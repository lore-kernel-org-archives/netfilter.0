From: Oscar Picasso <oscgoogle@yahoo.com>
Subject: Iptables and remote control on Windows clients
Date: Tue, 22 Oct 2002 07:43:09 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021022144309.15253.qmail@web40514.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have setup a very simple Linux gateway/firewall for
a small internal network. Basically it drops all
icoming packets that are not initiated by inside hosts
but allow the inside hosts to connect everywhere on
the Internet. The machines inside the network have
static IP addresses. Here are the gateway iptables:

*nat
:PREROUTING ACCEPT [480:72880]
:POSTROUTING ACCEPT [166:13136]
:OUTPUT ACCEPT [281:19788]
-A POSTROUTING -o eth0 -j MASQUERADE 
COMMIT

*filter
:INPUT ACCEPT [2784:1101414]
:FORWARD ACCEPT [426:90594]
:OUTPUT ACCEPT [2931:345727]
-A INPUT -s 192.168.1.2 
-A INPUT -i eth0 -p tcp -m tcp --tcp-flags SYN,RST,ACK
SYN -j DROP 
-A FORWARD -s 192.168.1.2 
-A FORWARD -d 192.168.1.2 
COMMIT

Comments:
192.169.1.2 is actually the only host inside the
network.
eth0 is the interface that connects to the Internet.

It works fine except that i cannot use it with NetOp
Remote Control client on Windows 2000 on my inside
network. 

When I connect the Windows client directly on the
Internet it just work fine. When i use it behind the
gateway/firewall, I can make the first connection to
the remote NetOp server but I cannot go beyond that:
the computers inside the remote network are note
visible with NetOp. (The remote computers are also
inside a private network).

By the way, it seems it's not a problem specific to
NetOp because even without NetOp I can ping to the
remote computers when i connect the Windows directly
to the Internet but not when i am behind the firewall.

Anu idea ? 

Thanks.

Oscar





__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

