From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Static/Dynamic NAT Combination
Date: Fri, 28 May 2004 17:58:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040528175829.7b5a6da6.leslie.polzer@gmx.net>
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


Hello list,

a short question...

With this setup:

Box A on Net A
192.168.35.247

Box B on Net B
192.168.1.2

Firewall/Router
192.168.1.1/192.168.34.184/PPP address


is it possible to NAT Box B statically (i.e. 1:1, except on specific
ports, e.g. 6666/6667) and Box A dynamically (i.e. with flexible port numbers)?


Many thanks,

Leslie

