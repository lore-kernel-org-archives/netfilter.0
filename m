From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: is there a way to discriminate the ESTABLISHED traffic?
Date: Sun, 03 Apr 2005 22:46:50 -0500
Message-ID: <4250B8AA.6080100@riverviewtech.net>
References: <4250ABAC.5010207@lorenzutti.com.ar>
Reply-To: gtaylor@riverviewtech.net
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Guido Lorenzutti <guido@lorenzutti.com.ar>
Cc: netfilter@lists.netfilter.org

With out having a better explanation of what is going on (mach transcription) I'm going to stab in the dark here and think that you are looking for RELATED traffic as it is not established but it is not completely new either.



Grant. . . .

Guido Lorenzutti wrote:
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
> 

