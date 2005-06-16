From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: Re: When do the rule apply?
Date: Thu, 16 Jun 2005 15:48:19 -0400 (EDT)
Message-ID: <Pine.LNX.4.60.0506161443530.26035@darkstar.sysinfo.com>
References: <393114f905061513012ac2216a@mail.gmail.com>
	<20050615201007.GA754@strugglers.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050615201007.GA754@strugglers.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andy Smith <andy@strugglers.net>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wed, 15 Jun 2005, Andy Smith wrote:

> On Wed, Jun 15, 2005 at 10:01:54PM +0200, Alexander Salmin wrote:
>> Hi, I guess this question is just a silly one for experts, but I can't
>> find the answer anywhere so I'm asking you guys.
>>
>> In what order do the assigned rules apply in this script?
>>
>> # Example1
>> iptables -A INPUT -j DROP # rule #1
>> iptables -A INPUT --dport 80 -j ACCEPT # rule #2
>>
>> #Example2
>> iptables -A INPUT --dport 80 -j ACCEPT # rule1
>> iptables -A INPUT -j DROP # rule2
>
> They apply in the order you've issued them since they are operating
> on INPUT and they are appending.
>
>> Will the both examples produce the same result?
>
> No; example1 drops everything to INPUT with rule 2 never being
> reached, but example2 would ACCEPT packets to port 80.. although
> wouldn't that be a syntax error without at least -p tcp or -p udp to
> tell it that it is something that has ports?
>
>> Or will rule2 in example 2 make rule1 in example2 vanish because it's
>> telling the system to drop all?
>
> No, rules don't affect other rules.  They may not be reached however.
>

The first rule in #1 is also redundant, provided the policy is set to DROP 
in the first place, which in most cases is the place to set the 
fallthrough default.

Thanks,

Ron DuFresne
- -- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         admin & senior security consultant:  sysinfo.com
                         http://sysinfo.com
Key fingerprint = 9401 4B13 B918 164C 647A  E838 B2DF AFCC 94B0 6629

...We waste time looking for the perfect lover
instead of creating the perfect love.

                 -Tom Robbins <Still Life With Woodpecker>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFCsdeGst+vzJSwZikRAoCRAJ4qj6PTTtlbKjjCjCn+f/Rgwi0ElACfa23a
LgptbS/njB0N8HdPoGrTxr4=
=MD2G
-----END PGP SIGNATURE-----

