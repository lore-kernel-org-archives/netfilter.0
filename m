From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: port 113 ?
Date: Thu, 13 Jan 2005 10:15:54 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10501131013300.20258-100000@darkstar.sysinfo.com>
References: <1105623547.8185.16.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105623547.8185.16.camel@hubcap.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Thu, 13 Jan 2005, Jason Opperisano wrote:

> On Thu, 2005-01-13 at 02:59, Brent Clark wrote:
> > Soo I would like to know, if it is advisable to stop identd. I have
> > googled abit and from what I gather, its considered as dangerous and
> > basically pointless to run. By removing / stopping this service, will it
> > hamper hinder my users, other servers in any other way. I only run a
> > mail and ftp server.
> 
> there are still mail servers out there configured to do an ident lookup
> prior to sending mail to you.  i normally disable identd, but i always
> add a rule like this to speed up services that still request it:
> 
>   iptables -N ident
>   iptables -A ident -p tcp --syn --dport 113 \
>     -j REJECT --reject-with tcp-reset
> 
>   iptables -A INPUT -j ident
>   iptables -A FORWARD -j ident
> 

besides sendmail, many <most?> irc servers also want to get a ident reply
back, so one might want to add a rules for say a source ports of 6667
coming in and a dest port 113 on the inside that allows a faked reply from
their pidentd or whatever they use.


Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


