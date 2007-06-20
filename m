From: "pankaj jain" <jainp1979@gmail.com>
Subject: Re: ebtables v/s arptables
Date: Wed, 20 Jun 2007 16:56:12 +0530
Message-ID: <d41814cf0706200426n3a78297elf53733b29791e261@mail.gmail.com>
References: <d41814cf0706130120x5609dfc2o285a07ceda1ba21b@mail.gmail.com>
	<1181755998.2976.1.camel@localhost.localdomain>
	<d41814cf0706140125i52cef5a6u6e73ab3395290e35@mail.gmail.com>
	<1181837804.2972.16.camel@localhost.localdomain>
	<d41814cf0706142221u735ff9a8v1b1debf802c3f400@mail.gmail.com>
	<Pine.LNX.4.64.0706150833230.27797@fbirervta.pbzchgretzou.qr>
	<d41814cf0706142341m427b0c56p6ade6d2f3925cd15@mail.gmail.com>
	<Pine.LNX.4.64.0706150855530.27797@fbirervta.pbzchgretzou.qr>
	<d41814cf0706180517v58e4aa98r687e6ee957524c25@mail.gmail.com>
	<4678C3F1.5000804@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=IxnZaH35PsB0s4JO1DdcphNrF+7CDm7dZb5/Mw2T1Bx+ocbkbnT/XjjgYTu//pSGC63Lw86UzsKv3HWjfs+2D6s3mNEGx4eAdSagXUJ3xQ7B+NNJJwdGLxc6I9dys8vQsM8q2dquNjNa3fZHQnKTglRl9DuvDbJgpcZTI7NABPc=
In-Reply-To: <4678C3F1.5000804@plouf.fr.eu.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

On 6/20/07, Pascal Hambourg <pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> You should consider posting your questions in the netfilter user list
> rather than the netfilter developper list because they are user related
> rather than developper related.
>
> pankaj jain a =E9crit :
> >
> > As I was using arptables for responding arp-requests, I did not plumb
> > the interfaces on my machine.
>
> "Plumb" ? What do you mean ?
>
> > Now I want to add a gateway from the same subnet, for example:
> > I am sending arp responses for 203.200.192.24 (sorry if some one has
> > this IP) using arp tables so I have not plumbed this IP on my
> > interface
>
> Again, what do you mean by "plumb" ?
>
> > Now I want to add a gateway e.g. 203.200.192.1 in the route table
> > "ip route add default via  203.200.192.1 dev eth0 table 10"
> > but when I try this it says
> > RTNETLINK answers: Network is unreachable
>
> You got this error from the route command because a gateway must be
> directly reachable on an interface but there is no direct route to the
> 203.200.192.1 via eth0 in the routing table.
>
> However I do not understand why you want to use an address that does not
> exist as a gateway. Could you explain your goal ?
>
> (You may reply by posting a message on the netfilter user list)
>

Hi
Plumbing means I did not assign the IP 203.200.192.24 to any of my
interfaces, instead I was using arptables to respond the arp requests
for this IP.
The gateway exists on the same subnet but because I did not assign the
IP to any of my interfaces, ip route rejects the gateway add command.
but now I understood that first I had to add the network route for that gat=
eway.
I added the network route to the table 10 but it did not work
I had to add the same route to the main table also to make it work :).

why do I have to add the network route in the main table also ?

The command used are:

TRY - 1
ip route add default via  203.200.192.1 dev eth0 table 10  (did not work)
RESULT -> RTNETLINK answers: Network is unreachable

TRY - 2
ip route add 203.200.192.0/24 dev eth0 table 10
ip route add default via  203.200.192.1 dev eth0 table 10
RESULT -> RTNETLINK answers: Network is unreachable

TRY - 3
ip route add 203.200.192.0/24 dev eth0
ip route add default via  203.200.192.1 dev eth0 table 10
RESULT -> success

does network route of individual tables does not have any effect ??
--=20
Thanks
Pankaj Jain

