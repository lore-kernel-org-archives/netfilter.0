From: "Rodre Ghorashi-Zadeh" <rodrico7@hotmail.com>
Subject: Re: Howto match only the first connection from an IP
Date: Wed, 19 Nov 2003 00:04:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law14-F99vOSQeSOzNC0001fd0b@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gdamjan@mail.net.mk, netfilter@lists.netfilter.org

Hello,

I don't think this will work for all traffic, but it should for TCP based=20
traffic. Assuming the first packet is a
"SYN" packet, you could try:

iptables -t nat -p tcp --syn --dport 80 -s 171.68.1.1 -m quota --quota 40 \
     -j REDIRECT --to-ports 9999

the key here is the "--syn" flag on the TCP protocol (-p tcp)

Good luck

=AEodre

>From: Damjan <gdamjan@mail.net.mk>
>To: netfilter@lists.netfilter.org
>Subject: Re: Howto match only the first connection from an IP
>Date: Tue, 18 Nov 2003 18:26:02 +0100
>
> > > My goal is to set-up an iptables rule that will match and DNAT the
> > > first HTTP(port 80) connection from a client (IP address).
> > >
> > > The first connection is defined as the first established TCP session
> > > from the time the iptables rule is inserted. No other TCP connection
> > > should match nor should be DNAT-ed.
> > >
> > > Is there any easy way to do this with current Netfilter/Iptables/pom.
> >
> > I can't think of a way to do this with netfilter on its own.
>
>Well I've come to this solution, but I wonder how reliable it is
>
>iptables -t nat -p tcp --dport 80 -s 171.68.1.1 -m quota --quota 40 \
>     -j REDIRECT --to-ports 9999
>
>This seems to match only the first connection.
>
>Any other ideas???
>
>--
>Damjan Georgievski
>jabberID: damjan@bagra.net.mk
>

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online =20
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3D3963


