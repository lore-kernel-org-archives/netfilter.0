From: "Filip Sneppe (Cronos)" <filip.sneppe@cronos.be>
Subject: benchmark tool for netfilter - any recommendations ?
Date: 18 Jun 2002 14:11:22 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1024402282.591.20.camel@xbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,

I am looking for a traffic generator type aplication that can
generate a realistic workload to test a netfilter firewall.

There are some cool tools out there for throughput measurements,
like netpipe, etc. but they are not ideal to test connection
tracking performance. The way I see it, you either have tools
that:

- flood the network with traffic over just one TCP connection
  or UDP stream. Not a lot of use in testing connection tracking
  performance as it's just one ESTABLISHED connection.

or

- flood the network with more or less random crap as far as IP
  addresses/ports is concerned. Not a very realistic workload
  either.

IMHO a realistic workload for testing connection tracking 
performance is a workload that has a limited number of IP
addresses on one side of the firewall (a DMZ with 64 hosts,
or a LAN with 100-500 hosts) and a wide range of IP addresses
at the other side (the Internet). The tool should be able
to mimic normal network behavior like short connections (http)
vs. longer lived connection (ftp download), etc.

It would be nice to have a client/server tool that you could be
used in this type of setup:

client ------ FW ------ server

and where either client and/or server could generate traffic 
from various IP addresses/ports in a controlled way.

I am currently looking at Web-Polygraph (www.web-polygraph.org)
from the Squid developers, but upon installation, I realized
the license doesn't allow the publishing of the results.

Are there any tools worth looking at ? Is there anything else a
decent netfilter (firewall ?) performance benchmarking tool
should be able to do ?

Regards,
Filip



