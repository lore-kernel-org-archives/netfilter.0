From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: rules for Real's Helix Universal Media Server?
Date: Mon, 3 Mar 2003 02:54:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303030254.50601.netfilter@newkirk.us>
References: <3E62E020.2090004@mega-bucks.co.jp>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E62E020.2090004@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>, netfilter@lists.netfilter.org

On Sunday 02 March 2003 11:54 pm, Jean-Christian Imbeault wrote:
> I am running Real's Helix Media Server on a linux box and would like
> to secure the box as much as possible but I can't figure what ports
> this media server needs. It seems to pretty much need everything about
> 1024 ...

http://service.real.com/help/library/guides/helixuniversalproxy/htmfiles/=
firewall.htm#198350

> Has anyone been able to come up with some rules for a Helix Media
> Server?

Presuming the rules are being run on the box itself, it looks like these=20
INPUT rules for a Universal Server:

# For Helix universal server dealing with media players
iptables -A INPUT -p tcp --multiport --dport 554,7070,8080 -j ACCEPT
iptables -A INPUT -p udp --dport 6970:6999 -j ACCEPT

# For Helix universal server communicating with universal proxy
iptables -A INPUT -p tcp --multiport --dport 3030,7802,7878 -j ACCEPT
iptables -A INPUT -p udp --dport 3030 -j ACCEPT

and these for a Universal Proxy server:

# for Helix universal proxy communicating with media players or child=20
proxies
iptables -A INPUT -p tcp --multiport --dport 554,1090,1755 -j ACCEPT

# for Helix universal proxy communicating with media servers
iptables -A INPUT -p tcp --dport 3030 -j ACCEPT
iptables -A INPUT -p udp --dport 3030 -j ACCEPT
# 6970-32000 for both media servers and parent proxies
iptables -A INPUT -p udp --dport 6970:32000 -j ACCEPT


Apparently that huge range of UDPs can be restricted with the "UDP Resend=
=20
Port Range" Proxy setting.  The OUTPUT rules, if you need them as well,=20
should apparently be:

# for universal server communicating with media players
iptables -A OUTPUT -p udp --dport 6970:6999 -j ACCEPT

# for universal server communicating with universal proxy
iptables -A OUTPUT -p udp --dport 6970:32000 -j ACCEPT

# for universal proxy communicating with players or child proxies
iptables -A OUTPUT -p udp --dport 1024:5000 -j ACCEPT
iptables -A OUTPUT -p udp --dport 6970:65535 -j ACCEPT

# for universal proxy communicating with media server and parent proxy
iptables -A OUTPUT -p tcp --multiport --dport 554,1755,3030,7070,7878 -j=20
ACCEPT
iptables -A OUTPUT -p udp --dport 3030 -j ACCEPT

Also, a universal proxy needs to send on TCP 9090 and listen on a=20
configured port for administration.

These are certainly not the tightest rules possible for this beast, quite=
=20
likely around 50% of these rules wouldn't see any traffic if you have=20
ESTABLISHED,RELATED allowed through. (like OUTPUT going to a media=20
player)  My suggestion would be to place EST/REL rules first, then these=20
rules, separated instead of using multiport match.  After a reasonable=20
period of time, check the packet counts with "iptables -L -v -n" and see=20
which rules never hit, then try commenting them out of the script for a=20
while to ensure that you can do without them.  If you know more about=20
how these communications are initiated than I do, you could probably=20
look at these rules and pick out which ones would only be replies.

j


