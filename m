From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: POM Xtables???
Date: Fri, 27 Jun 2008 20:58:26 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806272003170.12725@fbirervta.pbzchgretzou.qr>
References: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <935fab200806271054oa7c340evbf465b7a9984498b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave <finalglide@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-06-27 19:54, Dave wrote:

>Hi there guys, I'm a bit frustrated with the whole Patch-O-Matic thing.
>
>Something seems very weird with this whole thing, when I read the
>message boards, I keep seeing references that state POM is outdated
>and to use something called Xtables, but I have no idea what that is.
>
>1)  When I go to Netfilter.com, I see the POM on the left side,
>however I don't see anything about Xtables.
>2)  When I read the Netfilter extentions how-to, it shows how to use
>POM but mentions nothing about Xtables.
>3)  When I go to the FTP and GIT sites, I see no references to
>Xtables, only POM.
>
>Yet, reading the message boards we should be using this Xtables, yet
>there is no way to download it and there seems to be no documentation
>on it.
>
>Am I missing something here?
>
>I guess what i'm looking for is.
>
>1) Is there any way to download this Xtables?

http://freshmeat.net/projects/xtables-addons/
http://jengelh.medozas.de/projects/xtables-addons/

>2) Is there any documentation on how to use it?

The package provides a few more modules; when installed, you use like
it you always use iptables. There is a bit of a README and an INSTALL
file in the tarball; after being built, the xtables-addons.8 manpage
is assembled and can be viewed with `man -l xtables-addons.8` (or the
normal `man xtables-addons` when installed) that explains the new
modules much like the iptables.8 manpage.

./configure && make && make install  itself does not need much 
documentation, but the modules have more documentation than 
they did in pom.

Improvements or suggestions are always welcome.


>3) Can we get a clarification on the main Netfilter site on these things?
>4) If we are not to use POM, then why is it still listed on the site
>in the main projects list.
>
>Very confused here.

I am not representing Netfilter.org, but as the author/maintainer, this 
is the state of affairs (also copied to website now):

* pom was designed to patch and recompile kernel (you like spending
  two hours on that? and then you notice a problem with the patch...)
* multiarch and endianess issues often ignored, making the modules
  not work on x86_64, much less on sparc64.
* some security issues - error handling was missing sometimes that
  could lead to an oops
* code was generally unreviewed
* pom modules have not received any real updates in months
* and from a purely maintenance pov: pom modules replicated the
  glue to work with multiple kernels in their files...

* xtables-addons conveniently builds modules to an existing kernel,
  saving packagers, users and developers a lot of time
(there is also an easy --but unimplemented-- way to patch a kernel if 
you want to have it built-in)
* code that has been imported from pom got the necessary fixups wrt.
  multiarch, endianess and everything that looked like a blatant
  violation of something
* speed improvements (e.g. in geoip)
* and it makes maintenance a lot easier
