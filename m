From: Bob Sully <rcs@malibyte.net>
Subject: Re: Dynamic Deny rule
Date: Sat, 4 Jan 2003 14:15:51 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301041413150.25229-100000@firefox.malibyte.net>
References: <20030104214607.GD16581@miggy.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030104214607.GD16581@miggy.org>
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
To: Athan <netfilter@miggy.org>
Cc: Mark Ryan <markryan@cfl.rr.com>, netfilter@lists.netfilter.org



This file is only read once, at firewall startup or restart.  I check my 
logs pretty regularly, and any bad guys get put in the firewall.banned 
file on a daily basis.  

I actually have had no problems with ftp, as I run ProFTPd with only one 
incoming directory which has no read access and no write access anywhere 
else.

-- Bob --


On Sat, 4 Jan 2003, Athan wrote:

> On Sat, Jan 04, 2003 at 10:53:16AM -0800, Bob Sully wrote:
> > Here's the excerpt from my script:
> > 
> >   # Refuse any connections to/from problem sites.
> [snip]
> > 
> >   if [ -f /etc/firewall/firewall.banned ]; then
> >      while read BANNED; do
> >          iptables -A INPUT -i $EXTERNAL_INTERFACE -s $BANNED -j DROP
> >          iptables -A INPUT -i $EXTERNAL_INTERFACE -d $BANNED -j DROP
> >          iptables -A OUTPUT -o $EXTERNAL_INTERFACE -s $BANNED -j DROP
> >          iptables -A OUTPUT -o $EXTERNAL_INTERFACE -d $BANNED -j DROP
> >      done < /etc/firewall/firewall.banned
> >   fi
> 
>   Given it reads the entire file each time, wouldn't you want to put
> some sort of flush in there first?  Of course that's going to get rid of
> all rules.  Just if you run this every time you're going to end up with
> some entries in a lot of times.
> 
>   How about having the actual INPUT/OUTPUT chains jump to a userdefined
> one at the end and you put these rules in that user-defined chain?  That
> way you can flush *that* entire chain each time before adding the
> current bans.
> 
>   Of course if you use a decent FTPd it's easy to ban by IP anyway, i.e.
> proftpd:
> 
>         <Directory *>
>                 <Limit ALL>
>                         Deny from 62.80.132.
>                         Deny from .CXXXII.adsl.multi.fi
>                 </Limit>
>         </Directory>
> 
> -Ath
> 

-- 
________________________________________
Bob Sully - Simi Valley, California, USA
http://www.malibyte.net

"The waiting is the hardest part." - T. Petty



