From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: Knowing thy enemy - #1 - MS ISA Server - SSL-to-SSL bridging
Date: Mon, 7 Jun 2004 14:04:40 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E330@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

I thought it'd be a nice idea to keep up to date on what other firewall
platforms can do in order to compare them to current OSS solutions.

Overview
Today, I present Microsoft ISA server 2000's feature called SSL-to-SSL
bridging. It is a Layer 7 feature which handles server side transparent
SSL filtering/tunneling, but with a price.=20


OSS Equivalent
Squid proxy provides non-transparent client-side proxy SSL
filtering/tunneling  but it does not provide any server-side SSL
protection.


Microsoft's Description of the feature
SSL to SSL bridging allows the firewall to terminate and reestablish SSL
sessions. In contrast, your poor cousin's firewall just allows SSL
tunneled traffic through to the Exchange Web sites. The ISA 2004 SSL
termination feature allows the ISA firewall to inspect the contents of
the SSL connection and block those containing suspicious or recognized
exploits. In contrast, a packet filter firewall like PIX merrily passes
the SSL tunneled exploits back to your OWA, OMA and RPC over HTTP sites.
But to be fair, the PIX passes those exploits really fast!=20

SSL termination (SSL to SSL bridging) is only one of the ISA 2004
firewall features that enable secure remote access to Exchange Servers.
Check out some of these other Exchange protection technologies:=20
	Delegation of Basic authentication prevents unauthenticated
users from connecting to the Exchange site=20
	ISA 2004 firewall form-based authentication allows the firewall
to generate the form, instead of the Exchange 2003 Web site. Firewall
generated forms-based authentication extends the security provided by
delegation of basic authentication to protect the OWA Web site from
attacks by unauthenticated users=20
	Secure Exchange RPC, both inbound and outbound with the secure
Exchange RPC filter. If the ISP's don't DoS your Exchange connections by
blocking TCP 135, you can enjoy "hand's free" access to the full range
of Exchange features from the full Outlook client using secure,
encrypted Exchange RPC connections from anywhere in the world=20


My comments / Questions

If you are doing end-point SSL termination, the Private keys for all
your SSL sessions must be
    Located on the ISA server
    Available through some sort of domain surrogate (only for MS
networks)
    Available from the SSL server (Only for MS products since nobody
does this)
    Something else??
Can someone tell me which one that Microsoft uses for SSL-SSL bridging?=20

Does anyone else find this worrisome that the Firewall holds so much
important data?
    Exploitation of the firewall would mean a breakdown in the whole
end-to-end security that SSL was designed for.

Do you think this is a safer way to secure your network than just
leaving Exchange / IIS / Apache / etc. servers open to direct SSL based
attacks?

If we all deem this feature worthy for inclusion, what can we do to
implement it?
    Squid is the most logical OSS product to integrate it into. Have
they seen / like this feature?


Other misc. questions

Does anyone still export port 135 to the internet (VPN's excluded) for
real business needs?

With RPC-over-HTTP becoming more prevalent, can ANYONE reliably filter a
network without explicitly filtering the HTTP data stream and block well
known HTTP-RPC signatures? I mean, if there's a SOAP exploit in a
well-known web-service, how are we to block just that SOAP service vs.
the entire HTTP protocol?
    It seams that Microsoft has realized the fcked up the TCP port
concept (they're not the only ones) and as a result they're forced to
start polluting HTTP with more and more.=20
    HTTP's going to start getting blocked the same way that TCP is today
if companies don't use it responsibly! Be afraid?

