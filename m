From: Curtis Call <curtiscall@usa.net>
Subject: Re: [FTP large file problem]
Date: Fri, 18 Jul 2003 07:47:29 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410HgRNvd6128S02.1058536049@uwdvg002.cms.usa.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: Marcel de Boer <marceldb@luon.net>, netfilter@lists.netfilter.org

Are you explicitly allowing fragments through?  When a packet is fragment=
ed
only the first fragment contains the TCP/UDP header.  So if you're only
permitting based on that header the fragments won't make it.

Marcel de Boer <marceldb@luon.net> wrote:
> Hello everybody,
> =

> for my home network I have built a Linux-based firewall (based on the
> slackware-built 2.4.21 kernel). The firewall is working fine, except fo=
r
> large FTP downloads. After 13.68MB (sometimes a bit more, sometimes a b=
it
> less, but most of the time 13.68) the connection just hangs. The contro=
l
> channel is still active, because I can abort the download and start it
> again, but it never gets beyond 14MB.
> =

> I have tried this with multiple servers (ftp.kpn.be and ftp.slackware.n=
o),
> multiple local computers (two Slackware-based, one Debian-based) and
> multiple clients (ncftp and lftp), and the problem returns in all
> situations (even when downloading directly to my firewall machine).
> =

> I strongly suspect the firewall, but I can't imagine what I have done
> wrong (especially because a very similar configuration based on the sam=
e
> framework at my work does not have this problem).
> =

> TIA && Gtnx
> 	Marcel de Boer
> =

> PS. Please also Cc a reply to me, because I am not on the list.
> =

> =

> =





