From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Squid behind iptables
Date: Mon, 3 Mar 2003 21:01:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030303210115.6fa0b6c5.arnt@c2i.net>
References: <F1002TUSzbAUfKRfcjc00027a71@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F1002TUSzbAUfKRfcjc00027a71@hotmail.com>
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

On Mon, 03 Mar 2003 03:19:23 +0000, 
"Andrej Ricnik" <lemmetink@hotmail.com> wrote in message 
<F1002TUSzbAUfKRfcjc00027a71@hotmail.com>:

> >..'service squid stop', if you do _not_ want to use it.
> andrej@diggn:~$ man service
> No manual entry for service
> andrej@diggn:~# which service
> which: no service in 
> (/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/X1
> 1R6/bin:/usr/games:/opt/www/htdig/bin:/usr/java/bin:/usr/java/jre/bin
> :/opt/kde/bin:/usr/local/pgsql/bin:/usr/lib/qt-3.0.6/bin:/opt/sgml/bi
> n:/usr/share/texmf/bin)
> 
> Hummmm ... what is that> :)

.. ;-) [root@lana src]# which service  
/sbin/service
[root@lana src]# rpm -qif `which service`
Name        : initscripts                  
Relocations : (not relocateable) 
Version     : 6.95                              
Vendor      :Red Hat, Inc. 
Release     : 1                             
Build Date  : Wed 04 Sep 2002 07:23:35 PM CEST 
Install date: Sun 27 Oct 2002 04:41:56 PM CET      
Build Host  : astest.test.redhat.com 
Group       : System Environment/Base       
Source RPM  : initscripts-6.95-1.src.rpm 
Size        : 2060961                         
License     : GPL 
Signature   : DSA/SHA1, Wed 04 Sep 2002 07:26:54 PM CEST, 
Key ID 219180cddb42a60e 
Packager    : Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla> 
URL         : http://rhlinux.redhat.com/initscripts/
Summary     : The inittab file and the /etc/init.d scripts.
Description : The initscripts package contains the basic system scripts
used to boot your Red Hat system, change runlevels, and shut the system
down cleanly. Initscripts also contains the scripts that activate and
deactivate most network interfaces.
[root@lana src]#

 
> >But why???
> >Most people _want_ to use it, and the easiest way on your end users
> >is set it up as a "transplarent proxy", search squid docs for that.
> I do, however, agree that having a proxy that doesn't pass
> cached pages on is a bit of an odd idea :}
> 
> 
> Cheers,
> Tink
> 
> -----BEGIN GEEK CODE BLOCK-----
> Version: 3.12
> GCM/IT/O d-(++)@ a C+(+++)@ UL++>+++ P+>+++ L++ E+@ W+@ N+ o? K?
> w---@(+) O+++(+)@ M-@ V? PS+ PE- Y+ PGP++ t- 5- X- R-(*) tv-@ b+ DI++
> D-- G++ !e* h--- r++ z?
> ------END GEEK CODE BLOCK------

..eh?   ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



