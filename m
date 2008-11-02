From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Basic Routing
Date: Sun, 2 Nov 2008 18:03:40 +0100
Message-ID: <013f01c93d0c$f4a47410$dded5c30$@info>
References: <490DD23F.7060406@amfes.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490DD23F.7060406@amfes.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> To act as a router, where a box has two NIC's, and is connecting a
> LAN with 192.168.0.0/24 to the Internet - is SNAT required?  Or can
> this be accomplished without NAT?

192.168.x.x is private space IP. You cannot route private space IP's on
the internet: you need NAT to give internet access to your clients (or a
proxy if you only need protocols for which proxies are available). This
can be done with SNAT, MASQUARADE (some people need this instead of
SNAT) and I've read somewhere it can also be done using "ip" but I'm not
familiar doing that.


Grts,
Rob


