From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter question
Date: Thu, 19 Feb 2004 13:17:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402191317.32575.Antony@Soft-Solutions.co.uk>
References: <004f01c3f699$0ad70a00$ed02fea9@black> <008301c3f6c1$1cbceb90$6a02a8c0@klemen> <000501c3f6e9$3d4a53c0$ed02fea9@black>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c3f6e9$3d4a53c0$ed02fea9@black>
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
To: netfilter@lists.netfilter.org

On Thursday 19 February 2004 1:06 pm, John Black wrote:

> > $IPT -A POSTROUTING -t nat -s $IP_LAN_RNG -o $IF_NET -j SNAT --to-source
> > $IP_NET
>
> i have that line in my firewall script. but it still doesn't mask my
> internet work

Please post your complete ruleset, including the definitions of variables such 
as $IP_LAN_RNG, so we can see if there's something wrong.   By all means 
disguise any public IP's if you wish, but not so much that we can't tell 
which one is which (if you have more than one).

Please also tell us how you are testing the rules and why you think it doesn't 
work (I know that may sound obvious, but every little helps...)

Regards,

Antony.

-- 
Your work is both good and original.  Unfortunately the parts that are good 
aren't original, and the parts that are original aren't good.

 - Samuel Johnson

                                                     Please reply to the list;
                                                           please don't CC me.


