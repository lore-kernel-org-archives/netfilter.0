From: Andras Kis-Szabo <kisza@securityaudit.hu>
Subject: Re: iptables compile trouble
Date: 06 Jun 2002 00:59:58 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023317998.912.30.camel@hoi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "L.Kremkow" <kremkow@polytomy.org>
Cc: Netfilter <netfilter@lists.samba.org>


Hi,

The
> ip6tables.c:502: `AI_CANONNAME' undeclared (first use in this function)
> ip6tables.c:509: warning: implicit declaration of function `getaddrinfo'
> ip6tables.c:527: warning: implicit declaration of function `freeaddrinfo'
> ip6tables.c:540: `NI_MAXHOST' undeclared (first use in this function)
are definied in the /usr/include/netdb.h, which is included.
These definitions depend on the __USE_POSIX define. (-D__USE_POSIX)

Regards,

	kisza
-- 
    Andras Kis-Szabo       Security Development, Design and Audit
-------------------------/        Zorp, NetFilter and IPv6
 kisza@SecurityAudit.hu /-----Member of the BUTE-MIS-SEARCHlab------>


