From: Marcin Kaminski <maxiu@man.poznan.pl>
Subject: RE: ftp and ssl
Date: Wed, 5 Nov 2003 11:10:03 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44.0311051052530.22263-100000@rose.man.poznan.pl>
References: <Pine.LNX.4.51.0311051032570.8166@dns.toxicfilms.tv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0311051032570.8166@dns.toxicfilms.tv>
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
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: "Stuart J. Browne" <stuart@promed.com.au>, netfilter@lists.netfilter.org

On Wed, 5 Nov 2003, Maciej Soltysiak wrote:

> > Isn't 443 SSL over HTTP? :)
> You can use SSL over anything.

Not quite, You can use almost anything over SSL rather than reverse.

> telnet over SSL is called ssh.

No, it is not. SSH is also based on SSL but it is not just telnet over
SSL. Telnet over SSL is telnet over SSL.

> > 	SSL FTP client (does anybody use this?)
> Sure, some people use this. (Not me, yet) It works like ftp or http -
> requires to exchange an x.509 certificate and then goes on with an encrypted
> conenction.

And It can be used to encrypt only control stream, or both data and
control streams.

> I have not been using that ssl ftp, but I am sure it is not sftp, nor
> OpenSSH related.

And You are right :) I use 'lftp' client to connect to SSL protected FTP.

> > If using the later however, given that the channel will be encrypted, I
> > don't see how this conntrack would work at all.
> If ftp-control is encrypted too, connection tracking is impossible.
> And doing rewriting over nat even more impossible.

I'm not sure if one can encrypt only ftp-data. In 'lftp' configuration
there is option to optionally encrypt ftp-data and ftp-control is
encrypted always when using SSL.

Latest draft about the topic is in:
http://www.ietf.org/internet-drafts/draft-murray-auth-ftp-ssl-12.txt

Regards


