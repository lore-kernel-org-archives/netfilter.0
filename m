From: Peggy Kam <ppkam@n-dsi.com>
Subject: logging for snat
Date: Thu, 12 Jan 2006 09:55:11 -0500
Message-ID: <1137077711.3562.25.camel@ndspc131.p.n-dsi.com>
References: <1136301475.43ba95a30a5fe@mail.deakin.edu.au>
	<1136304661.5137.34.camel@anduril.intranet.cartel-securite.net>
Reply-To: ppkam@n-dsi.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1136304661.5137.34.camel@anduril.intranet.cartel-securite.net>
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

Hi,

Is it possible to log traffic for a specific postrouting policy that
will be snat to somewhere else from a particular interface?

ie.  iptables -t nat -I nat POSTROUTING -i eth0 -s
192.168.1.0/255.255.255.0 -d 192.168.22.0/255.255.255.0 -p tcp -m tcp -j
SNAT --to-source 192.168.22.215:1-65535

I would like to log the translating address of the above iptables rule.
Please advice if that can be done and how.

Thanks,
Peggy


