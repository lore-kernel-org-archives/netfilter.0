From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: "-o" specifier in DNAT definition?
Date: Sat, 19 Apr 2003 07:54:25 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304190750340.26698-100000@dell>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables mailing list <netfilter@lists.netfilter.org>


  in a book i'm reading discussing (among other things),
setting up DNAT, there is a sample rule:

  # iptables -t nat -A PREROUTING -i eth0 -o eth1
	-d <internal server IP address>
	-j DNAT --to-destination 192.168.0.1

the question: how can the explicit specification of the
"-o" interface affect this?
  
  after all, it's quite possible that the interface that
would normally be chosen to forward to the internal
server would not be the one listed with "-o".  (perhaps
the admin made a mistake.)

  if there is an obvious conflict here, what happens?
does this DNAT just go unsatisfied?

rday


