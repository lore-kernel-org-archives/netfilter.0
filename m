From: Ron Peterson <rpeterso@mtholyoke.edu>
Subject: filter on ethernet alias
Date: Thu, 4 Sep 2003 11:22:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030904152250.GA25689@mtholyoke.edu>
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
To: Netfilter Discussion <netfilter@lists.netfilter.org>

I've found several threads on the topic in the list archives, but the
solutions presented don't quite match my situation.

Putting the aliases issue aside for the moment, here's the application.
I configure dhcp to set a linux box's ip address to be the default
gateway for certain hosts.  Then I use iptables rules to DNAT traffic
destined for ports 80/443 to to a box (could be same box) running apache
on say ports 8080/8443.  Apache simply redirects traffic to these ports
to a particular URL.  So for example, unregistered computers get
directed to a web page that says they have to register their computer
before they'll get off-campus Internet access.

Now I'd like to direct certain people to one page, and others to a
different page (e.g. their machine has been identified as being hacked,
so they get directed to a page telling them what to do).

So I was thinking I could do this by aliasing multiple IP's to a single
interface, and filter based on the virtual interface.  Can't do this, I
guess.  Neither can I filter on destination IP, because the box is a
gateway, not a destination.  Is there any way to filter a packet based
on which gateway ip address it was sent to, if both addresses are
assigned to the same interface?

-- 
Ron Peterson                          -o)
Network & Systems Manager             /\\
Mount Holyoke College                _\_v
http://www.mtholyoke.edu/~rpeterso   ---- 

