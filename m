From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Netfilter vs commercial
Date: Mon, 9 Aug 2004 12:34:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051250@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Michael Gale <michael.gale@utilitran.com>, netfilter@lists.netfilter.org

>
> I would like to know how people on this list ... which I know might be =
a biased opinion feel how a Netfilter firewall
> box .. properly configured would compare in security to a commercial =
firewall.

it would be equivalent--given that both firewalls are configured by =
"experts."  the majority of my day job involves check point fw-1/vpn-1 =
consulting.  as far as "firewall filtering capabilities" (for lack of a =
a better term), you can build a firewall using netfilter that has at =
least the same; if not more, functionality as fw-1/vpn-1.  the path of a =
packet through the fw-1 kernel (from memory--don't quote me on this):

- drop all packets with IP Options set
  netfilter:  "-m ipv4options --any-opt -j DROP" -OR- "-j IPV4OPTSSTRIP"

- drop spoofed packets (anti-spoofing)
  netfilter:  easy enough to setup with iterations on "-s $INTERNAL_NET =
-i ! $INTERNAL_IF -j DROP" etc...

- if packet is not "new" compare to state table
  netfilter:  use "-m state --state ESTABLISHED,RELATED" to allow =
replies to established connections=20

- if packet is "new" compare to security policy rule base
  netfilter:  use "-p tcp --syn -m state --state NEW -j ACCEPT" to =
accept new connections (for TCP at least)
>
> I do not want to compare performance or stats on through put but the =
strength of the firewall. The reason I am asking is
> to at the moment we are using Netfilter based firewalls which I have =
setup Squid and Frox and many other application
> level filters.

beyond basic stateful filtering--you can enable higher-level security =
checks using application-level gateways as you are currently doing.  =
check point refers to this as "application intelligence" which allows =
you to do things like blocking user-agent strings in HTTP =
communications.  there's is absolutely *nothing* that check point can do =
here that you can't do with squid.  conversely--there's plenty you can =
do with squid that you cannot do with application intelligence.  check =
point point to the fact that the application intelligence checks run =
in-kernel as opposed to user space, which i'm sure is much faster.  not =
sure if the speed difference is actually relevant though.  my experience =
with this has been that application intelligence gives people just =
enough capability to make them really want a true, full-blown =
application level gateway--which is precisely what check point has =
argued against since its inception.

check point's real selling point is in their management =
architecture--the ability for a security admin that either lacks the =
time or expertise to manage rulebases on many firewalls (100's) with a =
suite of pretty GUI management applications (rule editor, log viewer, =
status viewer).  if you have just a few firewalls, and are competant =
with shell/perl scripting--you could be much happier managing your =
firewalls through an SSH connection.

if you really know what you're doing and have very specific filtering =
goals in mind--you'll probably be happier with netfilter in the long =
run, as it will allow amazingly granular control of how/when/why packets =
get filtered.

dunno if this helps, but i'm also not sure that the question isn't just =
a wee bit too high in flame-bait content (i understand you didn't intend =
it as such).

-j

