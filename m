From: Alasdair Ramsay <alasdair.ramsay@cdc.uk.net>
Subject: Re: measure traffic
Date: Tue, 08 Oct 2002 10:46:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA2A97B.7020605@cdc.uk.net>
References: <200210080025.26576@.> <20021007201735.LIPN459.mta02-svc.ntlworld.com@there>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Then you can plot them onto rolling graphs using mrtg, looks very
pretty.  I have a small shell script that reads the byte counters from
the /proc tree, resets them and plots the results.

Regards
Alasdair

Antony Stone wrote:
| On Monday 07 October 2002 7:58 pm, PayalR wrote:
|
|
|>Hi,
|>I have a small urgent problem. As I told you all before, I have my single
|>Linux box at a server farm where I have to pay per Mb of data transmitted.
|>I have a doubt that those guys there are cheating me. They are taking more
|>money than actual data transmitted. Can I use iptables to log all incoming
|>and outgoing data and see total incoming/outgoing data in a
day/week/month?
|
|
| Why not just use the byte counters in ifconfig ?
|
| eg: ifconfig eth1
|
| eth1      Link encap:Ethernet  HWaddr 00:02:2D:05:3F:8D
|           inet addr:192.168.44.101  Bcast:192.168.44.255
Mask:255.255.255.0
|           UP BROADCAST NOTRAILERS RUNNING  MTU:1500  Metric:1
|           RX packets:1930 errors:0 dropped:0 overruns:0 frame:0
|           TX packets:1950 errors:0 dropped:0 overruns:0 carrier:0
|           collisions:0 txqueuelen:100
|           RX bytes:912045 (890.6 Kb)  TX bytes:265386 (259.1 Kb)
|           Interrupt:9 Base address:0x100
|
| So this machine I'm on now has received 912045 bytes and sent 265386
bytes
| since the interface was initialised....
|
| Antony.
|
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE9oql54+7BX0uR648RAiVmAJ98GbbdRT1ju5fq6DVUGGv3SC87ZgCfQbsb
klhUAERGjgpRGhjllZ5GWBo=
=GfdD
-----END PGP SIGNATURE-----



