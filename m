From: "Didier Hung Wan Luk" <DidierH@frci.net>
Subject: RE: Iptables --owner-uid
Date: Sat, 14 Sep 2002 15:53:29 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39778BFB9C25BA429794B15B50AEC781045424@server-dcms>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

I may be wrong but I am in confusion here..
If I am using Samba as a PDC and all my win clients are members of the =
samba domain... are they not using the uid given by Samba? Which is =
itself mapped to a unix user (id) then if this is the case it should =
work is it not..??



Regards,

Didier Hung Wan Luk
FRCI, Sibotie House
L'Anse Courtois
Pailles
Tel: 230-2869636
Fax: 230-2869629


-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]=20
Sent: Saturday, September 14, 2002 3:22 PM
To: Netfilter Mailing List
Subject: Re: Iptables --owner-uid

On Saturday 14 September 2002 11:36 am, Didier Hung Wan Luk wrote:

> Hello All,
>
> I have a question about iptables with the --owner-uid option..
>
> Is it possible to create rules with iptables based on users?
>
> i.e can I say that user marry(uid=3D513) can telnet out but user
> John(uid=3D601) cannot?

Only if those users are telnetting out from your firewall machine (which =

implies they have accounts on it, and are logged in to it, which is not =
a=20
recommended arrangement for a firewall).

> In the iptables man it is said that --owner-? (owner module) can match
> characteristics of locally-generated packets only.. if this is the =
case
> then I cannot use it in an environment where all my clients are =
windows
> clients and the server is a Samba PDC with iptables. Am I right? Or is
> there another way to do this?

You are correct.   --owner-uid only knows about the locally-owning =
process,=20
therefore there is no meaningful owner match for forwarded packets.

There may be some way you can get Samba to link user ID to IP address, =
and=20
then from there generate some netfilter rules to restrict what each user =
can=20
do ?

Antony.

--=20

The first ninety percent of an engineering project takes ninety percent
of the time, and the last ten percent takes the remaining ninety =
percent.


