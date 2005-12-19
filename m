From: Askar Ali <askarali@gmail.com>
Subject: Re: Firewall and a FTP server
Date: Mon, 19 Dec 2005 17:08:48 +0500
Message-ID: <43A6A2D0.8050305@gmail.com>
References: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
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
To: TAC Forums <tac.forums@gmail.com>
Cc: netfilter@lists.netfilter.org

TAC Forums wrote:

>Hi All,
>
>We have a FTP server, (Red Hat Linux 7) behind a firewall, the
>  
>
why are you still using historic version of rh ? :)

>firewall allows only incomming and established connections on ports
>20,21  from any where and evry where.
>
>The Problem is, when the customers use FTP clients, the manage to
>login , but cannot upload/download files if they use PASSIVE FTP
>connections.
>
>Can smeone suggest, how the best way to get out of this situation,
>should we enable all ports above 1023?
>
>Regards,
>Boskey
>
>--
>TAC Support Team
>
>
>  
>
hi Tac

verify that modules

ip_conntrack_ftp
ip_nat_ftp

are loaded, if not try to load them with "modprobe ip_conntrack_ftp" and 
put it in your firewall startup script so that modules at boot time.




regards,

askar

