From: Sanjay Arora <skpobox@yahoo.com>
Subject: netfilter =?iso-8859-2?Q?Guru=B6?= HELP:Getting my computer on the
	net using ISP providing 172.16.x.x IP Address
Date: 07 Jun 2004 16:41:38 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086606698.5409.34.camel@Sewak.Asr.Lan>
Reply-To: skpobox@yahoo.com
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi all

I am connected to my ethernet cable ISP. I have been provided a static
IP 172.16.0.141 Netmask 255.255.255.0. I have setup a local firewall
using IPcop default setup with DMZ and port forwading for HTTP & Mail to
DMZ Webserver (on IPcop box using three network cards, 192.168.200.1
Green & 192.168.100.1 DMZ).

My ISP Gateway is 172.16.0.1 and traceroute shows next hop to be
202.164.40.9. DNS Servers given by my ISP are 202.164.32.81 &
202.164.32.82.

I asked for a live IP but they are asking too much for it....equivalent
to a leased line especially when the max throughput is 6K at the best.

I contacted no-ip.com to findout if I can use their services and they
replied as under:

> Unfortunately this is not possible if your ISP themselves is using a 
> NAT.  I would contact your ISP to find out how to get a real IP address 
> from them, so you can run a server.

On the other hand, my ipcop firewall is logging blocked domain DNS
queries (reverse lookups) from some sites that I am using for browsing &
download. Since the firewall is stateful that means that these are new
connection requests that the firewall is logging & blocking. How are
these reaching my firewall?....they should be stop at the ISP server.

My questions are:

1. How do I find out what my ISP is doing? Asking is no use.
2. Is there a way to reach my firewall box from the internet?....just
like those reverse DNS lookups.
3. If my ISP were not using NAT...how could my server be reached?...as
the no-ip.com support implied.

Request please help.

With best regards to all.
Sanjay.








