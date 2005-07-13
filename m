From: Donald Murray <donaldm314@gmail.com>
Subject: Re: dnatting
Date: Tue, 12 Jul 2005 21:21:43 -0600
Message-ID: <12984bb0050712202131980c46@mail.gmail.com>
References: <20050711151830.GA26670@tranquility.scriptkitchen.com>
	<20050711184520.GA17202@bender.817west.com>
Reply-To: Donald Murray <donaldm314@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050711184520.GA17202@bender.817west.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

On 7/11/05, Jason Opperisano <opie@817west.com> wrote:
> On Mon, Jul 11, 2005 at 11:18:30AM -0400, Payal Rathod wrote:
> > Hi,
> > I have a rule on my friend's broadband connection to redirect traffic
> > from outside to an internal machine like,
> >
> > iptables -A PREROUTING -d 1.2.3.4 -p tcp -m tcp --dport 80 -j DNAT  \
> > --to-destination 192.168.10.10:80
> >
> > But she complained that people from inside the network cannot do
> > http://1.2.3.4 in their browser and see the site. Is she correct?
> > What is wrong with my rule because I can see the site from outside?
>=20
> 1)  client; say 192.168.10.100, sends TCP SYN to 1.2.3.4
>=20
> 2)  iptables machine receives packet destined for 1.2.3.4, DNAT's it to
>     192.168.10.10 and forwards the packet out the internal interface
>=20
> 3)  192.168.10.10 receives TCP SYN from 192.168.10.100 and replies
>     directly to 192.168.10.100 with a SYN/ACK
>=20
> 4)  client; 192.168.10.100, receives SYN/ACK from 192.168.10.10 and
>     discards it, as it matches no connection in the SYN_SENT state
>     (recall that our SYN was sent to 1.2.3.4).
>=20
> that the why.  the proper way to avoid this is to have people on the
> inside connect to 192.168.10.10.  i will leave all the half-assed
> work-arounds and kludges as an exercise for the reader and other
> posters.
>=20
> -j
>=20
> --
> "Peter: This party couldn't be better if Jesus was here.
>  Jesus: For my next miracle, I will turn water... into FUNK."
>         --Family Guy
>=20
>=20

Because the destination server is on the same subnet, users on the inside
could indeed connect directly to that machine. Alternatively this could be
handled via DNS.


However, if the destination server is inside a DMZ, the firewall needs
to DNAT in
PREROUTING and SNAT in POSTROUTING. The DNAT gets traffic to
the DMZ, the SNAT allows it back. Something like:

    iptables --table nat -A PREROUTING -p tcp -i $LAN_INTERFACE --dport htt=
p \
        -d $INTERNET_IP -j DNAT --to-destination $DMZ_HTTP_IP

    iptables --table nat -A POSTROUTING -d $DMZ_HTTP_IP -s $LAN_IP_RANGE \
        -p tcp --dport http -j SNAT --to-source $LAN_IP

