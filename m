From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Redirect to same LAN and preserve source IP
Date: Mon, 12 Jul 2004 14:19:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121419.40110.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter <netfilter@lists.netfilter.org>

Hi :)

This is a topic that's come up a couple of times recently and I wondered if 
there was some super-high-powered incantation I could use...

Presently, I'm running squid on the same machine that the LAN uses for 
Internet access, so I'm doing a simple 

$IPT -A PREROUTING -s 10.0.0.0/255.255.255.0 -i eth1 -p tcp -m tcp --dport 80 
-j REDIRECT --to-ports 3128

and this preserves the IP address of the LAN machine which made the request, 
which is what we want for the log files.

However, I need to change the 10.0.0.254 'defaut gateway' machine to a 
standalone router, and the squid installation will be then on a seperate 
machine. Is there any way I can 'grab' the outgoing requests on port 80, and 
shove them into port 3128 on another machine and preserve the correct source 
IP, rather than everything being marked with the IP of the gateway 
10.0.0.254 ?

Cheers,
Gavin.

