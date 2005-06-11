From: Frank Gruellich <frank@der-frank.org>
Subject: Re: Strange Entry
Date: Sat, 11 Jun 2005 16:38:59 +0200
Message-ID: <20050611143858.GG5254@der-frank.org>
References: <39745.82.152.178.234.1118493310.squirrel@webmail.*>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <39745.82.152.178.234.1118493310.squirrel@webmail.*>
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

* Jimmy <squid@oranged.to> 11. Jun 05:
> Hello,

Hi,

> Jun 11 12:25:40 bogus kernel: Dropped Out Rule: IN= OUT=eth0
> SRC=212.100.249.100 DST=137.149.3.22 LEN=75 TOS=0x00 PREC=0x00 TTL=64
> ID=27797 DF PROTO=TCP SPT=25 DPT=34934 WINDOW=1448 RES=0x00 ACK PSH FIN
> URGP=0
> 
> I am not sure what should be going out with a source port of 25 and a
> destination port that is so high. I thought that an outgoing connection
> from the server should be established with a high source port and a low
> (service) destination port?.

It's not an outgoing one, it's a FIN packet, that tries to close an
already established connection.  Check your MTA, AFAICS it binds to the
external interface and accepts connections from the internet.  Check
your input rules too.

> I am trying to work out if that rule would be resulting in a drop in
> email. Im not seeing any OUTBOUND email in the queue..

IIRC MTAs delivering mail should connect from a high port.  In all cases
the connection will go to port 25, not to a high port as in your log
snippet.

HTH,
 regards, Frank.
-- 
Sigmentation fault

