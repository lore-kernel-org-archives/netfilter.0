From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: RE: ftp and ssl
Date: Wed, 5 Nov 2003 11:41:39 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0311051135020.10772@dns.toxicfilms.tv>
References: <Pine.GSO.4.44.0311051052530.22263-100000@rose.man.poznan.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.44.0311051052530.22263-100000@rose.man.poznan.pl>
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
To: Marcin Kaminski <maxiu@man.poznan.pl>
Cc: "Stuart J. Browne" <stuart@promed.com.au>, netfilter@lists.netfilter.org

> > You can use SSL over anything.
>
> Not quite, You can use almost anything over SSL rather than reverse.
You got me there.

> > telnet over SSL is called ssh.
>
> No, it is not. SSH is also based on SSL but it is not just telnet over
> SSL. Telnet over SSL is telnet over SSL.
Ok, that simplifaction was to far going.

> > Sure, some people use this. (Not me, yet) It works like ftp or http -
> > requires to exchange an x.509 certificate and then goes on with an encrypted
> > conenction.
>
> And It can be used to encrypt only control stream, or both data and
> control streams.
So connection tracking is out of the question. However, the router could
act as a 'man in the middle' ssl proxy, and then it could decrypt
ftp-control and track these connections. Is there any software that
actually does that to aid netfilter?

> Latest draft about the topic is in:
> http://www.ietf.org/internet-drafts/draft-murray-auth-ftp-ssl-12.txt
So it's still a draft, no wonder I never got to reading that :)

> Regards
Regards,
Maciej

