From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Mon, 19 Apr 2004 22:47:28 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4083E680.9020309@linuxmail.org>
References: <Pine.LNX.4.33.0404191400460.8154-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0404191400460.8154-100000@blackhole.kfki.hu>
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
Cc: netfilter@lists.netfilter.org

>>I have a whole bunch of ips/cidrs that I want to apply the rule to.
>>
>>Is there any way to insert one rule where the -s would be able to look
>>up a table (btree/hash/cdb whatever) that contains those ips/cidrs
>>instead of insert gazillion rules?
> 
> 
> Yes, you can use either the ippool or the ipset extensions. ippool is
> capable to store up to the number of IP addresses of a full B class network.
> ippool can store network addresses as well and supports random
> adressess/networks too.
> 

lovely.

when will ipset be available in 2.6?

I presume ippool is going to become obsolete?

