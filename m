From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Allow active and passive FTP connections
Date: Tue, 22 Jun 2004 10:16:52 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406221011350.2546-100000@blackhole.kfki.hu>
References: <20040622031015.82208.qmail@web14712.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040622031015.82208.qmail@web14712.mail.yahoo.com>
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
To: Sagara Wijetunga <sagaralists@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Mon, 21 Jun 2004, Sagara Wijetunga wrote:

> --- "Piszcz, Justin Michael"
> <justin.piszcz@mitretek.org> wrote:
> > If you find one (that works with TLS/SSL), please
> > let me know :)
> > Sorry I have not seen one as of yet.
> >
> I wonder is it an issue with the conntrack module or
> the FTP server. May be Jozsef Kadlecsik could shed
> some light on this.

The FTP server encrypts the command channel, so the kernel cannot figure
out on which port will the server (passive) or client (active) listen for
the data channel.

> If the FTP server side has to be fixed, I could take
> it up with the FTP server folks.

Currently there is no solution. When nfnetlink-ctnetlink is completed,
the FTP server could be patched to notify the kernel on the data ports it
wants to open or connect to, which would solve the problem.

As an alternative, you could use sftp instead.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


