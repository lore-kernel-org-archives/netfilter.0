From: "Isaiah Makwakwa" <isaiah@medcol.mw>
Subject: IP masquerade + squid problem
Date: Mon, 10 Apr 2006 09:19:14 +0200 (CAT)
Message-ID: <51851.192.168.2.7.1144653554.squirrel@mail2.medcol.mw>
Reply-To: isaiah@medcol.mw
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


Dear list,

I have a problem with my squid + ip masquerading setup. My box has two
interfaces one internal one external. I masquerade all internal traffic on
this box which also runs squid proxy.

When my iptables runs, and I point my client to the proxy on this box I do
not seem to get anywhere even though the squid box accepts and logs a
request. When I go direct I can get the page.

My gut feeling is that the squid box does get the request, processses but
due to some nating problem fails to identify the client which made the
request. Could anyone help to arrest the rot?

Regards,

Isaiah,

Malawi


-- 
Linux System/Network Administrator,
College of Medicine,
P/Bag 360,
Chichiri,
Blantyre 3.



