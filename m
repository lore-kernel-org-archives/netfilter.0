From: "per j" <perj8@hotmail.com>
Subject: Re: ipt_recent 0.3.0 --rttl still doesn't work (I made a patch instead, can't
 wait)
Date: Mon, 03 Mar 2003 22:14:22 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F1167IjdMZNs8cqeI3F0000bd9c@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sfrost@snowman.net
Cc: netfilter@lists.netfilter.org, ipt_recent@snowman.net

>apparently.  I believe that *should* read:
>while(hash_table[hash_result] != -1 && 
>!(r_list[hash_table[hash_result]].addr == addr &&
>	(!r_list[hash_table[hash_result]].ttl || 
>r_list[hash_table[hash_result]].ttl != ttl))) {
>
>Instead.  Note that I also had to invert the ttl check, it should be
>considered a collision when the ttl doesn't match and matching ttl has
>been requested.
>

It's already inverted at '-1 && !(...)', so I'm using the original ttl 
check.

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE*  
http://join.msn.com/?page=features/virus


