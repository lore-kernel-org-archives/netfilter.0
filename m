From: Andrea Barisani <lcars@infis.univ.trieste.it>
Subject: Firewall Tester 0.9
Date: Sat, 21 Jun 2003 15:54:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030621135457.GI17194@sole.infis.univ.trieste.it>
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

Hi to all!

I've just released version 0.9 of my Firewall Tester, you can find it at:

http://www.infis.univ.trieste.it/~lcars/ftester
http://ftester.sourceforge.net

Main new features in this version are:

* added support for CIDR notation
* extended CIDR and 'ranges' notation support to all modes
* added a new configuration syntax 'flags:' for more flexible
  conf files
* added pseudo fragments reassembly in ftestd

See the Changelog for details.

Any code contribution/improvement is very welcome ;)

Thanks to all.

Bye

----------------------------------------------------------------------------

Description:

The Firewall Tester, is a tool designed for testing firewalls filtering policies
and Intrusion Detection System. Basically ftester is made of a packet generator 
tool (ftest) and a sniffer (ftestd), the first script injects custom packets with 
a signature in the data part while the sniffer listens for such marked packets, 
the comparison of the sniffer logs with the injector ones permits the 
identification of firewall filtering rules. Unlike common firewall testing tools 
or packet generators ftester is capable of generating network traffic that will 
looks like real connections to the firewall or IDS system tested, this feature 
allows us to test stateful inspection firewalls (like netfilter or ipfilter) and 
IDS (like snort).  


--
------------------------------------------------------------
INFIS Network Administrator & Security Officer         .*. 
Department of Physics       - University of Trieste    /V\
lcars@infis.univ.trieste.it - PGP Key 0x8E21FE82      (/ \)
----------------------------------------------------  (   )
"How would you know I'm mad?" said Alice.             ^^-^^
"You must be,'said the Cat,'or you wouldn't have come here."
------------------------------------------------------------

