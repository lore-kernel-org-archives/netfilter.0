From: a.ledvinka@promon.cz
Subject: Re: FTP Connection problems.
Date: Wed, 25 Aug 2004 13:11:41 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <OFF5CB5ADF.C30D9246-ONC1256EFB.003B55C5-C1256EFB.003D7ECC@promon.cz>
References: <1093428637.1781.17.camel@lbedlbxl.dev.xtra-net.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1093428637.1781.17.camel@lbedlbxl.dev.xtra-net.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

could be many reasons.

either side wants to do ident lookup and timeouts or
either side wants to do reverse and forward dns lookup somwhere around 
accepting connection before anything happens and timeouts on nonworking 
dns or
you use some inteligent ftp client that would rever to passive ftp if 
active is not working or else.

best to choose command line ftp client and test it with explicit passive 
mode on and off to see if it is realy able to open both types of 
connections.
next check dns from both ends of connection and see how fast (and if it is 
correct - not serverfail/nxdomain/... type of response) you get answer 
from dns service for both revers and forward lookups for other side.
then allow or reject (don't simply drop) traffic for ident service or 
modify ftp server setting

btw: not directly related to your problem but you might also want to: $fw 
-A FORWARD -p icmp -m state --state RELATED -j ACCEPT (and maybe OUTPUT 
too)

