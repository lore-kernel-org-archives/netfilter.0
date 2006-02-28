From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: connectionless port forwarding
Date: Tue, 28 Feb 2006 15:06:06 +0100 (CET)
Message-ID: <61062.193.173.147.3.1141135566.squirrel@webmail.sterenborg.info>
References: <43FF041C.4050005@debian.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FF041C.4050005@debian.org>
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
To: "Giacomo A. Catenazzi" <cate@debian.org>
Cc: netfilter@lists.netfilter.org

On Fri, February 24, 2006 14:03, Giacomo A. Catenazzi wrote:
> Hello.
>
> I'm searching if I can do (or why not) a connectionless port
> forwarding. Google didn't help me, and now I'm using a std
> port forwarding using nat tables, but a smaller solution is
> better IMHO.
>
> I admin an "high" traffic web site. In last time there was
> an huge increment of web-spam/blog-spam traffic, which I would
> avoid.
>
> I want to direct traffic from a blacklist into an other port,
> so that a simple http server will advise user (and offer a
> graphical challenge) to unblock.
>
> Practically I want to mangle the port of blacklist-originated
> packets, from 80 to 81, and the opposite for outgoing traffic.
> Port 81 will be firewalled from extern, so I think there cannot
> be problem with connection identification / collision.
>
> Would it be possible?

I don't think so.
http://www.netfilter.org/projects/patch-o-matic/pom-submitted.html#pom-su=
bmitted-raw

<quote>
The NOTRACK target can be used to select which packets *not*
to enter the conntrack/NAT subsystems. Please keep in mind:
if you mark a packet with NOTRACK, then

- all the conntrack functionalities are lost for the packet
  (ICMP error tracking, protocol helpers, etc)
- all the NAT functionalities are also lost.
</quote>

Portforwarding is a form of NAT (DNAT) so you'd lose the functionality yo=
u need.

> Would it be lighter than std nat solution (and conncetion tracking)?
> Are there already some netfilter module? (or i should implement
> myself one?)

Maybe another possibility exists that I'm not aware of..

(Comes to mind, if you run a webserver on the firewall that hosts the web=
pages
you want to show the users on the blacklist, you probably wouldn't need
conntrack/NAT. However, running servers on a firewall is considered bad
practice and I'm not sure I'd do this in a high volume site like you
mentioned.)


Gr,
Rob



