From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: bandwidth monitoring
Date: Thu, 06 Jan 2005 16:30:33 -0700
Message-ID: <41DDCA19.50507@utilitran.com>
References: <200501061128.04741.patrick.leduc@novipro.com>	
	<41DD9AE3.4060207@utilitran.com>
	<1105042784.27950.12.camel@josh-desk>	
	<41DDAD75.5000103@utilitran.com>
	<1105048463.27950.20.camel@josh-desk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105048463.27950.20.camel@josh-desk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "J. Nerius" <jnerius@gmail.com>, netfilter@lists.netfilter.org


Ahhh .. I see now. Our setup is rather small and we only have about 10 
megabits max at any given time -- usually much less.

Here is the command I use to start ntop:
ntop -4 -a /home/ntopwatch/webaccess --daemon -i eth1,eth2 -o -n -p 
userprolist -s -u ntopwatch -w 192.168.7.1:3000 -M -P /home/ntopwatch/

My userprolist:
FTP=ftp|ftp-data
HTTP=http|www|https|3128
DIFFHTTP=8080|8888
RDP=3389
DNS=name|domain
NBios-IP=netbios-ns|netbios-dgm|netbios-ssn
Mail=pop-2|pop-3|pop3|kpop|smtp|imap|imap2
DHCP-BOOTP=67-68
SNMP=snmp|snmp-trap
NNTP=nntp
SSH=22
Gnutella=6346|6347|6348
Kazaa=1214
WinMX=6699|7730
DirectConnect=0
eDonkey=4661-4665
Messenger=1863|5000|5001|5190-5193

But the box which is running ntop is:
Dual PIII 1.4Ghz with 1GB of RAM.

Michael.

J. Nerius wrote:
> Hello, 
> 
> My concern was for the amount of resources NTOP would end up using with
> the currently volume of traffic we have going through any one link. 
> 
> Basically, there will be at least 3000 hosts totaling around 25 megabits
> of traffic at any given time. In my experience with ntop for short-term
> monitoring, I found that in these circumstances, the process size and
> cpu utilization were quite high.
> 
> I've been using bandwidthd to collect data and then just rsyncing that
> data to a different server that actually graphs the data. I'd like to
> use ntop for it's detailed tracking capabilities, but given the resource
> utilization issues I've seen in the past, am not sure how feasible this
> would be. 
> 
> How many hosts and how much traffic is currently going through your
> setup? It's very possible that I may just need to tweak settings
> somewhere to improve performance. 
> 
> J.N.
> 
> 
> On Thu, 2005-01-06 at 14:28 -0700, Michael Gale wrote:
> 
>>Hello,
>>
>>	I am not sure I follow ... NTOP takes care of providing the stats, so 
>>if you firewall box or ntop server can handle your network.
>>
>>The storage box can be what and where ever ... for example you could 
>>have a low end box somewhere on the network that makes the http 
>>connection, downloads the stats and stores them in a database.
>>
>>Then you only need a simple method to display them when needed. If you 
>>are a large company it might be easier to setup multiple ntop servers 
>>and have all the stats stored in a central location.
>>
>>Michael.
>>
>>
>>
>>J. Nerius wrote:
>>
>>>How many hosts and how much traffic are you running through it? I've
>>>wanted to come up with a solution similar to the one you've described to
>>>replace my current bandwidthd setup but I'm thinking that my network may
>>>be too large with too much traffic to support something like that
>>>without building a monster box just to capture the stats. 
>>>
>>>J.N.
>>>
>>>On Thu, 2005-01-06 at 13:09 -0700, Michael Gale wrote:
> 
> 
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

I make better friends with those who think for them selves

