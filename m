From: Tommy W <tommy@svearike.sytes.net>
Subject: Two Internet Connections send port 80 on one interface and rest on
	another
Date: Thu, 20 Jan 2005 06:44:20 +0100
Message-ID: <200501200644.20040.tommy@svearike.sytes.net>
Reply-To: 189@telia.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi. 
I have 2 internetconnections (eth0 and eth2) and a local net (eth1)
as it is now I have eth1 masqueraded behind eth0 so all internet activity
is used on eth0 . But now I want port 80 to be "redirected" to eth2 in order 
to always get good speed on http.
How can I do this ?

as a matter of fact I can't get the machine to listen on both ips :(
I do 
$ route add default gw $ETH2_GW
$ route add default gw $ETH0_GW
but that really messes things up.

What decides which ip is to be used first (outbound locally)
say if I do ping www.helgon.net
what decides which ip I get?
is it the first default route in the $ route   list?
is it the first ethX device?
I'm lost.. :(
please send me some links, or even better. A working solution :)
Thanks

