From: "James A. Pattie" <james@pcxperience.com>
Subject: Re: Core Linux Router - NO NAT
Date: Fri, 21 Mar 2003 09:19:38 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E7B2D8A.8010705@pcxperience.com>
References: <200303201723.50161.marks@crvinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303201723.50161.marks@crvinc.com>
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
To: Mark Seamans <marks@crvinc.com>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mark Seamans wrote:
> I have a Linux router that consists of 4 T1ports and 1 ethernet.
> This "Router" will act as an ISP core router doing Routing Only!
> I wish to protect the box itself, while it preforms it's duties as a
Router
> allowing only ssh from the ip's that I wish for management.  This way
I can
> also setup rules to protect it form DOS attacks etc...
> Now I have been thinking of this, but I can go two ways:
> 1.  Making it harder than it really is  -OR-
> 2.  Allowing it to be so easy it is not secure.
>
> So any suggestions would be great.

Newer versions of ssh will honor the hosts.allow and hosts.deny files,
so you might want to make sure that hosts.allow only lets sshd
connections from the IP's you are interested in.  Just make sure you do
a ALL : ALL in hosts.deny so that no other services can get to the box
that you haven't allowed in hosts.allow.

Note:  there are services that don't use the hosts.allow/deny files
(apache for example) so you need to make sure you don't have anything
uneeded running.

You could do this without needing to setup firewall rules, but then it
becomes harder to limit DOS attacks, etc.


- --
James A. Pattie
james@pcxperience.com

Linux  --  SysAdmin / Programmer
Xperience, Inc.
http://www.pcxperience.com/
http://www.xperienceinc.com/

GPG Key Available at http://www.pcxperience.com/gpgkeys/james.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE+ey2KtUXjwPIRLVERAiQAAJ9QL0671K+msi/BdVwL+pS2UmQXRACg2w28
MJVVHt8CEYPu1h3boVkvjpI=
=RgM/
-----END PGP SIGNATURE-----


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.


