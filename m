From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: DNAT & ARP
Date: Mon, 19 Jul 2004 06:52:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090234023.27791.10.camel@localhost>
References: <40FA4845.8030802@mrv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FA4845.8030802@mrv.com>
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
To: Yaron Presente <ypresente@mrv.com>
Cc: netfilter@lists.netfilter.org

On Sun, 2004-07-18 at 05:52, Yaron Presente wrote:
> Hi All,
> I have a linux box (Montavista 2.4.18), which is connected to the 
> external world through an IP subnet A.
> I want to DNAT this subnet A to a private subnet B, and to do this I 
> need to support proxy arp for hosts in class A, which don't actually exist.
> My problems are all ARP related:
> 1. I want to reply on ARP requests for hosts on subnet A. looking at the 
> arp code in net/ipv4/arp.c, it seems that
> this should have been the default behaviour (i.e 
> (rt->rt_flags&RTCF_DNAT) behaves the same as if a proxy arp was defined
> on the interface). However, testing shows that the linux doesn't reply. 
> why ?
> 2. To overcome the first problem, I can enable proxy arp explicitly. 
> However, proxy arp does not answer to requests if the
> routing lookup shows that the target is located on the incoming 
> interface of the request. any ideas?
> 3. If there are real hosts of subnet A on my external interface, I do 
> not want to serve as proxy arp for them.
> is there a way to define these exceptions to the proxy arp? can I set a 
> big proxy_delay in /proc and hope that the real host would
> answer before my proxy?
> Any help would be appreciated.
> Thanks,
> Yaron

If I understand you correctly, it is a pretty straightforward DNAT with
exactly the proxy ARP issues you describe.  I typically handle this by
binding the DNAT address to the public NIC using iproute2.  For example,
if I NAT 10.1.1.5 to 1.1.1.5, I have the appropriate DNAT rule in
iptables and then do a 

ip address add 1.1.1.5/24 brd + dev eth0

or whatever parameters are appropriate.  I'm not sure if the brd + is
necessary if I already have an address for the same subnet bound to the
NIC.  Perhaps someone else can comment.

Once ISCS is available (http://iscs.sourceforge.net), it will
automatically handle the ARP configuration when you assign a public
address to a private host.  In fact, that code works now along with
almost all the access control portion.  Good luck with it - John
-- 
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


