From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: masquerading and access
Date: Wed, 30 Oct 2002 10:36:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003a01c27ff7$d57fb000$0401000a@robbysan.org>
References: <20021030070200.GA1367@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021030070200.GA1367@localhost.localdomain>
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
To: netfilter@lists.samba.org

> 	I want to implement a masquerading proxy ( I hope I am clear
> here ) on a network of 50 machines. Out of this only 25 machines say
> 192.168.0.1-192.168.0.25 need to connect to net. Squid will be the
> caching proxy.
> I just want to know whether I have to put a rule as,

Since there's no /xx for your 25 IP's, I'd just REDIRECT everything
sent to port 80 (and 443 and maybe others you might need) to 3128, and
then use squid's acls to restrict access by IP address range which is
quite easy. That is, if you have the whole /24 netblock for yourself.

# iptables -t nat -A PREROUTING -s 192.168.0.0/24 -p tcp --dport 80 -j
REDIRECT --to-ports 3128


Rob


