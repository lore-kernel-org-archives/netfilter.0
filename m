From: "Heiko" <electropunk@web.de>
Subject: Problem reading an URL with Java through IPTables/Squid proxy
Date: Mon, 4 Aug 2003 18:53:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c35aa8$f77129a0$0200a8c0@hf.home.de>
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

Hi all,

I've been using an IPTables (1.2.6a-5) / Squid (2.4.6-2) combo on my gateway
box (Debian Woody, Kernel 2.4.20, latest updates) for quite some time
without any problems.
Lately I've been starting to develop Java applications and now encounter the
problem that any attempt to read the contents of an Internet URL through

java.net.URLConnection.getInputStream()   - or -
java.net.URL.openStream()

methods from a client situated in my local intranet results in a 'The
requested URL could not be retrieved' reply from Squid.
Checking Squid's access.log, I've found that any URL requested by my Java
code seems to be truncated when (or before?) being received by Squid, eg a
request for the URL

http://www.google.de/intl/de/about.html

results in a log message similar to

w.x.y.z - - [04/Aug/2003:18:17:32 +0200] "GET /intl/de/about.html HTTP/0.0"
400 1244 NONE:NONE

Obviously, any such request will fail.

The problem can't be in my code because it works ok if I switch to Win2k
(got a dual boot configuration on my gateway box).

Squid is not set up as a transparent proxy, and the IPTables rules
concerning Squid look like this:

$IPTABLES -A PREROUTING -t nat -i $inner_nic -p tcp -d ! $inner_nw --dport
80 -s $inner_nw -j REDIRECT --to-port 3128

$IPTABLES -A INPUT -i $inner_nic -p tcp -s $inner_nw -d $inner_ip --dport
3128 -j ACCEPT
$IPTABLES -A OUTPUT -o $inner_nic -p tcp -d $inner_nw -s $inner_ip --sport
3128 -j ACCEPT
$IPTABLES -A INPUT -i $inner_nic -p tcp -d $inner_nw -s $inner_ip --sport
3128 -j ACCEPT
$IPTABLES -A OUTPUT -o $inner_nic -p tcp -s $inner_nw -d $inner_ip --dport
3128 -j ACCEPT

where

inner_nic = eth0
inner_nw = intranet (192.168.0.0/24)
inner_ip = IP bound to eth0 (gateway's IP, 192.168.0.x)

Again, this setup works 100% when accessing HTTP/FTP URLs through any means
but the aforementioned Java code.

Can anyone shed some light on this?

TIA!


