From: ypresente@mrv.com (Yaron Presente)
Subject: DNAT & ARP
Date: Sun, 18 Jul 2004 12:52:05 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FA4845.8030802@mrv.com>
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
To: netfilter@lists.netfilter.org

Hi All,
I have a linux box (Montavista 2.4.18), which is connected to the 
external world through an IP subnet A.
I want to DNAT this subnet A to a private subnet B, and to do this I 
need to support proxy arp for hosts in class A, which don't actually exist.
My problems are all ARP related:
1. I want to reply on ARP requests for hosts on subnet A. looking at the 
arp code in net/ipv4/arp.c, it seems that
this should have been the default behaviour (i.e 
(rt->rt_flags&RTCF_DNAT) behaves the same as if a proxy arp was defined
on the interface). However, testing shows that the linux doesn't reply. 
why ?
2. To overcome the first problem, I can enable proxy arp explicitly. 
However, proxy arp does not answer to requests if the
routing lookup shows that the target is located on the incoming 
interface of the request. any ideas?
3. If there are real hosts of subnet A on my external interface, I do 
not want to serve as proxy arp for them.
is there a way to define these exceptions to the proxy arp? can I set a 
big proxy_delay in /proc and hope that the real host would
answer before my proxy?
Any help would be appreciated.
Thanks,
Yaron

-- 
Yaron Presente
MRV International
Direct   : 972-4-9936237
Fax      : 972-4-9890564
Email   : ypresente@mrv.com
www.mrv.com





