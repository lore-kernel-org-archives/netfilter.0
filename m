From: Rasmus Reinholdt Nielsen <rasmus@narani.dk>
Subject: Re: Multible Links with Transparent Cache
Date: Tue, 03 Dec 2002 14:02:17 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.1.0.14.2.20021203140152.030ccd48@of23sm3>
References: <31347F3CE518D6118ACB00A0246AD0560B2505@mx.seaan.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <06f501c29ab8$8eb3c040$13fcc5cb@nextto>
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
Content-Transfer-Encoding: 7bit
To: hare ram <hareram@sol.net.in>, netfilter@lists.netfilter.org

Take a look at
http://www.linuxvirtualserver.org/~julian/nano.txt

its working for me.

/Rasmus

At 16:11 03-12-2002 +0530, hare ram wrote:
>Hi all
>
>i am running with RedHat 7.3 with iptables + transparent Cache
>its working well
>
>no i have added another Link to My network with another Provider
>now i want to Load Balance with Two Links
>
>At now iam running both with 2 Different Server,
>
>iam planning to do below
>
>  eth0 with Public IP x.x.x.x gateway x.x.x.1
>  eht0:0 with Private IP (ADSL)  which is provided another Provider
>192.168.3.2 gateway is 192.168.3.1
>
>i have LAN with 2 networks at this moment with 2 servers
>
>one Server Serving 192.168.2.0 network Going to First Link
>another Server Serving 192.168.20.0 network Going to Second Link
>
>i want  to load balance with this two network with One Server with
>Transparent cache,
>the cache and routing should automatically load Balance the Links
>
>one link is 128kbps another is 256kbps Link
>
>any one recomend how to do this
>
>thanks
>hare


