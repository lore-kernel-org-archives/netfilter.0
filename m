From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Maxium concurrent connections with IPTables
Date: Tue, 3 Aug 2004 09:46:15 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0408030909320.10603-100000@blackhole.kfki.hu>
References: <564DE4477544D411AD2C00508BDF0B6A22073275@usahm018.exmi01.exch.eds.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <564DE4477544D411AD2C00508BDF0B6A22073275@usahm018.exmi01.exch.eds.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Small, Jim" <jim.small@eds.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Mon, 2 Aug 2004, Small, Jim wrote:

> I'm curious, what is the maximum number of concurrent connections possible
> with IPTables using connection tracking for udp and for tcp?  (using latest
> 2.4 kernel and 2.6 kernel)
>
> I'd also be curious if this changes with the TCP window patch.

In January-February we tested conntrack where the setup was the
following:

- firewall: dual Xeon CPU, Serverworks chipset, 2GB RAM, Intel copper GE
  cards with the e1000 driver
- two 3Com switches with GB uplink
- 20 "client" and 10 "server" machines. There was a minimal boa httpd
  on the server and two httperf instances started on each client machines

One test series consisted of trying to issue 5000, 10000, 15000, ... 40000
parallel new http sessions trough the firewall per second. The tested
kernels were 2.4.25, 2.4.25+SMP, 2.4.25+SMP+NAPI, 2.6.3(+SMP+NAPI),
2.6.3 conntrack locking patch, 2.6.3 + conntrack locking + nonat patch,
2.6.3 + conntrack locking + nonat patch + TCP window tracking patch.

Overall, 2.6 was better than 2.4, SMP+NAPI and conntrack patches
helped to improve performance. The TCP window tracking patch resulted
practically no loss in performance.

Maximally we could reach ~200,000pps troughput (indifferent from packet
size), ~20,000 new connection/s and ~2,000,000 parallel connection with
this test firewall, in this environment. Delay, jitter, etc was not
measured. There was no iptables rule at all, we loaded in just the
ip_conntrack module.

> I'm currently taking a Cisco firewall class and they're claiming that PIX
> which supports 500,000 concurrent connections with the appliance version and
> 1,000,000 with the blade version vastly exceeds the capabilities of all
> general purpose O/S'.

The number of maximal concurrent connection is mostly limited by the RAM
of the hardware. It'd be interesting to know wether how many new
connection can be opened up trough a PIX per second.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


