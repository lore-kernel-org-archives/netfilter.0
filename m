From: "Sebastian" <netfilter@basti79.de>
Subject: (OT) Tunnel
Date: Mon, 25 Aug 2003 17:46:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c36b20$038c7cd0$0200a8c0@basti79>
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
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi list...

This question is little off tpoic, but i would be glad if someone came
up with a solution for me. I'm lookting for a tunnel software for
Linux-Server and Windows-Client. The following things i've tried:
- SSH Tunnels. This wont be sufficient beause i want use NetMeeting over
the tunnel. I think this wont work because i can't tunnel the dynamic
ports with SSH.
- PPTP. This would be fine for my needs but here comes the next problem.
The Windows-Client is locatet behind a Router (i've got no control over
this one) which does NOT permit GRE traffic.

So, what i'm lookting for is a tunnel which
- works with Windows Clients
- provides full TCP/IP connectivity (unlike simple SSH tunnels)
- dosen't use GRE (unlike PPTP and afaik IPsec)

Thanks for answers
Sebastian.


