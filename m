From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: REDIRECT to localhost
Date: Wed, 18 Aug 2004 08:37:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC905129F@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

> > As I know, REDIRECT target redirects to the same iface, but on =
another port.
>
> Nope.
> REDIRECT target redirects to lo interface, on the port you want.

hmmm...i'm not so sure i agree with that.  my belief is that REDIRECT =
redirects to the IP address of the receiving interface of the netfilter =
machine on the specified port.

i do transparent proxying w/ REDIRECT and squid, and i see all the =
redirected connections on the IP of the internal interface, not on lo or =
127.0.0.1.

i actually just recently learned here that packets arriving on lo that =
don't have a source and dest of 127.0.0.1 get dropped by the linux =
kernel's "martian" code (thanks for pointing that out to me)--so i don't =
see how a redirect of this nature could work.

-j

