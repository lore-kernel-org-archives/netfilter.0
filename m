From: <bmcdowell@coxhealthplans.com>
Subject: RE: irc
Date: Mon, 17 Nov 2003 10:28:51 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D73101131848@coxhpexg.coxhp.com>
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
To: netfilter@lists.netfilter.org


At the risk of getting OT, what is the point of a proxy for IRC on a =
gateway?  I could see it as an anonymizer to bounce IRC off of, but on a =
gateway this would not seem to functionally any different than NAT.  =
What am I missing?

Bob

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
Sent: Monday, November 17, 2003 10:18 AM
To: netfilter@lists.netfilter.org
Subject: Re: irc


On Monday 17 November 2003 4:10 pm, SBlaze wrote:

>  > All I can suggest is that you look around for an IRC proxy server,
>  > however I have no knowledge of such things myself.
> >
> > Regards,
> >
> > Antony.
>
> There are such things as IRC Proxys. bnc is one of the more common =
ones
> that I have heard of. However this won't do him any good since he is
> looking for a rule to allow in IRC protocol.

I'm not sure that *is* what he's looking for?   Quoting from his second=20
posting:

"The 'firewall' in this case, is a transparent proxy server. =A0The =
proxy=20
server will be the gateway to the internet.   I need to allow irc =
connections=20
through this machine, somehow. =A0I don't know how to do that."

Therefore it seems to me that he's looking for an IRC proxy server, not =
a=20
packet filtering rule.

Maybe I'm just confused.

Antony.

--=20

This email was created using 100% recycled electrons.

                                                     Please reply to the =
list;
                                                           please don't =
CC me.

