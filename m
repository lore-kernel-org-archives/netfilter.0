From: Wolfgang Walter <ml-linux-net@studentenwerk.mhn.de>
Subject: Re: IPSec - IPTables issues
Date: Thu, 6 May 2004 11:10:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405061110.40346.ml-linux-net@studentenwerk.mhn.de>
References: <20040502155538.GD515@schottelius.org> <4096317F.8020609@eurodev.net> <20040504211557.GA236@schottelius.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040504211557.GA236@schottelius.org>
Content-Disposition: inline
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
To: Nico Schottelius <nico-linux-net@schottelius.org>, netfilter@lists.netfilter.org

Am Dienstag, 4. Mai 2004 23:15 schrieb Nico Schottelius:
> Hello Pablo,
> (netfilter guys, please read
> http://www.uwsg.iu.edu/hypermail/linux/net/0405.0/0002.html before)
>
> Pablo Neira [Mon, May 03, 2004 at 01:48:15PM +0200]:
> > Hi Nico,
> >
> > since this stuff is netfilter-related and netfilter/iptables geeks are
> > mostly in netfilter's maillist, I think you could redirect this request
> > there, someone could help you out.
>
> Thank you for the hint. I first thought this is a netfilter problem, but
> currently I don't think so.
>
> The problem is IMHO the design of the Linux IPSec implementation.
>
> I'll compare what freeswan did with what Linux 2.6 does now:
>
> Freeswan has virtual devices (ipsec*), through which the unencrypted
> packets come into the system. So you can add these firewall lines:
>
> - allow AH, ESP, UDP/500, deny rest on eth0
> - allow IPs/networks, etc. on ipsec0
>
> With Linux 2.6 I don't have virtual devices. This means that my IPSec
> packets enter the physical device twice:
>
> 1. esp encrypted packet enters
> 2. Linux decrypts it
> 3. Linux sends the unencrypted packets through the same device again
>
> The problem with that is, that
>
> - allow AH, ESP, UDP/500, deny rest on eth0
>
> will deny the _content_ of my encrypted packages (step three is broken).
>
> Wouldn't this work fine, if we have the virtual device like freeswan had
> or is netfilter broken with this?
>
> I mean I cannot practicly setup an IPSec only access point with the curre=
nt
> netfilter and ipsec in Linux 2.6, or am I deadly wrong?
>
> Greetings,
>
> Nico

We solved the problem by marking ipsec traffic in the mangle table=20
(PREROUTING). This mark is preserved when the packet gets decrypted. So=20
basically:

* if a paket is AH, ESP mark it with 1 in mangle table, PREROUTING chain

* if you see non-ip-sec pakets: if it is marked with 1 it is a decrypted ip=
sec=20
packet, otherwise it came in unencrypted.

Greetings,

=2D-=20
Wolfgang Walter
Studentenwerk M=FCnchen
Anstalt des =F6ffentlichen Rechts

