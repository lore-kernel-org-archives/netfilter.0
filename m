From: "Andrej Ricnik" <lemmetink@hotmail.com>
Subject: Re: Squid behind iptables
Date: Mon, 03 Mar 2003 03:19:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F1002TUSzbAUfKRfcjc00027a71@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>..'service squid stop', if you do _not_ want to use it.
andrej@diggn:~$ man service
No manual entry for service
andrej@diggn:~# which service
which: no service in 
(/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/usr/games:/opt/www/htdig/bin:/usr/java/bin:/usr/java/jre/bin:/opt/kde/bin:/usr/local/pgsql/bin:/usr/lib/qt-3.0.6/bin:/opt/sgml/bin:/usr/share/texmf/bin)

Hummmm ... what is that> :)


>But why???
>Most people _want_ to use it, and the easiest way on your end users
>is set it up as a "transplarent proxy", search squid docs for that.
I do, however, agree that having a proxy that doesn't pass
cached pages on is a bit of an odd idea :}


Cheers,
Tink

-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCM/IT/O d-(++)@ a C+(+++)@ UL++>+++ P+>+++ L++ E+@ W+@ N+ o? K? w---@(+) 
O+++(+)@ M-@ V? PS+ PE- Y+ PGP++ t- 5- X- R-(*) tv-@ b+ DI++ D-- G++ !e* 
h--- r++ z?
------END GEEK CODE BLOCK------



_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE* 
http://join.msn.com/?page=features/junkmail


