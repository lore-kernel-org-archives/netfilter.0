From: =?iso-8859-1?Q?S=F8ren_Kent_Jensen?= <soren@familie-jensen.dk>
Subject: Re: MRTG and IPTABLES
Date: Wed, 7 Jan 2004 17:06:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00dc01c3d538$3b014650$0223a8c0@soren>
References: <83055D4B014C9E478D2F04624B9E82CFD4D5@noveldc.novelgmt.mu> <200401070644.58547.danielf@supportteam.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>, Gilles Yue <gyue@novelgmt.intnet.mu>, netfilter@lists.netfilter.org

UDP 161 is user to poll equipment for status / statistics
UDP 162 is used for SNMP traps.
(SNMP traps are typically used by equipment to send a warning message to =
an
SNMP server.)


Regards
S=F8ren Kent Jensen


----- Original Message -----
From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
To: "Gilles Yue" <gyue@novelgmt.intnet.mu>; <netfilter@lists.netfilter.or=
g>
Sent: Wednesday, January 07, 2004 1:44 PM
Subject: Re: MRTG and IPTABLES


> SNMP UDP Ports 161 and 162 MRTG typically only uses 161.
>
>
> Thanks
>
> On Wednesday 07 January 2004 00:54, Gilles Yue wrote:
> > MRTG cannot work properly due to iptables running.
> >
> >
> >
> > Anybody knows which port number to open to enable MRTG to work proper=
ly.
> >
> >
> >
> > Thanks.
> >
> >
> >
> > Rgds
> >
> > gy
>
> --
> Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
> The distance between nothing and infinity is always the same no matter =
how
> close you get to nothing.
>
>



