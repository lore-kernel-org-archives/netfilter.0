From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: SSHBrute Force: False Postives
Date: Tue, 06 Feb 2007 21:01:41 -0500
Message-ID: <20070207020141.GA6726@minastirith>
References: <02a601c745a8$9f7e1110$2904b00a@au.schpac.local>
	<7e36c7130702010832s7523c8a5vfaedca18e15f026a@mail.gmail.com>
	<Pine.LNX.4.64.0702061552320.3777@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <Pine.LNX.4.64.0702061552320.3777@darkstar.sysinfo.com>
Content-disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Feb 06, 2007, R. DuFresne wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On Thu, 1 Feb 2007, fender wrote:
> 
> >On 1/31/07, Dominic Caputo <jec6jec6@gmail.com> wrote:
> >>I have been reading up on iptables and i am by no means an expert but i 
> >>have
> >>a problem with SSH brute force attacks on port 22. I am currently using 
> >>the
> >>config below to minimise these threats but i am constantly getting false
> >>positives (logs actually say that my connection has been flagged as a 
> >>brute
> >>force connection even on the on the first attempt-but then on others it
> >>connects first time with no problems)
> >>
> >>#SSH Brute-Force Scan Check
> >>$IPTABLES -N SSH_Brute_Force
> >>$IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name
> >>SSH --set --rsource -j SSH_Brute_Force
> >>$IPTABLES -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount
> >>4 --name SSH --rsource -j ACCEPT
> >>$IPTABLES -A SSH_Brute_Force -j LOG --log-level info --log-prefix "SSH 
> >>Brute
> >>Force Attempt:  "
> >>$IPTABLES -A SSH_Brute_Force -p tcp -j DROP
> >>
> >>Any help with this problem would be great
> >
> >
> >About the problem with ssh brute force attacks, you can use portknocking
> >[1]. There are several portknocking projects, but you can use
> >portknocko project [2]. This is a netfilter module that implements
> >portknocking in an easy way. This module works in kernel 2.6.15, for
> >now. It will work in newer versions soon. We need more feedback about
> >this project.
> >
> >We will be thankful for your comments.
> >
> >
> >[1] http://www.portknocking.org
> >[2] http://portknocko.berlios.de
> >
> >--
> >Federico
> >
> 
> portknocking is merely security through obscurity, is it not?
> 
> especially so with modules that reside with preset defaults...

Section 4.1 of the following document provides a good argument for why
port knocking is not security through obscurity:

http://web.mac.com/s.j/iWeb/Security/Port%20Knocking%20and%20Single%20Packet%20Authorization/Port%20Knocking%20and%20Single%20Packet%20Authorization_files/An%20Analysis%20of%20Port%20Knocking%20and%20Single%20Packet%20Authorization%20%28Sebastien%20J.%20-%20ISG%202006%29_1.pdf

(Sorry for the length of that URL).

This argument applies equally well to single packet authorization, and
combine this with other security properties of SPA that are much more
robust that port knocking implementations; SPA is the way to go.  In
summary, these properties are:

- SPA does not suffer from the replay problem.
- SPA supports much more data communication (so things like asymmetric
  encryption algorithms can be supported).
- SPA cannot be trivially broken just by spoofing a duplicate packet
  into the port sequence.
- SPA does not look like a port scan to any intermediate IDS.

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F



> Thanks,
> 
> Ron DuFresne
> - -- 
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>         admin & senior security consultant:  sysinfo.com
>                         http://sysinfo.com
> Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629
> 
> ...We waste time looking for the perfect lover
> instead of creating the perfect love.
> 
>                 -Tom Robbins <Still Life With Woodpecker>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (GNU/Linux)
> 
> iD8DBQFFyOrTst+vzJSwZikRAkjqAJ0TbijLmTG4qZMVl7ZwXQu2cABfLACfRO/0
> B78mFQx8+DCkDi/gY0vHgoo=
> =dZEg
> -----END PGP SIGNATURE-----

