From: Filip Sneppe <filip.sneppe@uptime.be>
Subject: Re: mms and rtsp patches = make modules fail
Date: 29 Jan 2004 10:28:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075368500.18100.7.camel@exile>
References: <4017BB98.7090203@dsl.pipex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4017BB98.7090203@dsl.pipex.com>
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
To: Andy Furniss <andy.furniss@dsl.pipex.com>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-01-28 at 14:39, Andy Furniss wrote:
> I don't really need them but I pressed Y :-) looks like some headers are 
> missing from POM cvs of a couple of days old. mms and rtsp, unless my 
> gcc 2.95.3 is being over pedantic. Vanilla 2.4.24 apart from 2IMQ IMQ 
> nat and ESFQ patches.
> 
> In file included from ip_conntrack_standalone.c:28:
> /home/andy/Sources/kernels/2.4.24/linux-2.4.24/include/linux/netfilter_ipv4/ip_conntrack.h:74: 
> field `ct_rtsp_info' has incomplete type
> /home/andy/Sources/kernels/2.4.24/linux-2.4.24/include/linux/netfilter_ipv4/ip_conntrack.h:89: 
> field `ct_mms_info' has incomplete type
> make[2]: *** [ip_conntrack_standalone.o] Error 1
> make[2]: Leaving directory 
> `/home/andy/Sources/kernels/2.4.24/linux-2.4.24/net/ipv4/netfilter'
> make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
> make[1]: Leaving directory 
> `/home/andy/Sources/kernels/2.4.24/linux-2.4.24/net
> 

Hi Andy,

I can't reproduce this with 2.4.24, some pending netfilter patches and
those two conntrackers. Where can I find those other two patches ?

Do other connection tracking/nat helpers from patch-o-matic compile
correctly, or did you just apply those two ?

If you want, you can send me a diff of your modified 2.4.24 against a
clean 2.4.24 and a description of what you've done/patched. I'll try
to see what goes wrong.

Regards,
Filip


