From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Forwarding packets over the same LAN
Date: Mon, 13 Jul 2009 16:14:11 +0200
Message-ID: <1247494451.25529.52.camel@enterprise.ims-firmen.de>
References: <1247493655.2316.104.camel@TestField.intranet.bem.md>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1247493655.2316.104.camel@TestField.intranet.bem.md>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Simion Onea <simionea@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 2009-07-13 at 17:00 +0300, Simion Onea wrote:
> Hi!
> 
> I'm trying to forward connections from one host to another over the same
> LAN using "iptables".
> 
> Here's a description of my configuration:
> The first host has the IP address 172.20.1.245
> The second has the IP address 172.20.1.254 and has a mail server
> listening on port 25/tcp.
> 
> I would like to write a set of "iptables" rules for the first host so
> that any other host connecting to port 10025 on 172.20.1.245 would be
> redirected to port 25 on 172.20.1.254.
> 
> For example:
> - host 172.20.1.10 connects to 172.20.1.245:10025
> - 172.20.1.245 transparently forwards the connection to 172.20.1.254
> - 172.20.1.10 then actually "talks" to 172.20.1.254:25 without even
> knowing it.

You need DNAT+SNAT for this:

# Redirect to IP:Port
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 10025 \
	 -j DNAT --to-destination 172.20.1.254:25

# Ensure that the replies come back to us
iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 25 \
         -d 172.20.1.254  -j SNAT --to-source 172.20.1.245

Possibly you want to limit this even further by adding
"-s <Network-From-Which-To-Allow-Access> to both rules.

