From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: FTP problems
Date: 27 Feb 2003 22:02:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046379747.2035.27.camel@kermit.spenneberg.de>
References: <1046377411.1587.160.camel@thizzy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1046377411.1587.160.camel@thizzy>
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
To: Netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-02-27 um 21.23 schrieb Del Winiecki:
> Hi,
> Everything seems to work fine except FTP via NAT.
> The interfaces that are not natted handle ftp normally.
> When I do ftp from inside where the connection goes thru nat, I get an
> instant establisment of connection,syn,ack,syn-ack followed by a 30
> second wait...then all works normally from that point. This 30 second
> delay is constant with each new ftp connection. I have tried about
> everything in the iptables script.
> Passive ftp does the same thing.
Might be an issue with identd. Many ftp servers do reverse identd lookups on 
the client. If you drop these on your firewall they have to wait for the timeout.
Reject identd on your firewall:
iptables -A INPUT -p tcp --dport 113 -j REJECT

Other possibility is reverse DNS lookup by the FTP server. 

Cheers,

Ralf
 
> 
-- 
Ralf Spenneberg
RHCE, RHCX

IPsec/PPTP Kernels for Red Hat Linux:  
http://www.spenneberg.com/.net/.org/.de
Honeynet Project Mirror:                http://honeynet.spenneberg.org
Snort Mirror:                           http://snort.spenneberg.org

