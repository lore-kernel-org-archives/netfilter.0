From: Harold Pritchett <harold@uga.edu>
Subject: Configuring netfilter for pptp connections
Date: Mon, 22 May 2006 19:30:39 -0400
Message-ID: <4472499F.2000200@uga.edu>
Reply-To: harold@uga.edu
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Sorry if this is a FAQ.  Searching the archives is very
difficult.

I have a small LAN, connected to the Internet via a Red
Hat Fedora Core 3 firewall running netfilter.  I would like
to run the Microsoft VPN software on a windows machine
on this network and connect to a VPN server located on
the Internet side of the firewall.  The windows server
uses NAT to connect to the Internet.

I configured the VPN client while it was directly on the
Internet, and it works fine.  When I try to connect from
behind the firewall it fails to connect.

Searching for help on the Internet has not been very
productive.  Everything I can find on the net is very old.
Linux kernels 2.2 and 2.4.  I'm currently running 2.6.12 with
iptables 1.2.11.


-- 
Harold Pritchett
harold@uga.edu                                +1.706.546.0692
pgp public key: http://www.arches.uga.edu/~harold/pgpkey.html

"The Internet is for porn.
  The Internet is for porn.
  Why you think the net was born?
  Porn! Porn! Porn!"
		Trekkie Monster
		Avenue Q


