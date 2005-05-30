From: Lewis Shobbrook <mylists@blue-matrix.org>
Subject: Re: conntrack related dropped packets or HTB issues on 2.6.11?
Date: Mon, 30 May 2005 21:25:48 +1000
Message-ID: <200505302125.48800.mylists@blue-matrix.org>
References: <200505270545.43149.mylists@blue-matrix.org>
	<20050526144553.GA21017@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050526144553.GA21017@bender.817west.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Thanks for the reply Jason,
On Friday 27 May 2005 12:45 am, Jason Opperisano wrote:
> On Fri, May 27, 2005 at 05:45:42AM +1000, Lewis Shobbrook wrote:
> > I noted that despite long established and functional firewall rules
> > allowing for inbound tcp dport 25, the packets were being dropped and
> > logged. tcp IN:IN=ppp0 OUT= MAC= SRC=69.16.xxx.xxx DST=xxx.xxx.xxx.xxx
> > LEN=52 TOS=0x00 PREC=0x00 TTL=49 ID=26228 DF PROTO=TCP SPT=38158 DPT=25
> > WINDOW=5840 RES=0x00 ACK FIN URGP=0
>
> maybe that was just a poor choice of log snippets, as that is a FIN/ACK
> from the remote smtp client.  on a saturated link, it's completely
> plausible that this packet would arrive outside of the close_wait
> timeout; though the default is 60 secs, so unless you've changed this, 
> then maybe not...
> (sysctl net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait)

This was just a poor choice, there were others without the ACK FIN.
I have these rules in place...
iptables -A INPUT -i $ext_ethernet -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m 
limit --limit 10/h -j LOG --log-prefix 'PORT SCA
N!: '
iptables -A INPUT -i $ext_ethernet -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m 
limit --limit 3/s --limit-burst 8 -j ACCEPT
I recall seeing a PORT SCAN log entry, however this is not the source of the 
problem, as the results of changing the default routing interface indicated 
the problems were related specifically to the default exernal interface used 
for web and outbound smtp.  A stange fact was that the total data traffic was 
not unusually high (although well above average) at the time, but was clearly 
higher for smtp specifically.
The logs on the internal mail server showed a large number of aborted mail 
transfers (assumed time-outs), the external showed no time-outs. 
The internal interface was always responsive.  The source of the disruption 
was only related to outbound data through the default interface and as no 
settings have changed between now and then, it appears that a combination of 
factors caused a "critical mass".

> anyway--dropping the FIN/ACK from the remote side won't affect
> connectivity between the client and server, and the connection will be
> timed out of conntrack after a minute or so.

> > During the time these events were being logged I was still able to telnet
> > to port 25 from a remote network to the xxx.xxx.xxx.xxx interface, so
> > clearly something bogus was going on.  Email was still coming in and out
> > at a heavy but not ridiculous rate. Note also that only some connections
> > to port 25 were logegd this way, the test telnet's to port 25 showed only
> > in the mail log not at all on the firewall.
> >
> > I also noted that I was getting a huge increase in the number of "NEW"
> > packets not marked as SYN which viewed as follows...
> > NEW NOT SYN!: IN=ppp0 OUT= MAC= SRC=203.57.xxx.xxx DST=xxx.xxx.xxx.xxx
> > LEN=100 TOS=0x00 PREC=0x00 TTL=57 ID=42058 DF PROTO=TCP SPT=25 DPT=6699
> > WINDOW=58080 RES=0x00 ACK PSH URGP=0
>
> this is less encouraging...
>
> > I deduced from this that it was posible the contrack tables were overrun
> > and the connection state being lost.  I didn't have focus to
> > cat /proc/net/ip_conntrack >> to save the output.... Oh well...
>
> more importantly, to figure out of you're filling conntrack, compare:
>
>   wc -l /proc/net/ip_conntrack
>
>   sysctl net.ipv4.netfilter.ip_conntrack_max
>
The status has been stable for quite some days now so I'm not going to get a 
look at this unless I'm unfortunately sufferring these past symptoms. 

Cheers and thanks,

Lewis

