From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: is there a way to discriminate the ESTABLISHED traffic?
Date: Mon, 04 Apr 2005 04:17:58 -0400
Message-ID: <1112602678.5125.4.camel@jasiiitosh.nexusmgmt.com>
References: <4250ABAC.5010207@lorenzutti.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4250ABAC.5010207@lorenzutti.com.ar>
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
Content-Type: text/plain; charset="us-ascii"
To: Guido Lorenzutti <guido@lorenzutti.com.ar>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Sun, 2005-04-03 at 23:51 -0300, Guido Lorenzutti wrote:
> How can i discriminate the traffic that my firewall is answering from a 
> NEW request from a network from the ESTABLISHED traffic that my firewall 
> is making from a NEW request from him?
> 
> In rules, to allow traffic TO my box from the lan 10.0.0.0/32
> 
> 1 ipt -A INPUT -s 10.0.0.0/32 -m state --state NEW -j ACCEPT
> 2 ipt -A INPUT -s 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
> 3 ipt -A OUTPUT -d 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
> 
> Now, to allow traffic FROM my box to the lan 10.0.0.0/32
> 
> 4 ipt -A OUTPUT -d 10.0.0.0/32 -m state --state NEW -j ACCEPT
> 5 ipt -A OUTPUT -d 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
> 6 ipt -A INPUT -s 10.0.0.0/32 -m state --state ESTABLISHED -j ACCEPT
> 
> The 3 and 5 rules are exactly the same. Is there a way to discriminate 
> this or the things are just like this and there is nothing to do about it?
> 
> Tnxs in advance.

If I understand you correctly, you are asking if you can distinguish
established traffic patterns recorded in the conntrack table depending
on whether the firewall initiated the session or was responding to some
other device.  I believe that once the traffic flow is being managed by
connection tracking, the packets never traverse the filter table.  Thus,
you cannot them there.

I suppose one could see them in the raw table but even then, it would be
difficult to distinguish after the SYN, SYN/ACK, SYN/ACK sequence for
TCP and even more so for UDP.  Why do you want to distinguish them?
Perhaps there is another way to achieve your goal? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


