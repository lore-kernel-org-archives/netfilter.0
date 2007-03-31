From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Debian 2.6.8/bridge/iptables/passive ftp
Date: Sat, 31 Mar 2007 10:10:18 +0200
Message-ID: <460E176A.4020903@rtij.nl>
References: <351646215@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <351646215@web.de>
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
To: spaminator@web.de
Cc: netfilter@lists.netfilter.org

spaminator@web.de wrote:
> Hi there,
>
> I'm experiencing a strange problem when trying to FTP through a firewalling bridge.
>
> My FTP client connects to the FTP server ok. But when the client switches to passive mode to get the directory's file list I get 
>
> stuck.
>
>   

Did you load ip_conntrack_ftp?

M4


