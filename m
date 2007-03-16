From: "James Shewey" <jdshewey@gmail.com>
Subject: Re: forwarding local ports
Date: Fri, 16 Mar 2007 16:29:44 -0700
Message-ID: <da3a2a260703161629m3daecab4p6b4f05519149832@mail.gmail.com>
References: <2700.4272-9683-164045092-1174070512@seznam.cz>
	<45FAF1B3.2000601@plouf.fr.eu.org>
	<20070316200354.GA10582@galois.math.uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=TB48wU2y8a+GqGp8CwxVxhsnToXc4rRNfjXf8BEy31VDFsJEkdoFgGdFBnklLKalVz4zwBuNhFaSnWMAvi8w9/S+78lPA8Jyo52dTKCEsbeLbuUj/MW8r95sEDh13Jiv4hrTwoKONc81SVMdDQvVrfQuqqzhLqF2Qn8GScVBX8o=
In-Reply-To: <20070316200354.GA10582@galois.math.uni-paderborn.de>
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
To: netfilter@lists.netfilter.org

Also try using -to-destination instead of just -to

On 3/16/07, Maximilian Wilhelm <max@rfc2324.org> wrote:
> Am Friday, den 16. March hub Pascal Hambourg folgendes in die Tasten:
>
> Hi!
>
> > >I want forward local ports to remote server, for example:
> > >for `telnet localhost 80` must answer webserver from remote IP
>
> > The problem, which  has already been discussed in this list, is in
> > kernels 2.6.11 and above. In Changelog-2.6.11 you can read :
> [...]
>
> > For this to work you must use a local address outside 127.0.0.0/8.
>
> Or consider using something different than netfilter for this task,
> e.g. the rinetd daemon (which works only for tcp, but that should fit
> your need in this case.)
>
> >From the debian package description:
>  rinetd redirects TCP connections from one IP address and port to
>  another, with basic IP-based access control.
>
> Ciao
> Max
> --
> |           |                 Follow the white penguin.
> |  |\/|  |  |-----------------------------------------------------------.
> |  |  |/\|  |  Rechnerbetrieb Mathematik  |   Meine Baustellen:  TSM    |
> |           |  Universitaet Paderborn     |   Hostmaster, Linux, LDAP   |
>
>


--=20
On 5/17/6, a spammer known as PharmaMaster (PM) attacked Blue Security (BS)=
.

Using a program called Blue Frog, BS created a distributed network of
over =BD mil users who would automatically send opt out requests to
spammers' clients. This was so effective that PM declared that BS
"found the right solution to stop spam, and I can't let this
continue." PM then DDoSd BS, endangered the net by hacking a major
router on the net's backbone to block BS' webpage and finally attacked
typepad, where BS had just surrendered 30 min earlier. This attack
caused about 2000 servers to go down including typepad and
livejournal.While BS gave up because they felt this would "prevent a
full-scale cyber-war that we just don't have the authority to start"
The community disagreed and started a Blue Frog clone called okopipi
which will prevents DDOS attacks by using decentralization.

With your help we can fight back against PM and his spam mafia. Please
join at okopipi.org and help take back our internet.

