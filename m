From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: Too many ARP entries and Re: sendto: No buffer space available
Date: Tue, 3 Dec 2002 13:27:58 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021203132758.I14289@funkyjesus.org>
References: <571705138.20021202111645@pobox.com> <14127620470.20021202182836@pobox.com> <1038920934.8888.4.camel@elendil.intranet.cartel-securite.net>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1038920934.8888.4.camel@elendil.intranet.cartel-securite.net>; from blancher@cartel-securite.fr on Tue, Dec 03, 2002 at 02:08:54PM +0100
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

On Tue, Dec 03, 2002 at 02:08:54PM +0100, Cedric Blancher wrote:
> Le lun 02/12/2002 =E0 21:28, andre.correa@pobox.com a =E9crit :
> > But  there  is  still a question for me. Looking at my arp table, I
> > see that there are =3D~ 150 entries, seconds passing and more entries
> > coming, 20 seconds after I can have =3D~1100, it goes on until it reachs
> > =3D~2200  entries,  then it goes back to the =3D~100 and starts over ag=
ain.
>=20
> Wierd...

Weird, certainly... haven't seen anything like this before.

<snip>

> It is not normal. You should monitor ARP traffic on your network using
> arpwatch (see Freshmeat, available as .deb, .rpm too) to see if someone
> would be playing ARP cache poisoning (see http://www.arp-sk.org/).

I haven't looked at arpwatch recetly, but presumably that will just scream
blue bloody murder.

What does

tcpdump -npevvvi <<interface>> arp=20

look like?

The original paragraph of:

> > I  have  less  then  50  NAT users. Is it normal to have some many ARP
> > entries with this variation? Looking the ARP table I see my "Internet"
> > interface with lots of entries, with internet host IP addresses and my
> > gateway's NIC MAC address.

Isn't quite as clear as required.  Andre, any chance you could cut and paste
a few examples, so we can try to understand the symptoms a bit better?

--=20
FunkyJesus System Administration Team


