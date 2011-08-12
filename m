From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Extremely slow upload (and more) from behind NAT
Date: Fri, 12 Aug 2011 19:34:35 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108121929440.32562@frira.zrqbmnf.qr>
References: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Pernegger <pernegger@gmail.com>
Cc: netfilter@vger.kernel.org

On Friday 2011-08-12 18:06, Christian Pernegger wrote:

>Hi list,
>
>I've been building my own home firewalling/NAT routers from commodity
>hardware and Debian stable since the times iptables was called
>ipchains and never had a problem, but now I've switched ISPs again and
>I just can't seem to get NAT to work properly this time.
>
>The ISP is Chello Austria (UPC), a cable one. For all intents and
>purposes it's supposed to be a regular Ethernet connection at my end,
>with a nominal bandwidth of 4 Mb/s up, 35 Mb/s down and a de facto
>static public IP on my router's external interface. The cable modem
>seems to act as a transparent bridge (it doesn't show up on
>traceroute).

transparent and bridge is a tautology - by definition, bridges, by 
default, like regular switches and hubs, don't show up on traceroutes at 
all, unless you explicitly add a TTL breakpoint.


>Everything is fine on the router itself, or any other box I directly
>connect to the cable modem, but all NATed clients behind it get
>severely degraded service, though only some things seem to be broken:
>+ The downstream bandwidth is fine, within a few percent of nominal.
>+ The latency (as measured by ping and similar) is excellent.
>+ Online games like Team Fortress 2 and World of Warcraft work flawlessly.
>- Web browsing only barely works. When trying to access a site,
>Firefox will hang for 10+ seconds at the "Waiting for $SERVER" stage,
>then the whole site will render instantly.

So what happens (log output!) if you issue

 telnet netfilter.org 80

>- The upstream bandwidth ... well, there isn't any, really. Test
>uploads to an FTP server in the ISP's own network crawl along
>erraticly at < 0.1 Mb/s and/or time out. The same test run from the
>router gives me 1-2 Mb/s, three connections in parallel net the full 4
>Ms/s.

Owing to your mail's subject, does it go away without NAT?

>- When testing via speedtest.net, the latency and downstream tests
>work but the upload test fails. It just sits there "Connecting ..."
>and eventually times out

Those speedtest sites are, most of the times, for the trash anyway, 
since they often only utilize a single connection only, which is not 
going to be a good approximation of utilizable bandwidth. (I used to 
require like 5 concurrent connections to dlc.sun.com to fill 90 Mbit.)

