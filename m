From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: ddos / no connection tracking / tarpitting
Date: Fri, 22 Apr 2005 00:01:32 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019AAE@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Taylor Grant <gtaylor@riverviewtech.net>
Cc: Vic N <vic778@hotmail.com>, netfilter@lists.netfilter.org

I've got an old p3, 800mhz 1u server with 128mb ram running tarpit with
two external IP's (one low and one high).  This way up/down, down/up
scans all get hung.  It answers on most external ports.  One thing
though, you need to tell it to ignore the broadcast.  When I take the
firewall and bring it back up we have seen some problems (when it starts
it's arp advertisements).

I've also played with mirring SMTP and HTTP but tarpit'ing seems to work
the best.

Has been working fine for some time...


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jozsef
Kadlecsik
Sent: Thursday, April 21, 2005 11:50 PM
To: Taylor Grant
Cc: Vic N; netfilter@lists.netfilter.org
Subject: Re: ddos / no connection tracking / tarpitting

On Fri, 22 Apr 2005, Taylor Grant wrote:

> > So my question is, is this the basic element of building a good
> > anti-ddos solution wtih iptables to address a *large* volume of ddos
> > traffic to build iptables w/o connection tracking?
>
> Yes this is possible and (I think) fairly easy to do.  As I have never
done this I can not tell you for sure, but this is what I would do if I
were to do such a thing.
>
> I will presume that you are wanting to drop all traffic to a specif
port on an IP address for the sake of this discussion.
>
> iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp --dport 5678 -j
NOTRACK
> iptables -t filter -A FORWARD -d 1.2.3.4 -p tcp --dport 5678 -j TARPIT
>
> This will cause any traffic that comes in that is distend to 1.2.3.4
on port 5678 to  NOT be tracked with the connecting tracking sub system
and to subsequently be redirected to the TARPIT target.

You *must* use the rule

iptables -t raw -A PREROUTING -s 1.2.3.4 -p tcp --sport 5678 -j NOTRACK

as well, otherwise conntrack will pick up the reply packets from the
TARPIT target.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


