From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: Port 25
Date: Sun, 6 Feb 2005 15:44:56 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10502061541590.352-100000@darkstar.sysinfo.com>
References: <Pine.LNX.4.58.0502061446150.1174@linux>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.58.0502061446150.1174@linux>
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
To: Ted Gervais <ve1drg@av.eastlink.ca>
Cc: netfilter@lists.netfilter.org

On Sun, 6 Feb 2005, Ted Gervais wrote:

> 
> I have a problem getting mail packets to go out with my present firewall
> setup.
> 
> What I have is a firewall that blocks/drops everything at the start and
> then it goes on to allow access through specific ports. For Port 25 or
> smtp to work, I have the following line which I was hoping to have mail
> coming and going with this statement. However, outgoing mail can go, but
> incoming has a problem:
> 
> /usr/sbin/iptables -A INPUT -p tcp --destination-port 25 -j ACCEPT
> 
> I also tried the following two lines to see if things would work but to no
> avail..:
> 
> iptables -A OUTPUT -o $INTERNET -p tcp -s $IPADDR --sport $UNPRIVPORTS \
> --dport 25 -j ACCEPT
> iptables -A INPUT -i $INTERNET -p tcp ! --syn --sport 25 -d $IPADDR \
> --dport $UNPRIVPORTS -j ACCEPT
> 
> So, if I take the firewall down, mail comes and goes just great..
> What am I not seeing here??
> 

It's very likely the other systems sending in e-mail are hanging waiting
on ident, port 113, try either allowing ident to pass or setting a REJECT
on attempts to that port and see if that helps, and you might well get
hung with DNS lookups with newer sendmails. Make sure the sendmail server
can reach out and touch the DNS tree.

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


