From: "Vernon A. Fort" <vfort@provident-solutions.com>
Subject: Access to Internal server via public address
Date: 10 Dec 2003 13:33:17 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071084797.6081.35.camel@cosby>
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

Anyone,

  The Problem:  I have an alias public address DNAT'ed to and internal
address - normal and working

  What i need is to access this server using the PUBLIC address from an
internal workstation.  What I have:

	INTNIC = eth1
	EXTNIC = eth0

	INTERNALNET = 192.168.20.0/24

	FIREALLIP = 1.2.3.4
	DNATADDR = 1.2.3.5

  /sbin/iptables -I FORWARD -p tcp -i eth0 -o eth1 -d 192.168.20.0/24
--dport 22 -j ACCEPT
  /sbin/iptables -t nat -A PREROUTING -p tcp -d 1.2.3.5 -s !
192.168.20.0/24 --dport 22 -j DNAT 192.168.20.22:22

  I also have a SNAT for masquerading everyting going out

	/sbin/iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth0 -j SNAT
--to-source 1.2.3.4

  I have searched for a solutions longer than I care to admit.  Can
anyone give me an example on how to allow an internal ip address access
to another internal address via the DNAT'ed public address.

Vernon Fort



