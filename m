From: "hare ram" <hareram@sol.net.in>
Subject: Re: how to block kazaa ?
Date: Wed, 26 Feb 2003 12:51:56 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006501c2dd67$becef780$13fcc5cb@Housecall>
References: <Pine.LNX.4.43.0302261032380.375-100000@debian.lan.deeproot.co.in>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Nimit Gupta <nimit@deeproot.co.in>
Cc: netfilter@lists.netfilter.org

Hi

there is no such tool for specifically for kazaa
but you can add up string module from POM

check netfilter.org... extensions how to
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO.htm
l

hare
----- Original Message -----
From: "Nimit Gupta" <nimit@deeproot.co.in>
To: "Joel Newkirk" <netfilter@newkirk.us>
Cc: <inghau@perkom.co.id>; <netfilter@lists.netfilter.org>
Sent: Wednesday, February 26, 2003 10:37 AM
Subject: Re: how to block kazaa ?


>
> hello,
> Just going thru the thread so that i could learn form others
> problem. One thing I could not understand is, how to custom compile a
> kazaa-blocking kernel?
>
> >
> > But newer implementations apparently support port-hopping, so it seems
> > that the only confirmed way to stop it with iptables is with the STRING
> > match from patch-o-matic, and block anything with the string "kazaa"
> > (don't recall case requirements) in it.  Compiling a custom
> > kazaa-blocking kernel may be more than you want to do, though.
> >
>
> Thanks a lot.
>
> with regards,
> Nimit.
>
>
>


