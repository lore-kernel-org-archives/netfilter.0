From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: putting all logs in a file
Date: Wed, 10 Sep 2003 09:39:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063208370.4771.30.camel@smoogen1.lanl.gov>
References: <Pine.LNX.4.44.0309100644040.15305-100000@cic-mail.lanl.gov>
	 <3F5F3F2E.70102@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F5F3F2E.70102@Loudoun-Fairfax.com>
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
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: akshaysalkar <akshaysalkar@indiatimes.com>, netfilter@lists.netfilter.org

I am an idiot.. sorry.. The log-level covers items like 

emerg
alert
crit
err
warning
notice
info
debug

It should be use something like info and then put a line in syslog.conf
for 

kern.info /var/log/iptables

My apologies for the early morning stupidity.



On Wed, 2003-09-10 at 09:11, Jeffrey Laramie wrote:
> 
> Stephen Smoogen wrote:
> > You can change the log level with the --log-level addtion to any -j LOG 
> > lines
> > 
> > LOG_LEVEL="local1"
> > -j LOG --log-level ${LOG_LEVEL} --log-prefix " Blah "
> > 
> > Then have local1 in /etc/syslog.conf go to /var/log/iptables.log
> >   
> 
> I also wanted to do this, so I tried it and iptables balked with:
> 
> iptables v1.2.7a: log-level 'local1' unknown
> 
> I checked my syslog.h file and found that 'local1' was an alias for
> the LOG_LOCAL1 facility and not defined as a priority (log level).
> Suggestions?
> 
> Jeff
-- 
Stephen John Smoogen		smoogen@lanl.gov
Los Alamos National Labrador  CCN-5 Sched 5/40  PH: 4-0645 (note new #)
Ta-03 SM-1498 MailStop B255 DP 10S  Los Alamos, NM 87545
-- So shines a good deed in a weary world. = Willy Wonka --


