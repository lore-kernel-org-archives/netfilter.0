From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Is this firewall good enough?
Date: Wed, 09 Jun 2004 21:23:50 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C70F66.4080907@linuxmail.org>
References: <Pine.LNX.4.33.0406091242570.6047-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406091242570.6047-100000@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: David Cannings <lists@edeca.net>, netfilter@lists.netfilter.org


> - Use raw table and NOTRACK to skip conntrack for the (UDP) DNS queries
>   and still benefit from conntrack for all other connections.
> 

pom raw patch. Testing....ouch, bit on the edge for me to try to use that...

I'd love to be able to track nothing but smtp and optimize on that too 
so that I can give connlimit a go.

