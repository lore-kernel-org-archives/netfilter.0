From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCP /MAC
Date: Sat, 8 Nov 2003 10:59:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311081059.hA8AxRj15401@agate.rockstone.co.uk>
References: <20031108104200.61132.qmail@web60205.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031108104200.61132.qmail@web60205.mail.yahoo.com>
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

On Saturday 08 November 2003 10:42 am, kannel sms wrote:

> Dear Friends ,
>
> I have DHCP server . That is allow for dialup/Cable modem users . So that
> users use that certain modems . That all modems have MAC adderesses . Those
> modems providing by us . So those valid modems has known MAC addresses . If
> unknow modem connected to the modem that will be restyrict by the firewall

I have never seen a modem with a MAC address.

> Actually i want  to block unknown MACs and allow the other all known MACs .
>
> I have did some configurations in iptables but it doesn't work . Currently
> i'm testing this concept in a LAN with 5 PCs .

When you say "it doesn't work", what do you mean?   Valid users are not 
allowed access, or invalid users are not denied access?

I think a good move would be to put a LOG rule into your ruleset so that you 
can see the MAC address of the packets being seen by netfilter as well as the 
source & destination IP addresses - that should help you to identify why your 
rules are not matching packets the way you want them to.

Regarding what you are trying to do, however, why not simply set the DHCP 
server to only give out IP addresses to an approved list of MAC addresses 
(what is generally called bootp mode)?

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.
                                                     Please reply to the list;
                                                           please don't CC me.

