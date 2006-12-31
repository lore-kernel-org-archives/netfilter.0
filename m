From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: Distro Choice for iptables as Enterprise Firewall
Date: Sun, 31 Dec 2006 17:51:13 +0100
Message-ID: <20061231165113.GA1862@outback.rfc2324.org>
References: <4597E5CD.8050104@rackage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4597E5CD.8050104@rackage.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Am Sonntag, den 31 Dezember hub Rackage | Randles folgendes in die Tasten:

Hi!

> I'm new to iptables and this list so forgive me if this subject has been =

> covered previously.

> I'm sure this topic is a cause for much debate with no definitive answer =

> however I would be glad to hear suggestions never the less.

> What Distro's are recommended for deploying iptables as a dedicated=20
> firewall?

I like a small Debian installation for this purpose most.
The Debian base install is very small and you can easily remove unused
parts of it and add only the things you need (iptables, vlan, iproute,
younameit).
So you have full control on what is installed on your firewall and don=B4t
have to warry about unused daemons and stuff.
(I had some slightly bad experiences with a RedHat EL3 server where I
 had trouble to remove unused daemons...)

> What server hardening steps would you recommend? (/Bastille?)

Build your own kernel (currently you may want to wait to get some file
system corruption problems fixed before doing so :)) and activate
SE-Linux or patch your kernel with grsecurity[42].

Use iptables to restirct access to all needed services (ssh e.g.) and
configure your service as strict as possbile, e.g. allowing only users
with ssh-keys to access your box.

[42] http://www.grsecurity.net/

Ciao
Max
--=20
	Follow the white penguin.

