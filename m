From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: TCP delay, solved
Date: Wed, 12 Jun 2002 09:33:53 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <0fbe01c2122e$f0783300$2901a8c0@amos>
References: <20020612154553.GI10747@hack.home.theunixman.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020612154553.GI10747@hack.home.theunixman.com>
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
To: netfilter@lists.samba.org


Well you learn something new every day. Today I learned inetd does ident
checks on it's clients. This is annoying, is there a way you can turn
this off inside inetd?

So I added a rule to return the port-unreachable error and everything
now works hunky dory. Thanks everyone for your help.

iptables -A INPUT -p tcp --dport 113 -j REJECT --reject-with tcp-reset

-----Original Message-----
From: Evan Cofsky [mailto:unix@theunixman.com] 
Sent: Wednesday, June 12, 2002 8:46 AM
To: Nathan Cassano
Cc: netfilter@lists.samba.org
Subject: Re: TCP delay


It really sounds like ident lookups.  Telnet is typically started by
tcpwrappers (tcpd), and Sendmail (I don't know about other MTAs)
typically does ident lookups.  If you're not running the identd, or
having it start through inetd, but are still DROPping inbound packets
to the SMTP client machine, the SMTP server will never receive the
normal "connection refused" messages from the kernel, but will have to
wait for it to time out.


