From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: 2 basic iptables questions
Date: Tue, 25 Jul 2006 15:08:49 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582901679B3@pxtbenexd01.pxt.primeexalia.com>
References: <44C69356.5000602@jemconsult.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <44C69356.5000602@jemconsult.biz>
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
To: James Marcinek <jmarc1@jemconsult.biz>, netfilter <netfilter@lists.netfilter.org>



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of James Marcinek
> Sent: Tuesday, July 25, 2006 2:56 PM
> To: netfilter
> Subject: Re: 2 basic iptables questions
>=20
> Peter,
>=20
> Here's my take on it:
>=20
> 1) The /etc/sysconfig/iptables file is where your rules are contained
> (once you build them). I myself write a shell script that contains my
> rules, then run the script which builds them. I then do a service
> iptables save command, which will save the rules currently in
> /etc/sysconfig/iptables. I believe a backup of
> /etc/sysconfig/iptables.save is also created.
>=20

Actually, it's never logged.  If an accept is hit then the rules stop
(correct me if I'm wrong, which is frequent enough).

So in this case it looks like they originally setup a chain to handle to
log and drop but then added the accept call before it


Chain log_and_drop
> > [0:0] -A log_and_drop -j LOG --log-prefix "FWSERVER (Blocked
> > Connection)"
> > [0:0] -A log_and_drop -j REJECT --reject-with icmp-port-unreachable

Chain service_chain
> > [0:0] -A service_chain -p icmp -j ACCEPT
> > [0:0] -A service_chain -p icmp -j log_and_drop
> > .

>=20
> I can't help you here. I would actually like to know more about the
> logging; however your guess looks correct. The one rule looks like it
> would be evaluated first then accepted. Unless the logging facility
has
> special workings...
>=20
> I typically drop everything, then open what I want. Since ICMP is
> dropped, do you really need to monitor it?

We general log certain types of failures.  But some clients log
everything that hits their firewalls (not sure why, they just throw us
cash and say buy lots of drive space).

In general there is nothing special with logging.  It is like any other
rule but it doesn't trigger ACCEPT, REJECT or DENY which all stop
processing

We tent to do log-level=3D6 so it doesn't fill up the console.  You =
should
also note that you might want to put some rate limiting in the logging
as well.  If you do log and you get slammed with requests then it will
fill up fast.  If the same thing is duplicated 50/times sec then who
cares.

Gary

