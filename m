From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Hello -- kind of of topic -- but still related
Date: Thu, 4 Dec 2003 00:48:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312040048.07123.Antony@Soft-Solutions.co.uk>
References: <20031203151030.31eaeacd.mgale@utilitran.com> <200312040027.46440.Antony@Soft-Solutions.co.uk> <20031203173641.47118b92.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031203173641.47118b92.mgale@utilitran.com>
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

On Thursday 04 December 2003 12:36 am, Michael Gale wrote:

> Hello,
>
> 	I can turn off the tcpwrapper but I was hoping there would be away around
> it.
>
> ftp     stream  tcp     nowait  root    /usr/sbin/tcpd  proftpd
>
> It is a largely used FTP server and I have been contemplating running it as
> a stand alone daemon.

For a busy server this could be an excellent solution - and you should find 
how to do it in "man proftpd" and/or "man /etc/proftpd.conf".   It can 
definitely be run as a standalone daemon without using inetd.

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


