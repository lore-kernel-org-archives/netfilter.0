From: Jordi Warmenhoven <penguinsula@yahoo.com>
Subject: Unwanted traffic to be FORWARD-ed is dropped by filter : ARP cache
	problem?
Date: Sun, 17 Oct 2004 08:54:14 +0100 (BST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041017075414.78289.qmail@web20021.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I realise my question is not directly related to
iptables, but since I noticed the 'problem' using
iptables I hope it's ok to pose it here.

My Linux box gets its outside IP (LinuxIP) from a DHCP
server. The IP address has been the same from the
beginning, so I guess some static mapping is done (I'm
no expert in this matter :-). It is a dual-boot
system, and when I reboot to MS-Windows, I get a
different IP (WinIP) which is also always the
same.

After having set up iptables, I notice that the Linux
box drops all lot of outside traffic (mostly MS
broadcasts) with DST=[my WinIP] SRC=[some host]. It is
_always_ the MS-Windows IP address that ends up in
the FORWARD filter chain. Since I am just a simple
client on the network, is there maybe some Proxy ARP
gateway that keeps the two IP addresses mapped against
my MAC?

It's no big deal and I just drop the specific packets
before they get logged, but I'm just curious...


--Jordi


	
	
		
___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun!  http://uk.messenger.yahoo.com

