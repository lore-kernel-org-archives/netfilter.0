From: Sam Pointer <sam.pointer@hpdsoftware.com>
Subject: can't initialize iptables table `'
Date: Tue, 26 Nov 2002 17:20:18 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6FB083FB72EFD21181D30004AC4CA18A01EABFA8@srv002>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Before I carry, please feel free to tell me FAQ off; I have quickly scanned
the archive and google and haven't found a solution to this problem - but
I'm open to suggestions.

I'm initialising iptables on RH Linux 8. When I start iptables I am getting
the error message " can't initialize iptables table `' ". 

Now, I issued `lsmod` and I have both "iptable_filter" and "ip_tables"
modules loaded.

I initially tried starting ipchains with a whole raft of rules, but even
starting with the single rule:

-P INPUT DROP

causes this error to appear.

When I reboot the machine and check my syslog messages, I notice that
iptables-restore is issuing a modprobe for module `iptable_`, as in:

iptables: Applying iptables firewall rules
modprobe: modprobe: Can't locate module iptable_
modprobe: modprobe: Can't locate module iptable_
...
iptables: can't initialize iptables table `' (do you need to insmod?)

which leads me to believe that some table module it requires isn't loaded.
Is this correct, and if so how is this. I'm only using the default "filter"
table (which is loaded) with my single policy rule...

Any help or pointers to solutions would be greatly appreciated.


This email and any attachments are strictly confidential and are intended
solely for the addressee. If you are not the intended recipient you must
not disclose, forward, copy or take any action in reliance on this message
or its attachments. If you have received this email in error please notify
the sender as soon as possible and delete it from your computer systems.
Any views or opinions presented are solely those of the author and do not
necessarily reflect those of HPD Software Limited or its affiliates.

 At present the integrity of email across the internet cannot be guaranteed
and messages sent via this medium are potentially at risk.  All liability
is excluded to the extent permitted by law for any claims arising as a re-
sult of the use of this medium to transmit information by or to 
HPD Software Limited or its affiliates.



