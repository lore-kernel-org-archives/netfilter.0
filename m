From: Frank Smith <fsmith@hoovers.com>
Subject: Re: Messages to console
Date: Mon, 18 Aug 2003 17:45:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <83470000.1061246744@hoovers-59.hoovers.com>
References: <12CC60849165134FB7DF8570B621F4D558B079@mailxserver.euler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <12CC60849165134FB7DF8570B621F4D558B079@mailxserver.euler.com>
Content-Disposition: inline
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
To: "Len L." <len@euler.com>, netfilter@lists.netfilter.org

--On Monday, August 18, 2003 17:29:13 -0500 "Len L." <len@euler.com> wrote:

> Hey guys,
>  
> Not a killer, but I get all the iptable log messages to /dev/console.  I
> can not find where to control this.  I checked /etc/syslog.conf, but
> kernal messages was turned off (in fact if I turn kernal logging on I
> get duplicate messages to the console).  I also did man on iptables, but
> I do not see any reference to logging to /dev/console 
>  
> Can anyone point me in the right direction?

Look at the klogd '-c' option and add it to whatever starts klogd
on your system (/etc/init.d/klod on Debian). Adjust the number as
appropriate for what you don't want logged to the console.

Frank

-- 
Frank Smith                                      fsmith@hoovers.com
Systems Administrator                           Voice: 512-374-4673
Hoover's Online                                   Fax: 512-374-4501


