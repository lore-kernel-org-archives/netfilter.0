From: "Paul" <andnicky@myrealbox.com>
Subject: Re: RE: RE: Can iptables create alias IP for another box?
Date: Mon, 23 Dec 2002 18:50:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040687432.7b13a880andnicky@myrealbox.com>
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
Content-Type: text/plain; charset="us-ascii"
To: rsterenborg@xs4all.nl
Cc: netfilter@lists.netfilter.org, netfilter@newkirk.us

No joy yet.

Have new box B w/fully updated RH 7.3.  Uninstalled ipchains so iptables co=
uld run.  Added rules shown below with 8080 changed to 80.  Rules are vis=
ible in iptables -L -v. =20

But when I sniff the client attempting to browse http://10.5.6.7 from same =
subnet, it's issuing SYNs with no reply. Same whether httpd is up/down on=
 10.5.6.7.  Client can ping both B and A no problem.

Should netstat -an show listening on 80?  Am I missing a fundamental settin=
g that determines whether linux will forward packets at all?  This box ha=
s an eth1 that's down...would it help to remove it?  Or connect it?!  Dis=
abling wccp redirection on the router to the webcache doesn't help...clie=
nt and B are in same subnet anyway.

Is nothing simple :-0 ?

Paul

-----Original Message-----
From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
To: <netfilter@lists.netfilter.org>
Date: Mon, 23 Dec 2002 08:46:31 +0100=20
Subject: RE: RE: Can iptables create alias IP for another box?

> > Port 80 : webserver ?
> > Port 8080 : web-proxy ?
> 
> Don't need 8080 if iptables on B can do:
> 
>   client(tcp/80)--> boxB--> boxA--> boxB--> client

Sure.

> I'd try :
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -d 1.2.3.4 -p tcp --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport 
> 8080 -j DNAT --to-destination 1.2.3.4:80

Change 8080 into 80.

> A & B have one interface each, on different subnets routed to each other.

Well, if A can see B (and vice-versa) there hould be no problem I think.


Rob






