From: Michael Gale <michael@bluesuperman.com>
Subject: Re: Looking for 'ntop' for Redhat linux.
Date: Wed, 24 Dec 2003 10:52:57 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031224105257.26f97512.michael@bluesuperman.com>
References: <20031224121405.47716.qmail@web60402.mail.yahoo.com>
	<200312241220.42428.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312241220.42428.Antony@Soft-Solutions.co.uk>
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

	I have done some testing with NTOP and it may not be what you want.

First  by default it uses a RRD (round robin database) so everytime it
restarts you loose all your date. There was a command line switch that
you could use that was supposed to save your date. 

But I always received error while trying to use it.

The web GUI did not seem to reliable .. after I started NTOP with http
or https I could connect once , maybe twice but after that I could not
longer connect. It seemed that NTOP would not release my connect every
until restarted. You may by able to work around it running apache and
just proxying a connection to NTOP's web listener. It is documented on
there web page.

At last .. it seemed to crash on a weekly bases. I could never get it to
run more then 7 days in a row with it crashing. 

I am contemplating running ntop from Monday to Friday and on Friday have
cron that uses curl to download the states and save it to a file. Then
have NTOP restart. And do the same on Monday. But this seems like a lot
of work.

You may want to look at iptraf or ipfw. Cacti is also good.

P.S I always compiled mine from source.

Michael.



On Wed, 24 Dec 2003 12:20:42 +0000
Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Wednesday 24 December 2003 12:14 pm, ads nat wrote:
> 
> > Hi,
> > I am looking for REDHAT linux rpm for Network program
> > "NTOP".
> > I tried to locate at NTOP home page. But could not get
> > for REDHAT linux. I also checked at REDHAT download
> > page.
> > Any idea where I can get NTOP?
> 
> A Google search for "ntop rpm download" shows some promising-looking
> results.
> 
> http://www.google.com/search?q=ntop+rpm+download
> 
> I use neither ntop nor RedHat, however, so I can't say whether it's
> exactly what you want.
> 
> Antony.
> 
> -- 
> All matter in the Universe can be placed into one of two categories:
> 
> 1. Things which need to be fixed.
> 2. Things which need to be fixed once you've had a few minutes to play
> with them.
> 
>                                                      Please reply to
>                                                      the list;
>                                                            please
>                                                            don't CC
>                                                            me.
> 
> 


-- 
Hand over the Slackware CD's and back AWAY from the computer, your geek
rights have been revoked !!!

Michael Gale
Slackware user :)
Bluesuperman.com 

