From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP USER+IP ASSOCIATION CONTROL
Date: Thu, 16 Sep 2004 16:04:45 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095365085.2489.76.camel@wolfpack.ljm.dom>
References: <000c01c49c07$0c9545f0$031513ac@gmm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000c01c49c07$0c9545f0$031513ac@gmm>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-16 at 12:05, Comunicaciones Servinform wrote:
> We need have our linux iptables firewall making an ftp user+ip association control in external public interface. 
> If ftp user+ip association is correct we need transfer ftp ssl connection to internal Ipswitch WS_FTP Server 5 with user db in sql server database. 
> 
> Firewall: 
> linux suse 8.1 kernel 2.4
> iptables v1.2.7a
> 
> Internal server:
> w2000 server
> sql server 2000
> ipswitch ws_ftp server 5.0 with forced ssl connections
> 
> It's possible? Any idea?. Thanks in advanced 

use an ftp proxy to front-end the real ftp server that has
user-authentication, username and IP based ACLs, and SSL support.

user authentication, database lookups, SSL negotiations?
netfilter wants not these things...

-j

-- 
Jason Opperisano <opie@817west.com>


