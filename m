From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Fwd: IPTables stops logging after long uptime
Date: Tue, 11 Feb 2003 16:05:46 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302111605.46803.Alistair@nerdnet.ca>
References: <Pine.LNX.4.30.0302110014290.25887-100000@king.klan.gda.pl>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.30.0302110014290.25887-100000@king.klan.gda.pl>
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
To: Tomasz Wrona <tw@eter.tym.pl>, Fabrice MARIE <fabrice@netfilter.org>
Cc: netfilter@lists.netfilter.org

On February 10, 2003 06:20 pm, Tomasz Wrona wrote:
> On Sun, 9 Feb 2003, Fabrice MARIE wrote:
> > Anybody had this problem ?
> >
> > [I don't have this problem since my
> > uptime is never that long..]
>
> I have the same behaviour...
> I looked at logs after I read this mail. Uptime of my system is 84 days
> and I do not see any syslog firewall entries in my oldest rotated logs...
> so it happened a lot time ago.. [Also I have simmilar problem with crontab
> which pauses logging after few days..]
>
> 2.4.19-grsec; iptables v1.2.7a

	I too had a problem with Iptables logs vanishing after 
	a while.
	I found it was entirely due to a misconfiguration of syslog, 
	in which when the log files were rolled, the restart of syslogd
	started it with the wrong settings, resulting in the messages from 
	iptables >/dev/null as they were of insufficient priority.
	
	It was sufficiently mysterious to me at the time to seem magical..
	*grin*

	Alistair

	FYI it was on Slackware 7.1, iptables 1.2.5ish setup ...

