From: Jean-Christophe Boggio <cat@thefreecat.org>
Subject: getting mad with dynamic routing / fwmark
Date: Thu, 16 Jan 2003 17:16:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <15029238171.20030116171628@thefreecat.org>
Reply-To: Jean-Christophe Boggio <cat@thefreecat.org>
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


Hello,

I want to use netfilter's MARKing system to dynamically route packets
on an interface or another based on port numbers.

One of my problem (the main one I think) is that a packet is not
'seen' by the firewall if there is no route to it. tcpdump can see it
but not the firewall. So if I try to MARK the packet in order to route
it based on the mark, it fails because :
no route=no firewall=no marking=no dynamic routing--+
^...................................................|

I must be missing something.

BTW, is there a decent tool to monitor what the FW does with a packet,
why it is dropped, how it is marked, etc. without doing everything
with -j LOG ?

Thanks for any help, it's been a week of tests and I'm really getting
mad with nothing working.

--
Jean-Christophe Boggio                       
cat@thefreecat.org                           -o)
Independant Consultant and Developer         /\\
Delphi, Linux, Perl, PostgreSQL, Debian     _\_V



