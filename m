From: "Elmshauser, Erik" <erike@pbgnw.com>
Subject: RE: DNAT and IP aliasing - how?
Date: Tue, 11 Mar 2003 09:16:00 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0FD2E5E35F0C0D41AEA66C9C6F39F30D086AC1@HERMES.pbgnw.com>
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
To: netfilter@lists.netfilter.org


> -----Original Message-----
> From: Joel Newkirk [mailto:netfilter@newkirk.us]
> Sent: Tuesday, March 11, 2003 6:10 AM
> Subject: Re: DNAT and IP aliasing - how?
>=20
> On Monday 10 March 2003 06:02 am, Henning Riis Rasmussen wrote:
> >
> > What is the "correct" way to set this up?
>=20
> if WAN1 is eth0 with 10.0.0.1 presently, then try this:
>=20
> ifconfig eth0:1 10.0.0.2 netmask 255.255.255.0
> ifconfig eth0:2 10.0.0.3 netmask 255.255.255.0
>=20
> This creates an alias on eth0 adding 10.0.0.2 as an additional IP for
> that interface, then again for 10.0.0.3
>

I thought that this method was deprecated as of the 2.2.x kernel and the
new iproute2 tools?  Isn't the "correct" method actually:

# add address 10.0.0.2/24 (i.e. standard netmask and broadcast) to eth0
ip addr add 10.0.0.2/24 brd + dev eth0

# add address 10.0.0.3/24 (i.e. standard netmask and broadcast) to eth0
ip addr add 10.0.0.3/24 brd + dev eth0

I think the command reference that comes with it is great, and it's on
the web too: http://snafu.freedom.org/linux2.2/docs/ip-cref/

This is a pretty good rundown on how it works:
http://snafu.freedom.org/linux2.2/iproute-notes.html

The tools are located here: ftp://ftp.inr.ac.ru/ip-routing/

	--Erik

Rev. Dr. Erik C Elmshauser D.D.
Head of I.T.
Pacific Benefits Group NW LLC
erike@pbgnw.com
Phone  - 800.259.0455
Fax    - 800.662.0082
 There are 10 kinds of people in the world,
Those that can do binary arithmetic, and those that can't.


