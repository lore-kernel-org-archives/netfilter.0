From: Dan Egli <dan@shortcircuit.dyndns.org>
Subject: Re: Use netfilter to block DoS
Date: Sun, 27 Apr 2003 12:16:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EAC1E83.6080907@shortcircuit.dyndns.org>
References: <E199mmm-0007tf-00@kashyyyk.netfilter.org>
	<005d01c30cdb$f6883a80$6401a8c0@oc.cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005d01c30cdb$f6883a80$6401a8c0@oc.cox.net>
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

Peter Bi wrote:

>Hi,
>
>I have two questions related to Denial of Service:
>
>1) If I want to set up a syn-flood protection, based on 1 per second (bursts
>5), should I use
>
>iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j DROP
>or
>iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j ACCEPT
>
>The first one seems to drop those which EXCEED 1 per second
>  
>
I have a similiar rule, and I use ACCEPT.  I have my system configured 
to allow up to 5 ICMP messages per second. Beyond that they are dropped.
iptables -A INPUT -p icmp -m limit --limit 5/sec -j ACCEPT


