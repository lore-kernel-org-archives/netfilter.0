From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: segmentation fault
Date: Mon, 20 Dec 2004 05:01:42 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412200454310.18976-100000@darkstar.sysinfo.com>
References: <41C69261.7010008@hdr-roma.it>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41C69261.7010008@hdr-roma.it>
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
To: primero <primero@fastwebnet.it>
Cc: netfilter@lists.netfilter.org

On Mon, 20 Dec 2004, primero wrote:

> ubberalles@yahoo.de wrote:
> 
> >I am using Slackware 10 distro, with 2.4.26 kernel and 1.2.10 iptables, when i try to use something like this:
> >
> >iptables -A FORWARD -p tcp -s 192.168.0.0/24 -d yahoo.com -j REJECT
> >
> >a segmentation fault happen.
> >
> >can somebody help...
> >
> >cheers
> >JW
> >
> >  
> >
> I don't remember well because a lot of time is passed .... but i had 
> similar problem while tryng to add a rule to accept OUTPUT traffic to my 
> mail server using the name instead of ip. i had the same seg fault 
> problem as you ... solved by manual translate of name to ip for 
> destination match.
> What about if u try to change "-d yahoo.com" in an "ip address"?
> 

Likely in this case due to the fact that yahoo.,com reolses to more then
one address/netblock;

# nslookup yahoo.com
Server:  cache-ns2.rdu.portbridge.com
Address:  209.170.128.71

Non-authoritative answer:
Name:    yahoo.com
Addresses:  66.94.234.13, 216.109.112.135


# host -a yahoo.com

The following answer is not authoritative:
yahoo.com       275 IN  A       66.94.234.13
yahoo.com       275 IN  A       216.109.112.135
...

# fullwho 216.109.112.135|more
[jengate.thur.de]
Process query: '216.109.112.135'
Query recognized as IP.
Querying whois.arin.net:43 with whois.


OrgName:    HotJobs.com, Ltd.
OrgID:      HOTJOB-6
Address:    406 W. 31st St.
City:       New York
StateProv:  NY
PostalCode: 10001
Country:    US

NetRange:   216.109.112.0 - 216.109.127.255
CIDR:       216.109.112.0/20
NetName:    HOTJOBS
...


# fullwho 66.94.234.13|more
[jengate.thur.de]
Process query: '66.94.234.13'
Query recognized as IP.
Querying whois.arin.net:43 with whois.


OrgName:    Yahoo!
OrgID:      YAOO
Address:    701 First Avenue
City:       Sunnyvale
StateProv:  CA
PostalCode: 94089
Country:    US

NetRange:   66.94.224.0 - 66.94.239.255
CIDR:       66.94.224.0/20
NetName:    YAHOO-3
...

manual lookups and maintainaince are required or an internal parser
to get the IP<'s> in question.  Of course things get more complicated if
one considers;

# nslookup hotjobs.com
Server:  cache-ns2.rdu.portbridge.com
Address:  209.170.128.71

Non-authoritative answer:
Name:    hotjobs.com
Address:  66.218.84.150

# fullwho 66.218.84.150|more
[jengate.thur.de]
Process query: '66.218.84.150'
Query recognized as IP.
Querying whois.arin.net:43 with whois.


OrgName:    Yahoo!
OrgID:      YAOO
Address:    701 First Avenue
City:       Sunnyvale
StateProv:  CA
PostalCode: 94089
Country:    US

NetRange:   66.218.64.0 - 66.218.95.255
CIDR:       66.218.64.0/19


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


