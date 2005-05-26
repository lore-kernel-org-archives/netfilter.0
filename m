From: Jason Opperisano <opie@817west.com>
Subject: Re: conntrack related dropped packets or HTB issues on 2.6.11?
Date: Thu, 26 May 2005 10:45:53 -0400
Message-ID: <20050526144553.GA21017@bender.817west.com>
References: <200505270545.43149.mylists@blue-matrix.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200505270545.43149.mylists@blue-matrix.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, May 27, 2005 at 05:45:42AM +1000, Lewis Shobbrook wrote:
> I noted that despite long established and functional firewall rules allowing 
> for inbound tcp dport 25, the packets were being dropped and logged.
> tcp IN:IN=ppp0 OUT= MAC= SRC=69.16.xxx.xxx DST=xxx.xxx.xxx.xxx LEN=52 TOS=0x00 
> PREC=0x00 TTL=49 ID=26228 DF PROTO=TCP SPT=38158 DPT=25 WINDOW=5840 RES=0x00 
> ACK FIN URGP=0

maybe that was just a poor choice of log snippets, as that is a FIN/ACK
from the remote smtp client.  on a saturated link, it's completely
plausible that this packet would arrive outside of the close_wait
timeout; though the default is 60 secs, so unless you've changed this,
then maybe not...
(sysctl net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait)

anyway--dropping the FIN/ACK from the remote side won't affect
connectivity between the client and server, and the connection will be
timed out of conntrack after a minute or so.

> During the time these events were being logged I was still able to telnet to 
> port 25 from a remote network to the xxx.xxx.xxx.xxx interface, so clearly 
> something bogus was going on.  Email was still coming in and out at a heavy 
> but not ridiculous rate. Note also that only some connections to port 25 were 
> logegd this way, the test telnet's to port 25 showed only in the mail log not 
> at all on the firewall.
> 
> I also noted that I was getting a huge increase in the number of "NEW" packets 
> not marked as SYN which viewed as follows...
> NEW NOT SYN!: IN=ppp0 OUT= MAC= SRC=203.57.xxx.xxx DST=xxx.xxx.xxx.xxx LEN=100 
> TOS=0x00 PREC=0x00 TTL=57 ID=42058 DF PROTO=TCP SPT=25 DPT=6699 WINDOW=58080 
> RES=0x00 ACK PSH URGP=0

this is less encouraging...

> I deduced from this that it was posible the contrack tables were overrun and 
> the connection state being lost.  I didn't have focus to 
> cat /proc/net/ip_conntrack >> to save the output.... Oh well...

more importantly, to figure out of you're filling conntrack, compare:

  wc -l /proc/net/ip_conntrack

  sysctl net.ipv4.netfilter.ip_conntrack_max

-j

--
"Stewie: Met her on my CB / said her name was Mimi / Sounded like
 an angel'd come to earth (come to earth) / When I went to meet her / Man,
 you should have seen her / Twice as tall as me, three times the girth."
        --Family Guy

