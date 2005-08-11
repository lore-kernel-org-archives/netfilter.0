From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Logging
Date: Thu, 11 Aug 2005 16:54:29 -0400
Message-ID: <1123793668.2070.198.camel@grendel>
References: <42FB7394.4010203@krap.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42FB7394.4010203@krap.dk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 2005-08-11 at 11:49, Svenne Krap wrote:
>
> Is there some way to get netfilter to collect rule hits (like with no -j 
> clause) for a each port/ip-address individually within a range ?
> Other than creating thousands of lines of rules and add them to my 
> "firewall-startup" script (which is currently slightly less than 80 rules).

Have LogWatch process the /var/log/message file and produce a medium
level detail report. You'll get output similar to the following:

Dropped 603 packets on interface eth3
  From 4.78.20.2 - 12 packets to udp(53)
  From 12.120.1.21 - 10 packets to
tcp(4355,10045,12579,17520,18552,36906,53249,54319,58702,62703)
  From 12.120.1.22 - 9 packets to
tcp(4063,11107,13063,30538,37001,40758,45575,48153,57370)
  From 12.130.62.16 - 24 packets to udp(53)
  From 60.26.129.15 - 8 packets to
tcp(5554,9898,5554,9898,5554,9898,5554,9898)
  From 61.152.167.59 - 4 packets to tcp(22,22,22,22)
  From 61.221.58.212 - 4 packets to tcp(22,22,22,22)
  From 62.105.6.52 - 1 packet to icmp(0)

You can then further parse it as needed. You don't need a unique log
rule for each port and/or IP. LogWatch will sort it all out for you. 

HTH,
Chris



