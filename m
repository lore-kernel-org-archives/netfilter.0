From: =?iso-8859-1?Q?Andr=E9?= Valente <a.valente@netcabo.pt>
Subject: Re: Messages to console
Date: Tue, 19 Aug 2003 11:58:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030819105849.GA30971@andrev.homeip.net>
References: <12CC60849165134FB7DF8570B621F4D558B079@mailxserver.euler.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <12CC60849165134FB7DF8570B621F4D558B079@mailxserver.euler.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi,

I also had that problem.
i fixed it adding this to the crontab (executing hourly)
/bin/dmesg -n 1

If anyone has a better solution, I would also apreciate.

I don't know if this is a iptables, syslog or other bug.

Thanks
A.V.


On Mon, Aug 18, 2003 at 05:29:13PM -0500, Len L. wrote:
> Hey guys,
>  
> Not a killer, but I get all the iptable log messages to /dev/console.  I can not find where to control this.  I checked /etc/syslog.conf, but kernal messages was turned off (in fact if I turn kernal logging on I get duplicate messages to the console).  I also did man on iptables, but I do not see any reference to logging to /dev/console 
>  
> Can anyone point me in the right direction?

