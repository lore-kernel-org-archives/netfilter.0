From: Michael Gale <mgale@utilitran.com>
Subject: Re: Hello -- kind of of topic -- but still related
Date: Wed, 3 Dec 2003 17:36:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203173641.47118b92.mgale@utilitran.com>
References: <20031203151030.31eaeacd.mgale@utilitran.com>
	<200312032336.14650.Antony@Soft-Solutions.co.uk>
	<20031203171805.475ec7af.mgale@utilitran.com>
	<200312040027.46440.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312040027.46440.Antony@Soft-Solutions.co.uk>
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

Hello,

	I can turn off the tcpwrapper but I was hoping there would be away around it.

ftp     stream  tcp     nowait  root    /usr/sbin/tcpd  proftpd

It is a largely used FTP server and I have been contemplating running it as a stand alone daemon.

Michael.


On Thu, 4 Dec 2003 00:27:46 +0000
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Thursday 04 December 2003 12:18 am, Michael Gale wrote:
> 
> > Ok -- as I look into the Cisco router issue .. is there any way to make it
> > so when a ftp connection comes in and Inetd using tcpwrappers to pass the
> > connection to my FTP server that NO Ident lookups are done :)
> 
> Sure - simply remove the "tcpd" bit of the entry in /etc/inetd.conf and just 
> point to the ftpd daemon itself.
> 
> If you're not sure what to do, post the line from /etc/inetd.conf which begins 
> with "ftp" and we'll try to help.
> 
> Antony.
> 
> -- 
> Anyone that's normal doesn't really achieve much.
> 
>  - Mark Blair, Australian rocket engineer
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

