From: David Nillesen <dave@absoluteevil.com>
Subject: Crashes under load on on Alpha running linux 2.6.7 + pppoe + pppd
Date: Sat, 07 Aug 2004 14:37:42 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091853462.3474.48.camel@hecate>
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

There is a lot of links in the chain here that could be going wrong, but
I thought I'd start with the netfilter lists.

The problem is most evident when I start up a bittorrent session. After
running for an hour or so the Alpha gateway box reboots itself. I have
never been able to catch it happening, so I'm not sure what errors I
get. The kernel just reboots and the server attempts to restart itself.

I have a 512/512 kbit link and am usually able to get a combined
throughput of 60-70kbytes per second. Under those circumstances I
usually get an hour or two before the system crashes.

Under lighter loading it does appear to take longer before it crashes.

I am masquerading/SNATing a LAN behind the firewall. The problem occurs
if I use SNAT or MASQ.

I can also run a bittorrent client on the Alpha or on the LAN host.
Again the problem still occurs, regardless of where the client is. I
have tried multiple bittorrent clients.

I can download entire Debian archives without too many problems however,
so I thought it might have something to do with the sheer number of
incoming and outgoing connections that need to be maintained to keep a
bittorrent session running.

My friends have the same config on an Intel box and it performs
flawlessly.

I have tried running dnetc as an articial CPU load, but it makes no
difference. The box appears to be stable normally so long as it has no
pppoe/ppp load so I dont think its hardware.

I run Debian testing Linux on Alpha gateway for my network.

iptables 1.2.9-10
kernel 2.6.7 (same problem existed on 2.6.6)
pppoe 3.5-3

I am running a Netcomm wireless DSL router setup to work as an ADSL
modem via pppoe.

I have a statefull firewall setup, nothing hugely complex mainly a lot
of sanity checks then a few accepts with a default deny at the end.

I am using ip_nat_ftp and ip_conntrack_ftp in addition to the standard
connection tracking modules.


If there are any suggestions, known problems or things you could think
of I should check, it would be much appreciated.

Regards,
Dave


