From: "hare ram" <hareram@sol.net.in>
Subject: Multible Links with Transparent Cache
Date: Tue, 3 Dec 2002 16:11:37 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <06f501c29ab8$8eb3c040$13fcc5cb@nextto>
References: <31347F3CE518D6118ACB00A0246AD0560B2505@mx.seaan.net>
Reply-To: "hare ram" <hareram@sol.net.in>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all

i am running with RedHat 7.3 with iptables + transparent Cache
its working well

no i have added another Link to My network with another Provider
now i want to Load Balance with Two Links

At now iam running both with 2 Different Server,

iam planning to do below

 eth0 with Public IP x.x.x.x gateway x.x.x.1
 eht0:0 with Private IP (ADSL)  which is provided another Provider
192.168.3.2 gateway is 192.168.3.1

i have LAN with 2 networks at this moment with 2 servers

one Server Serving 192.168.2.0 network Going to First Link
another Server Serving 192.168.20.0 network Going to Second Link

i want  to load balance with this two network with One Server with
Transparent cache,
the cache and routing should automatically load Balance the Links

one link is 128kbps another is 256kbps Link

any one recomend how to do this

thanks
hare


