From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: how to filter kazaa
Date: Thu, 22 May 2003 21:01:19 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CAC@wardrive.citadelcomputer.com.au>
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
To: jaws <jaws@skyinet.net>, kisero@uolsinectis.com.ar, georgc@FARMINGDALE.EDU, netfilter@lists.netfilter.org

That's why the rules below match the protocol negotiations because it'll =
track the data on any port no matter which one it uses... just don't =
send an email with this data ... ha ha ha.. ;)

-----Original Message-----
From: jaws [mailto:jaws@skyinet.net]
Sent: Thursday, May 22, 2003 8:11 PM
To: kisero@uolsinectis.com.ar; georgc@FARMINGDALE.EDU;
netfilter@lists.netfilter.org
Subject: RE: how to filter kazaa


but filtering port 1214 will not solve the problem coz kazza can use =
other=20
ports.

At 12:58 PM 5/21/2003 -0300, eribicic@sinectis.com wrote:
>isnt it easyer to filter ports 1214?
>
> > The following rule has worked for me.
> >
> > http://www.securityfocus.com/infocus/1531
> >
> >
> > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Username: -j =
REJECT
> > --reject-with tcp-reset
> >
> > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-Network: -j =
REJECT
> > --reject-with tcp-reset
> >
> > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-IP: -j REJECT
> > --reject-with tcp-reset
> >
> > $IPTABLES -A FORWARD -p tcp -m string --string X-Kazaa-SupernodeIP: =
-j -j
> > REJECT --reject-with tcp-reset
> >
> > -----Original Message-----
> > From: tracker [mailto:jaws@skyinet.net]
> > Sent: Wednesday, May 21, 2003 3:20 PM
> > To: netfilter@lists.netfilter.org
> > Subject: how to filter kazaa
> >
> > Hi all,
> >
> > Im new to this list and iptables. I would like to know how to filter =
kazaa.
> >
> > Thanks.
> >
> > Jaws
> >
> >
> >
>--
>Slds.





