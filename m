From: "Manikandan.P" <linuxmani@myrealbox.com>
Subject: (no subject)
Date: Fri, 8 Nov 2002 20:22:27 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021108145227.GA20828@myrealbox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi all,

 In my n/w iam using iptables firewall in my gateway and now the problem
is iam able to use that machine as a default gateway for all the
windows machines in my network but i cannot even ping the
gateway/firewall from linux machine.
 the strange thing is if i ping a client linux machine from the firewall
it pings and from then onwards i can ping/use the gateway to browse the
net even from a linux machine.
 every time if i want to use that g/w from a linux  machine i had to
ping the client machine from the firewall to enable it.
 iam using iptables 1.2.5/Redhat Linux 7.3
 

 can any body help me out to resolve this strange problem

Manikandan P.
 
-- 
 # get Subject header, but remove initial "Subject: " portion
 sed '/^Subject: */!d; s///;q'

