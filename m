From: "Riho Randla" <riho@hot.ee>
Subject: iptables and suddenly refused connections for vpn
Date: Mon, 14 Oct 2002 13:15:31 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01b601c2736a$a13c0cb0$c300a8c0@VAIO>
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

Can enybody suggest how I could track down a problem with sometimes refused
connections? Couple of times a week nobody can make a vpn connection to our
poptop vpn server. In /var/log/messages I get the following error:

pptpd[4374]: GRE: read(fd=5,buffer=8055a20,len=8260) from network failed:
status = -1 error = Connection refused

When I restart my firewall everithing gets ok for a while again. How to find
out what's going on with the pptpd or iptables (or maybe with the kernel)?
And how to understand the components of the message from pptpd? I guess the
problem is not in pptp, as restarting the firewall rules solves the issue.



