From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: off topic - hope somebody can help
Date: Fri, 11 Jun 2004 15:04:22 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BYqvp-0002ON-1z@vishnu.netfilter.org>
References: <7EACCDBB65D37443912D80713CC1245D472832@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7EACCDBB65D37443912D80713CC1245D472832@fsnsab20.losangeles.af.mil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Lets see, Im aware that "shut" an interface when I unplug the network =
cable
is a stupid thing to do. But im not asking about this.

Im asking about to "tear down" the protocol of the interface, so I can =
loose
all the routes of this link and the traffic switch directly to second =
isp.
I don=92t care really if I unplug the cable the Ethernet card remains =
up, I
need the routes disappear in order to switch to the other isp.

I has nothing to deal with Microsoft, linux or whatever.

Like this mail say, when you make a show int in cisco routers there's a =
link
state and a protocol state. If protocol goes down (one reason could be
unplug the cable) the routes are lost.


This is what I need, and additional to this, some distributions shows in =
the
console a link notice and some don=92t, I assume this is related to the =
nic
driver.



-----Mensaje original-----
De: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] En nombre de Hudson Delbert =
J
Contr 61 CS/SCBN
Enviado el: Viernes, 11 de Junio de 2004 12:48
Para: 'netfilter@lists.netfilter.org'
Asunto: RE: off topic - hope somebody can help

i think cisco's 'show interface' commands are a model of what s/be
displayed.
these displays delinate between the functionality of the physical =
interface
and
the protocol that should operating on them.

~piranha@usaf

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Friday, June 11, 2004 5:01 AM
To: netfilter@lists.netfilter.org
Subject: Re: off topic - hope somebody can help


On Friday 11 June 2004 12:42 pm, Gavin Hamill wrote:

> On Friday 11 June 2004 12:29, Antony Stone wrote:
> > Why shouldn't it?   The interface is still fully functioning even if =
you
> > choose to disconnect it - I think plenty of people would get upset =
if
the
> > interface went down on its own just because the cable got unplugged =
(or
> > the hub had a short power failure)...
>
> This is definately one of the biggest no-brain decisions Microsoft =
made
> with Windows 2000 - as soon as the link on an Ethernet adapter =
disappears,
> all open TCP sessions from the workstation are immediately reset.
>
> Multiply that by power-cycling a 48-port switch, and you have a =
headache
:/

Sheesh - I did not know that - I wrote what I did above on the basis =
that
this=20
would be such a stupid and inconvenient thing to do that of course =
nobody=20
would implement it as a standard "feature".

Glad to know that no matter how hard I try, Microsoft still manages to
exceed=20
my expectations of their inept design concepts.

Antony.

--=20
I think, therefore I am.
I'm pink, therefore I'm Spam.
I drink, therefore I think I am.

                                                     Please reply to the
list;
                                                           please don't =
CC
me.




