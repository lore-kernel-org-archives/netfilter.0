From: "Didier Hung Wan Luk" <DidierH@frci.net>
Subject: RE: Iptables --owner-uid
Date: Sat, 28 Sep 2002 08:36:53 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39778BFB9C25BA429794B15B50AEC7810D2E4A@server-dcms>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>, Netfilter Mailing List <netfilter@lists.netfilter.org>

Have you ever heard of userfirewall?
It does exactly what we are talking about.=20
But currently it is only with ipchains..

Didier Hung Wan Luk
FRCI, Sibotie House
L'Anse Courtois
Pailles
Tel: 230-2869636
Fax: 230-2869629


-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
Sent: Sunday, September 15, 2002 3:00 PM
To: Netfilter Mailing List
Subject: Re: Iptables --owner-uid

On Saturday 14 September 2002 3:14 pm, Alistair Tonner wrote:

> What I'm reading is that the process generating the packets
> 	(for owner match to work) has to be a process running on the
> 	box on which iptables firewall is running.  If the packets are
> 	coming through the forward chain (i.e. from downstream pc's)
> 	there is no way of matching UID (owner) as there is no owning
> 	process generating the packet.

That is correct.

>  	You might be better off matching
> 	MAC addresses in this case ...

I don't see why that is any better than matching IP address ?   Surely=20
there's going to be a one-to-one correspondence between MAC address and =
IP=20
address for the Windows clients, so you cannotdo anymore in netfilter =
with=20
one than with the other....

The interesting part is to workout whether Samba (which is running on =
the=20
netfilter machine) can tie up user ID with IP address, and then =
add/remove=20
netfilter rules by running a script when the user logs in/out.

Antony.

> On 2002.09.14 07:53 Didier Hung Wan Luk wrote:
> > I may be wrong but I am in confusion here..
> > If I am using Samba as a PDC and all my win clients are members of =
the
> > samba domain... are they not using the uid given by Samba? Which is
> > itself mapped to a unix user (id) then if this is the case it should
> > work is it not..??

--=20

How I want a drink, alcoholic of course, after the heavy chapters
involving quantum mechanics.

 - 3.14159265358979


