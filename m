From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Redirecting incoming traffic to 127.0.0.1
Date: Fri, 21 Mar 2003 09:34:20 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122D9D@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


To monitor what is going on you could always mark the packets and log =
them going through the system, no?

I thought you could always drop the 'lo' interface and bind 127.0.0.1 to =
another inter face, but apparently that gives me an error every time I =
try to connect to it. I use 2.4.18 kernel and iproute2. You could try =
that, but I am not sure that it will do any good.

Is this a constraint in the kernel for security, or just something wonky =
with my setup?



-----Original Message-----
From: Henry Ritzlmayr [mailto:h.ritzlmayr@gmx.at]=20
Sent: Friday, March 21, 2003 8:58 AM
To: Netfilter Mailing List
Subject: Re: Redirecting incoming traffic to 127.0.0.1

SNAT ist only valid in the POSTROUTING chain. But even that didn=B4t do=20
the trick.=20
Do you know any way to check what really happens with the packet since
tcpdump only shows it before natting?=20
If there is no tool/command or anything like that - than it looks like I

