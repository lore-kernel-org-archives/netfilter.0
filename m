From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: RE: ftp and ssl
Date: Wed, 5 Nov 2003 10:37:06 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0311051032570.8166@dns.toxicfilms.tv>
References: <33da01c3a34d$84fe6660$2288e7c0@promed.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <33da01c3a34d$84fe6660$2288e7c0@promed.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Stuart J. Browne" <stuart@promed.com.au>
Cc: netfilter@lists.netfilter.org

> Isn't 443 SSL over HTTP? :)
You can use SSL over anything.
telnet over SSL is called ssh.

> 	SSL FTP client (does anybody use this?)
Sure, some people use this. (Not me, yet) It works like ftp or http -
requires to exchange an x.509 certificate and then goes on with an encrypted
conenction.

> I beleive has the services entry of 'sftp' and is port 115.  I've not
> seen a production implementation of this though.
I have not been using that ssl ftp, but I am sure it is not sftp, nor
OpenSSH related.

> If using the later however, given that the channel will be encrypted, I
> don't see how this conntrack would work at all.
If ftp-control is encrypted too, connection tracking is impossible.
And doing rewriting over nat even more impossible.

Regards,
Maciej


