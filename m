From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Wed, 21 Apr 2004 08:02:24 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4085BA10.7030209@linuxmail.org>
References: <Pine.LNX.4.33.0404201653330.14290-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0404201653330.14290-100000@blackhole.kfki.hu>
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


> A minor fix is required to "port" both to 2.6.
> 
> 
>>Lovely. Does ippool/ipset take ips only or will they also take cidrs?
> 
> 
> ippool accepts IP addresses. In ipset, you can store CIDR netblock as
> well.

I see. Thanks.
> 
> 
>>BTW...mail.so-net.com.hk is an ISP smarthost...could you block
>>so-net.com.hk not coming from 203.99.142.22 instead of a domain rule
>>block on rdns and sender addy?
>>
>>And maybe all emails from 203.99.142.22 if sender addy not in
>>so-net.com.hk...
> 
> 
> netfilter was not designed to filter E-mail.

:) I guess I won't need to send anything private then. The list shall 
suffice.

