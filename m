From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: measure traffic
Date: Mon, 7 Oct 2002 21:17:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021007201735.LIPN459.mta02-svc.ntlworld.com@there>
References: <200210080025.26576@.>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210080025.26576@.>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 07 October 2002 7:58 pm, PayalR wrote:

> Hi,
> I have a small urgent problem. As I told you all before, I have my single
> Linux box at a server farm where I have to pay per Mb of data transmitted.
> I have a doubt that those guys there are cheating me. They are taking more
> money than actual data transmitted. Can I use iptables to log all incoming
> and outgoing data and see total incoming/outgoing data in a day/week/month?

Why not just use the byte counters in ifconfig ?

eg: ifconfig eth1

eth1      Link encap:Ethernet  HWaddr 00:02:2D:05:3F:8D
          inet addr:192.168.44.101  Bcast:192.168.44.255  Mask:255.255.255.0
          UP BROADCAST NOTRAILERS RUNNING  MTU:1500  Metric:1
          RX packets:1930 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1950 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:912045 (890.6 Kb)  TX bytes:265386 (259.1 Kb)
          Interrupt:9 Base address:0x100

So this machine I'm on now has received 912045 bytes and sent 265386 bytes 
since the interface was initialised....

Antony.

-- 

The difference between theory and practice is that
in theory there is no difference, whereas in practice there is.

