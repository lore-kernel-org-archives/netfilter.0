From: "=?GB2312?Q?=D6=DC=C6=BD?=" <zping@founderbn.com>
Subject: Re:Multiple client VPN - where to put conntrack?
Date: Wed, 10 Nov 2004 9:1:38 +0800
Message-ID: <20041110013146.98301482BC@mail.founderbn.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

Hi there,

This may be a very stupid question, but I haven't found the information 
anywhere, so here goes - I have a working VPN client-server set-up that 
works through an iptables masquerading NAT configuration but only for 
one client at a time - and I need to expand it. The VPN is:
- Server - running PPTP (poptop) on Redhat 9 connected directly to the 
internet via iptables.
- Client(s) - A small network of workstations (Debian, win2k, mac OSX) 
connected to the internet with ADSL via a Debian router running iptables

doing NAT. Currently, tunnels are created from the workstations to the 
server through the router and internet successfully, but only one 
machine can connect at a time and I would like to improve on this.

I understand that I need to install PPTP and GRE connection tracking on 
the Debian router...(and here's the silly question...) will the RH9 PPTP

server need conntrack too?

One further question, the ADSL connection at the client end uses PPPoA 
with LLC - would it be possible for this to stuff up the connection 
tracking or unlikely? And what about PPPoE? Or is it all just completely

dependent on the ISP?

Thanks,

James


I should update your ppp server 



