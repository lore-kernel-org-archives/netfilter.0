From: sandra hernandez <sandra@fib.upc.es>
Subject: problem with VPN and iptables redirect
Date: Wed, 16 Jun 2004 10:10:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087373437.1085.1.camel@akasha.fib.upc.es>
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

Hi there!

I've been doing some research on using VPN (kernel 2.6.x) with iptables
and I'm having trouble with both of them:
Having two PCs, one Windows XP and another with linux, IPsec seems to
work fine on both and all comunications between them are encrypted.

The problem is when I execute this command with iptables in linux box:
  iptables -t nat -I PREROUTING 1 -d x.x.x.x -j REDIRECT --to-port 80
   (and all the policies are to ALLOW)
The redirection fails...
If I deactivate VPN, the redirection works ok.

What problem could be between VPN and iptables redirections?
Any suggestions would be very appreciated.

Sandra


