From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Temporary forwarding proxy?
Date: Wed, 24 Sep 2003 10:35:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309241035.04343.gdh@acentral.co.uk>
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

Hullo :)

Cutting to the chase, I'm moving a machine on IP 1.1.1.1 from our leased line 
in the office to a data centre at IP 2.2.2.2, and I'd like my firewall box on 
the 1.1.1.0 network to forward HTTP requests for the now non-existant 1.1.1.1 
to 2.2.2.2 and act as an HTTP proxy, just for the few hours whilst the DNS 
updates...

I realise that there will be lots of bandwidth wasted in shuffling duplicate 
data back and forth, but it really only is for a few hours and numbskill ISPs 
that ignore small DNS TTLs...

Is this possible with iptables / SNAT / DNAT ?

Cheers,
Gavin.

