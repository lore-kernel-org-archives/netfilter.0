From: Hrad Miroslav <m.hrad@intv.cz>
Subject: Kernel-2-6 and iptables issue
Date: Wed, 08 Aug 2007 15:44:09 +0200
Message-ID: <46B9C8A9.6010805@intv.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi
I would like to have one questionregarding to the compilation of the 
linux-kernel (2.6) and iptables.

I need to run a firewall within the linux box, which could support at 
least ipp2p filtering, l7-layer filtering, connlimit, quota, tarpit, 
ip_mark.

I would like to know which version of the kernel, iptables, 
patch-o-magic and other patchs to use to make compilation of the kernel 
and iptables without any errors.

I have aleady tried to use kernels and iptables of many versions but the 
compilation of kernel was broken with some errors.

For instance I used this packages:
linux-2.6.16.27.tar.bz2
iptables-1.3.5.tar.bz2
patch-o-matic-ng-20060626.tar.bz2
patch-o-matic-ng-20060511.tar.bz2

linux-2.6.16-imq2.diff
iptables-1.3.0-imq1.diff
esfq-2.6.15.1.tar.gz

netfilter-layer7-v2.2.tar.gz
l7-protocols-2006-05-21.tar.gz

- but without success. (there was incompatibily pointer with connlimit 
and tarpit)


Please, can you tell me which version can I use for proper kernel 
compilation ?

Thanks

Regards

Miroslav

