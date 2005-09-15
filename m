From: Gabriel <jarod125@yahoo.com>
Subject: weird iptables behaviour
Date: Thu, 15 Sep 2005 14:46:51 -0700 (PDT)
Message-ID: <20050915214651.76113.qmail@web60914.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

I'm connecting to an openvpn box from a remote location. I
can access the box I'm connecting to (I'm getting ping
replies), but nothing that's beyond it (the box serves as a
gateway for other clients). I'm using openvpn's --dev tap0
because i need to pass non-ip packets through the tunnel.
On the openvpn box, FORWARD policy is DROP, so I did
"iptables -I FORWARD -i tap0 -j ACCEPT" and thought this
should do the trick. But I was wrong. The only solutions I
found were either set FORWARD policy to ACCEPT (not happy
with that) or insert an iptables rule in the FORWARD chain
that gives access based on the MAC address. I'm probably
going to use the latter, but I can't really understand why
"iptables -I FORWARD -i tap0 -j ACCEPT" won't work. Isn't
this supposed to let ALL packets (not just ip packets) pass
through? I'm thinking that it has something to do with the
fact that i'm using --dev tap0 (tap0 is bridged with eth1 -
the LAN facing interface - and they form br0) which is
layer2 but, as I said before, -i tap0 -j ACCEPT should work
as well...

Thanks

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

