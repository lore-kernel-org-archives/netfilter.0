From: Petre Bandac <g38@rdsbv.ro>
Subject: Q: does it work only with iptables ?
Date: Thu, 11 Dec 2003 08:22:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312110822.10145.g38@rdsbv.ro>
Reply-To: g38@rdsbv.ro
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
To: netfilter@lists.netfilter.org

I have 2 linux machines - linux_1 and linux_2

linux_1 has behind it a subnet with routable adresses (not private)

I want that all the traffic incoming from the subnet behind linux_1 and going 
to port 80 to be redirected to linux_2, and from linux_2 go on the internet

I presumed that a -j SNAT --to-source IP_linux_2 should be enough, but 
apparently it isn't

should I issue a SNAT rule on linux_2 too, or it should run something like 
squid there ?

thanks in advance,

petre

-- 
 8:22AM  up 50 mins, 1 user, load averages: 0.11, 0.05, 0.01


