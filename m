From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: OT: curious about eth0/eth1
Date: Tue, 7 Jan 2003 22:47:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301072247.24369.netfilter@newkirk.us>
References: <6620000.1041983993@leverage>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6620000.1041983993@leverage>
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
To: Tommy McNeely <Tommy.McNeely@Sun.COM>, netfilter@lists.netfilter.org

On Tuesday 07 January 2003 06:59 pm, Tommy McNeely wrote:
> I am curious about why people choose to make a certain interface
> internal or external...

> I notice several people pick eth0 as their outside interface, and
> sorta "oh yea" the rest of the inside network is on eth1.  I know the
> linux kernel could really care less what they are called, its mostly a
> "neatness" thing I guess... Also it seems like that leaves your box
> open to attack from the time it installs (if you do a NET based
> install) till the time you get around to actually putting a firewall
> on it.

Why would this in particular leave a box exposed?

I think that the main reason for 'some one way, some the other' is random=
=20
chance.  However, consider this scenario:

You have two NICs, eth0 and eth1. The connections on one you trust (-i=20
eth0 -j ACCEPT), the other you don't.  One of them fails, or the board=20
works loose from it's socket, or something, so that upon booting the=20
machine you only have one interface.  No matter which board fails, the=20
remaining board would be eth0.  If eth0 is your 'trusted' internal=20
network in normal conditions, and it fails, then suddenly the untrusted=20
network is operating under the trusted network's rules.  However, the IP=20
assignment (if static!) would remain that of the trusted network, so as=20
long as eth0 is configured with a static IP this shouldn't present a=20
risk.  If, however, both are dynamic, (say DHCP assigned) then this=20
would qualify as a security hole, possibly a huge one.  To be fair, this=20
is probably a very rare intersection of situations, but if eth0 is the=20
untrusted network, then any failure would be an annoyance, not a risk.

j



