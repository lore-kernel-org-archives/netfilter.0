From: fender <frozenspot@gmail.com>
Subject: Re: SSHBrute Force: False Postives
Date: Mon, 12 Feb 2007 10:10:28 -0300
Message-ID: <7e36c7130702120510t4fb85009l64bf64ed1caeddc0@mail.gmail.com>
References: <02a601c745a8$9f7e1110$2904b00a@au.schpac.local>
	<7e36c7130702010832s7523c8a5vfaedca18e15f026a@mail.gmail.com>
	<Pine.LNX.4.64.0702061552320.3777@darkstar.sysinfo.com>
	<20070207020141.GA6726@minastirith>
	<7e36c7130702071917t7b07bb57na349c866aa80d872@mail.gmail.com>
	<20070209001712.GB9357@minastirith>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070209001712.GB9357@minastirith>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 2/8/07, Michael Rash <mbr@cipherdyne.org> wrote:
> On Feb 08, 2007, fender wrote:
>
> > On 2/6/07, Michael Rash <mbr@cipherdyne.org> wrote:
> > >On Feb 06, 2007, R. DuFresne wrote:
> > >
> > >> -----BEGIN PGP SIGNED MESSAGE-----
> > >> Hash: SHA1
> > >>
> > >> On Thu, 1 Feb 2007, fender wrote:
> > >>
> > >> >On 1/31/07, Dominic Caputo <jec6jec6@gmail.com> wrote:
> > >> >>I have been reading up on iptables and i am by no means an expert but i
> > >> >>have
> > >> >>a problem with SSH brute force attacks on port 22. I am currently using
> > >> >>the
> > >> >>config below to minimise these threats but i am constantly getting
> > >false
> > >> >>positives (logs actually say that my connection has been flagged as a
> > >> >>brute
> > >> >>force connection even on the on the first attempt-but then on others it
> > >> >>connects first time with no problems)
> > >> >>
> > >> >>#SSH Brute-Force Scan Check
> > >> >>$IPTABLES -N SSH_Brute_Force
> > >> >>$IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -m recent
> > >--name
> > >> >>SSH --set --rsource -j SSH_Brute_Force
> > >> >>$IPTABLES -A SSH_Brute_Force -m recent ! --rcheck --seconds 60
> > >--hitcount
> > >> >>4 --name SSH --rsource -j ACCEPT
> > >> >>$IPTABLES -A SSH_Brute_Force -j LOG --log-level info --log-prefix "SSH
> > >> >>Brute
> > >> >>Force Attempt:  "
> > >> >>$IPTABLES -A SSH_Brute_Force -p tcp -j DROP
> > >> >>
> > >> >>Any help with this problem would be great
> > >> >
> > >> >
> > >> >About the problem with ssh brute force attacks, you can use portknocking
> > >> >[1]. There are several portknocking projects, but you can use
> > >> >portknocko project [2]. This is a netfilter module that implements
> > >> >portknocking in an easy way. This module works in kernel 2.6.15, for
> > >> >now. It will work in newer versions soon. We need more feedback about
> > >> >this project.
> > >> >
> > >> >We will be thankful for your comments.
> > >> >
> > >> >
> > >> >[1] http://www.portknocking.org
> > >> >[2] http://portknocko.berlios.de
> > >> >
> > >> >--
> > >> >Federico
> > >> >
> > >>
> > >> portknocking is merely security through obscurity, is it not?
> > >>
> > >> especially so with modules that reside with preset defaults...
> > >
> > >Section 4.1 of the following document provides a good argument for why
> > >port knocking is not security through obscurity:
> > >
> > >http://web.mac.com/s.j/iWeb/Security/Port%20Knocking%20and%20Single%20Packet%20Authorization/Port%20Knocking%20and%20Single%20Packet%20Authorization_files/An%20Analysis%20of%20Port%20Knocking%20and%20Single%20Packet%20Authorization%20%28Sebastien%20J.%20-%20ISG%202006%29_1.pdf
> > >
> > >(Sorry for the length of that URL).
> > >
> > >This argument applies equally well to single packet authorization, and
> > >combine this with other security properties of SPA that are much more
> > >robust that port knocking implementations; SPA is the way to go.  In
> > >summary, these properties are:
> > >
> > >- SPA does not suffer from the replay problem.
> > >- SPA supports much more data communication (so things like asymmetric
> > >  encryption algorithms can be supported).
> > >- SPA cannot be trivially broken just by spoofing a duplicate packet
> > >  into the port sequence.
> > >- SPA does not look like a port scan to any intermediate IDS.
> > >
> >
> > The portknocko project implements both security techniques:
> > portknocking and "SPA". In our opinion, SPA is a portknocking variant,
> > that is why
> > we don't make a difference between them.
>

[snip]

> Technically, port knocking refers to the transmission of
> authentication information within packet headers instead of application
> layer data (at least if you agree with the definition given to port
> knocking by the person who coined the term, Martin Krzywinski).

Portknocko project implements SPA within UDP header.

> > Usage [1]:
> >
> >
> > # iptables -P INPUT DROP
> > # iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> >
> >
> > 1) "the simplest way": one rule portknocking:
> >
> >
> > # iptables -A INPUT -p tcp -m state --state NEW
> >            -m pknock --knockports 2002,2001,2004 --name SSH
> >            -m tcp --dport 22 -j ACCEPT
> >
> >
> > 2) or "the secure way" (or "SPA"): hmac auth with two iptables rules:
> >
> >
> > # iptables -A INPUT -p udp -m state --state NEW
> >            -m pknock --knockports 2000 --name SSH
> >            --opensecret your_opensecret --closesecret your_closesecret -j
> >            DROP
> >
> > # iptables -A INPUT -p tcp -m state --state NEW
> >            -m pknock --checkip --name SSH -m tcp --dport 22 -j ACCEPT
> >
> >
> > That's all, without daemons and without configuration files. Just
> > iptables to configure your firewall rules ;)
>
> That's cool.  It is also worth noting however that there are some
> advantages to having a userspace daemon over an in-kernel
> implementation:
>
> - The best encryption algorithms (and implementations of those algorithms)
>   can be supported; both asymmetric and symmetric (fwknop supports GnuPG
>   and Rijndael).

IMHO this is not an adventage in favor of user space applications.
You talk about a good but complicated solution to ssh brute force
attacks. It needs of a daemon, configuration files and a new syntax.

We give a simple and secure solution in kernel space. Also it allows
you to configure your firewall through iptables rules. This is an
adventage over all port knocking user space applications.

> - Additional authentication requirements can be met, such as
>   communicating with an LDAP server or even just checking if the remote
>   user possesses a valid crypt() password (fwknop supports crypt()
>   checking now, and more checks are being developed).

That's great. But IMHO this is not important when I only want to hide
a public service (such as ssh, ftp, etc) behind a security fence to
avoid brute force attacks.

> - Timeout-based ACCEPT rules can be managed by the userspace daemon.
>   Fwknop uses a dedicated chain for all rules that it creates/destroys,
>   and it uses a single well defined interface to create and destroy
>   those rules.

So, you must install a daemon, and you must learn a new interface to
create iptables rules. Besides, the daemon creates iptables rules on
the fly for me. This is just what we wanted to avoid.

> - The client can dictate complex access requirements to the server, and
>   the server can filter these requirements with granular precision.
>   Once strong encryption is used and non-replayability is ensured,
>   nothing prohibits even a full command channel over SPA.

Our SPA implementation is non-replayable too.
The pknock module (portknocko project) allows you to send a message to
user space through netlink sockets.

Regards,

-- 
Federico

