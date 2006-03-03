From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Connection not recognized as RELATED
Date: Fri, 03 Mar 2006 09:41:05 -0500
Message-ID: <44085581.8050002@SCampbell.net>
References: <5995792B428BD840906480B184A386CBB50B7F@marvin.killerobot.com>
	<d27cd2010603021804p30d14675g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d27cd2010603021804p30d14675g@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

ludi wrote:
> I had settled  the problem last time,with help.:)
> First of all, you must insmod ftp_conntrack(nat_ftp_conntrack....etc).
> The module work for processing the ftp connection.
> And then, you should bind ftp on 21port.The module only can track the
> 21port by default.If you want to set other port,you must edit the
> source.
> You may setup your rule to allow the ftp pass.
> Did your ftp work?
> :)
>   
ip_conntrack_ftp takes an array of ports. 

 # modinfo ip_conntrack_ftp
filename:       
/lib/modules/2.6.13-15.8-default/kernel/net/ipv4/netfilter/ip_conntrack_ftp.ko
license:        GPL
author:         Rusty Russell <rusty@rustcorp.com.au>
description:    ftp connection tracking helper
vermagic:       2.6.13-15.8-default 586 REGPARM gcc-4.0
supported:      yes
depends:        ip_conntrack
srcversion:     4461DB3F80F52AA3EF2374F
parm:           loose:int
parm:           ports:array of int


So you can, for example:
    modprobe ip_conntrack_ftp ports=21,33,454


