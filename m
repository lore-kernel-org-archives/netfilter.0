From: =?ISO-8859-1?Q?Bj=F8rn?= Ruberg <bjorn@ruberg.no>
Subject: Re: DNAT to localhost
Date: 14 Nov 2002 07:02:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037253770.11775.18.camel@lilleulv>
References: <1037219719.6450.5.camel@tux.go-nix.ca>
	<1037225641.10536.1.camel@lilleulv> 
	<1037231613.6791.13.camel@tux.go-nix.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1037231613.6791.13.camel@tux.go-nix.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thu, 2002-11-14 at 00:53, Nix N. Nix wrote:
> On Wed, 2002-11-13 at 17:14, Bj=F8rn Ruberg wrote:
> > On Wed, 2002-11-13 at 21:35, Nix N. Nix wrote:

[snip]

> I wrote a util that would open a SOCK_DGRAM socket and bind it to a
> specific interface, like 127.0.0.1:<some_port> or
> 192.168.1.1:<some_port> .  Thus, I had something listening on
> localhost:8080/udp.  I added the rule, then tried this from a computer
> on the 192.168.1.0/24 network (in bash):
>=20
> echo -n 'Abracadabra' > /dev/udp/192.168.1.1/80
>=20
> This had no effect.  It did have an effect without the rule and with my
> util listening on 192.168.1.1:80 .

Are you familiar with the brilliant tool netcat? You find it at
http://www.atstake.com/research/tools/

> > When you debug your iptables rules, turn on full logging to see what is
> > being dropped.
>=20
> How do I do that ?

Check out the LOG target (you'll find it in the netfilter docs) and find
out how it works. Then apply a LOG rule before you redirect. If what you
see there makes sense, apply (or add) a LOG rule after the redirect.
Then you will be able to debug your redirection properly.

You may also want to take a look at the utilities tcpdump and ethereal.
Be, however, aware that the source code to tcpdump has been trojaned in
at least one of the versions. Check with your Linux vendor
(www.redhat.com etc) for precompiled packages.

Bj=F8rn


