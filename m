From: Christian Pernegger <pernegger@gmail.com>
Subject: Extremely slow upload (and more) from behind NAT
Date: Fri, 12 Aug 2011 18:06:00 +0200
Message-ID: <CAKbQEqG3vrDpLBzh7CVBxhezWOtuZRASFPFG4uHTOQDpkyUFtw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=kD8nwD4U+V+FgLPs59r+ilCiCKwskzfujpXltIQaiok=;
        b=iC8N2p7zXxJVsJ1dGDajG8+tccZ5S5Z3ZQlbxrdCpcz9i7/V1DZR1jsby+g9QMRST+
         veGZxKi5ptEOV5eEFEjuE08dwZyQ5cduDf1te+Y/inW88B7KKhPeYSEBqKZbYmOKltiv
         MamFPo89JoAzztQgKDMArLhOZXreIRD3EXz3U=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi list,

I've been building my own home firewalling/NAT routers from commodity
hardware and Debian stable since the times iptables was called
ipchains and never had a problem, but now I've switched ISPs again and
I just can't seem to get NAT to work properly this time.

The ISP is Chello Austria (UPC), a cable one. For all intents and
purposes it's supposed to be a regular Ethernet connection at my end,
with a nominal bandwidth of 4 Mb/s up, 35 Mb/s down and a de facto
static public IP on my router's external interface. The cable modem
seems to act as a transparent bridge (it doesn't show up on
traceroute).

Everything is fine on the router itself, or any other box I directly
connect to the cable modem, but all NATed clients behind it get
severely degraded service, though only some things seem to be broken:
+ The downstream bandwidth is fine, within a few percent of nominal.
+ The latency (as measured by ping and similar) is excellent.
+ Online games like Team Fortress 2 and World of Warcraft work flawlessly.
- Web browsing only barely works. When trying to access a site,
Firefox will hang for 10+ seconds at the "Waiting for $SERVER" stage,
then the whole site will render instantly. More complex JavaScript or
Flash based sites might hang indefinitely.
I haven't yet stumbled across a site that won't work at all, hitting
refresh will eventually succeed. Also, sites never load partially, no
missing style sheets, "broken" images or the like. It seems to be an
all or nothing deal.
- The upstream bandwidth ... well, there isn't any, really. Test
uploads to an FTP server in the ISP's own network crawl along
erraticly at < 0.1 Mb/s and/or time out. The same test run from the
router gives me 1-2 Mb/s, three connections in parallel net the full 4
Ms/s.
- When testing via speedtest.net, the latency and downstream tests
work but the upload test fails. It just sits there "Connecting ..."
and eventually times out
- When testing via pingtest.net, the packet loss test fails in the
same fashion.
It doesn't matter if a client's running Linux or Windows.

The router is running Debian stable (Squeeze), using kernel
linux-image-2.6.32-5-686 2.6.32-35 and iptables 1.4.8-3 as provided.
DNS is provided by dnsmasq 2.55-2 running on the router with both the
ISP's and Google's servers upstream. IPv6 is turned off via kernel
command line. For testing purposes I've reduced my firewall script to
this one-liner:
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth1 -j MASQUERADE

The official method for getting one's IP is DHCP, though configuring
it statically reportedly also works. I tried both, no difference.
The DHCP server *does* suggest an MTU of 576 bytes instead of the
ususal 1500 bytes, but that seems to be bogus. Manual PMTU discovery
via don't-fragment pings to various servers is consistent with an MTU
of 1500 and anyway, changing it to 576 doesn't have any appreciable
effect at all, with or without a TCPMSS rule as suggested by the
iptables man page.

Since randomly disabling TCP "offensive" TCP options like syncookies,
ECN and even SACK didn't work either, I'm now officially at my wits
end.

I'd be really grateful if anyone could help me out ...

Thank you,

Christian
