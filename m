From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I still have no idea why this doesn't work...(further  details)
Date: Sun, 25 Apr 2004 09:28:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404250928.47760.Antony@Soft-Solutions.co.uk>
References: <web-294871830@mail01.infosat.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <web-294871830@mail01.infosat.net>
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

On Sunday 25 April 2004 7:59 am, IT Clown wrote:

> have you tried: modprobe ip_nat_ftp

Why would he need ip_nat_ftp with rules in the INPUT chain?   There's no nat 
going on.

However, you have raised the question of whether he has compiled in or loaded 
as a module ip_conntrack_ftp support?   That would be needed in this 
situation.

Regards,

Antony.

> On Sat, 24 Apr 2004 18:53:43 -1000
>
>  Garison Piatt <todo@garisonpiatt.com> wrote:
>
> >    i Control connection successfully established.
> >    < 220 ProFTPD FTP Server ready.
> >    i Time zone of server could not be determined.
> >    > USER admin
> >    < 331 Password required for admin.
> >    > PASS <password>
> >    < 230 User admin logged in.
> >    > SYST
> >    < 215 UNIX Type: L8
> >    > PWD
> >    < 257 "/home/admin" is current directory.
> >    > PASV
> >    < 227 Entering Passive Mode (207,36,232,90,132,36).
> >    i Data connection A8 could not be established (10060).
> > followed by a notice that the connection timed out.

-- 
Late in 1972 President Richard Nixon announced that the rate of increase of 
inflation was decreasing.   This was the first time a sitting president used 
a third derivative to advance his case for re-election.

 - Hugo Rossi, Notices of the American Mathematical Society

                                                     Please reply to the list;
                                                           please don't CC me.


