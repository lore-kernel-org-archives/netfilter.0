From: Brian Austin - Standardknit <brian@standarduniversal.com.au>
Subject: Re: MAC Hash
Date: Fri, 26 Sep 2008 10:56:13 +1000
Message-ID: <48DC332D.5030905@standarduniversal.com.au>
References: <604608.25377.qm@web37308.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <604608.25377.qm@web37308.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sky_jason@yahoo.com
Cc: netfilter@vger.kernel.org


-----Original Message -----
 From: Jason Cosby
 Sent: 26/09/2008 8:18 AM
> All,
>
> I have the following running on our server:
>
> for m in xx:xx:xx:xx:xx:xx...about 75 MACs
> do
>   iptables -t mangle -A PREROUTING -i eth1 -m mac --mac-source $m -j ACCEPT
> done
>
> iptables -t mangle -A PREROUTING -i eth1 DROP
>
> iptables -t mangle -A PREROUTING -i eth1 -m iprange ! --src-range \
>    192.168.1.1-192.168.1.74 -j DROP
>
> and encountered a noticable slowdown when I incorporated the above. Can anyone offer suggestions as to how to speed this up? I know that hash tables are out there, but I am not clear on their use. 
>
> Thanks,
> Jason
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>   
I would suggest the problem is your chain of 75 rules...

You may want to make some stubby user chains and branch the tests out, 
so packets go thru less checks.

ie 7 user chains, with 10 checks in each

so the worst case for chain traversal would be around 17 rules 
traversed, not 75, with an average of 8 rules, not 37....

and put your busiest mac addresses at the top of the checks if you can.

regards

b




