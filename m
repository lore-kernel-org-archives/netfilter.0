From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: ftp server issue, trying to DL 1.2.7a
Date: Sat, 07 Sep 2002 15:18:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D79FC89.9070001@fugmann.dhs.org>
References: <3D7877D3.6040608@fugmann.dhs.org> <3D79F330.000001.00620@athlon1000>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: wickedsun <wickedsun@phreaker.net>
Cc: netfilter@lists.netfilter.org

wickedsun wrote:
> FTP Issues, round 2.
>  
>  
> With further testing, I've noticed that it doesnt quite work. For some 
> unknown reason, it *seems* to work on port 21, but doesnt on other 
Seems or does?

> ports. From what I understood in your post, you said it would work on 
> any port. (FTP, of course).

>  
No. The ftp connection tracking module only monitors on port 21. Because 
it has to examine all packets beeing send though, it would simple be too 
much work to monitor any connection made. If you want it to monitor 
other ports also, you can compile the ftp connection tracking as a 
module, and then use:
modprobe ip_conntrack_ftp 21,5006
to let it listen on ports 21 and 5006.

I do not know if there is any way to make this work with 
ftp_connection_tracking statically compiled in the kernel.

Regards
Anders Fugmann

-- 
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org


