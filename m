From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: mangle after nat in the postrouting chain
Date: Fri, 28 Nov 2003 09:50:46 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122EAA@alderaan.smgtec.com>
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
To: Akos Szalkai <szalkai@2fkft.com>, netfilter@lists.netfilter.org

You are off basis. The System already routes twice.

The problem is that it SNAT's after you've already routed the packet.
You will have to mark the packet in the PREROUTING chain then setup
iproute2 rules that describe what to do with it.

I've had many bad experiences with getting iproute2 working under
'complex' configurations, so it is up to you in getting it to work the
way you'd like. There is also the ROUTE patch, but it doesn't do what I
want it to do (change the packet's route!!).


-----Original Message-----
From: Akos Szalkai [mailto:szalkai@2fkft.com]=20
Sent: Friday, November 28, 2003 9:34 AM
To: netfilter@lists.netfilter.org
Subject: mangle after nat in the postrouting chain

Hello,

is there any kind of patch (or even consideration to create one) for
packet mangling in the POSTROUTING chain after NAT?  (At least as far as
I see, right now it's mangle first, then NAT.)  I can also see the
advantages of mangle before NAT, so perhaps the ideal solution would be
mangling twice on the POSTROUTING chain, if it is possible.

The situation where I would find mangling after NAT very handy is the
following.  I have two independent internet connections, and a few NAT
rules which eventually decide the source address of the outgoing packet.
And only now, knowing the source address is it possible to route the
packet correctly.  Since we are way after routing here, only mangle
could help.

Please correct me if I am not understanding things correctly.

Akos

--=20
Akos Szalkai <szalkai@2f.hu>
IT Consultant, CISA
2F 2000 Szamitastechnikai es Szolgaltato Kft.
Tel: (+36-1)-4887700  Fax: (+36-1)-4887709  WWW: http://www.2f.hu/


