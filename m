From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: iptables and the  RELATED option
Date: Wed, 13 Aug 2003 08:01:19 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <022e01c3618a$39965340$49caa8c0@caris.priv>
References: <01f801c36103$00a67150$49caa8c0@caris.priv> <1060721359.4543.11.camel@kermit>
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
To: Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

I had this rule in my file as well.  I am pretty sure that this takes car=
e
of the new connections.
( the cdmz-cnet is a chain that is jumped to from the FORWARD chain )
$IPT -A cdmz-cnet -p tcp --dport 21 -j ACCEPT

----- Original Message -----
From: "Ralf Spenneberg" <lists@spenneberg.org>
To: "Peter Marshall" <peter.marshall@caris.com>
Cc: "Netfilter" <netfilter@lists.netfilter.org>
Sent: Tuesday, August 12, 2003 5:49 PM
Subject: Re: iptables and the RELATED option


> Am Die, 2003-08-12 um 20.53 schrieb Peter Marshall:
> > Hi, My name is Peter Marshall.  I am having some problems letting ftp
> > through my firewall without opening all of the ports.  I was trying t=
o
get
> > RELATED to work, but for some reason it will not.  Here is an example=
 of
> > what my file looks like
> >
> > $TABLENAME -A FORWARD -d x.x.x.x -o eth2 -j mychain
> >
> > $TABLENAME -A mychain -m state --state ESTABLISHED,RELATED -j ACCEPT
> > $TABLENAME -A mychain -j DROP
> 1.
> You need a rule which allows new connections to the FTP-Server.
>
> Additionally you have to load the module ip_conntrack_ftp
> If using NAT you have to load ip_nat_ftp.
>
> Cheers,
>
> Ralf
> --
> Ralf Spenneberg
> RHCE, RHCX
>
> Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.co=
m
> IPsec-Howto      http://www.ipsec-howto.org
> Honeynet Project Mirror:
http://honeynet.spenneberg.org
>
>


