From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Trying to setup two ethernet cards with two websites
Date: Fri, 3 Jan 2003 11:25:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301031125.59596.netfilter@newkirk.us>
References: <2762500A-1F16-11D7-97EA-000393950CC2@karlsbakk.net>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2762500A-1F16-11D7-97EA-000393950CC2@karlsbakk.net>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: JUSTIN GERRY <JGERRY@butchers.com>, netfilter@lists.netfilter.org

On Friday 03 January 2003 07:23 am, Roy Sigurd Karlsbakk wrote:
> > If you trust that nothing on the box is or ever will connect that
> > you don't want to, then output chain can just have an ACCEPT policy.
> >  If you
> > want to lock down to make it harder for a trojan or such to
> > communicate back from the box, you can set a DROP policy, then:
> >
> > iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> just remember to allow incoming ICMP. Please? ICMP _is_ an integral
> part of IP, and shouldn't be blocked out!

The RELATED state does just this.  If you allow absolutely nothing in but=
=20
tcp 80 and established, and absolutely nothing out but established, only=20
the port 80 request and reply will get through.  If you also allow=20
related out then so long as an 'established' connection exists then=20
supplementary connections are accepted as well, like ICMP fragmentation=20
control stuff.  The only /initial/ connection allowed in this=20
mini-scenario is to destination port 80 with TCP, but once that=20
connection is flowing then the server would be allowed to send related=20
packets to the same client, even other ports or protocols, and they will=20
get through regardless of whether they are explicitly accepted or=20
explicitly dropped by the firewall.  That is the basic purpose of the=20
RELATED state.  It's extended with helpers too consider things like FTP=20
data to be related to FTP control, and the NAT functions are extended as=20
well, but the whole idea of RELATED is to let through stuff that is,=20
well, related.

j


