From: David Leangen <netfilter@leangen.net>
Subject: Debugging network problems
Date: Wed, 29 Aug 2007 19:33:42 +0900
Message-ID: <1188383622.29330.9.camel@sonoda.bioscene.co.jp>
Reply-To: netfilter@leangen.net
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Hello!

My network was just changed from a vanilla ADSL connection to direct
ftth. There is now a network connector with a  100MB/s entry, which gets
routed to a Buffalo Broad station.

I'm having some troubles and my debugging so far has not been
successful, so I'm hoping some more experienced hands can give me some
advice.


First of all, my previous setup was working exactly as I wanted.
Essentially, when making the switch to the new network, on my
firewall/proxy machine, I just did:

  adsl-stop (to stop the pppoe daemon)
  ifconfig eth0 new.ip.address up
  route add default gw ip.address.of.broad.station

Then in my iptables, I changed:

  -A POSTROUTING -o ppp0 -j MASQUERADE

to 

  -A POSTROUTING -o eth0 -j MASQUERADE


Here's what's happening now...

Generally, I can connect to the outside world, and the outside world can
connect to me. By this, I mean that each of the local machines behind my
proxy can connect.

However, the connections back to my own URL are sporadic. In other
words, sometimes I can connect, sometimes I can't. Assuming my domain is
my.company.com, when I try to connect to my.company.com from within my
network, sometimes I can, sometimes I can't, but I have not at all
figured out a pattern.

When this happens, domain names are being resolved, but I get
"Connection timed out" errors.

I guess I first need to check to see if I can't get out, or I can't get
back in.


Any advice as to how/where I can look for the cause would be greatly
appreciated! I suspect it may have something to do with NAT, but I'm not
experienced at debugging this stuff.


Thanks so much!!!

David




