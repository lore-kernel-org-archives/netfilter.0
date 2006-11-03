From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: hashlimit bucket
Date: Fri, 3 Nov 2006 09:56:31 -0500
Message-ID: <001c01c6ff58$3fded190$0419a8c0@fly>
References: <006f01c6ff42$75dbc7a0$6401a8c0@apollosjf>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006f01c6ff42$75dbc7a0$6401a8c0@apollosjf>
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
To: 'woger151' <woger151@jqpx37.cotse.net>, netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of woger151
> Sent: Friday, November 03, 2006 7:20 AM
> To: netfilter@lists.netfilter.org
> Subject: hashlimit bucket
> 
> Can one have multiple iptables rules with hashlimit 
> statements, with the 
> same --hashlimit-name? 

Yes.

> And would that means there's actually 
> just one bucket 
> for all those rules? 

Not one bucket but one hash table.  You probably already know this but a
hash table is simple an array with a 'function' to map a value to an index
in the array.  Each cell in the array is a 'bucket' in hash terminology.
When there are more than one value which map to the same 'bucket', a 'chain'
is created.  Ideally with the correct hash function, the chains are small as
the function is random enough.

I haven't looked at the hashlimit code but I imagine the hash function is
based on the tuple specified:  dstip, dstport, etc.

> Can one have multiple hashlimit rules, 
> period? 

I'm not sure what you mean by this ... would you please elaborate?

> What 
> about different chains feeding into one chain with a 
> hashlimit statement? Is 
> that OK?

Recall that hashlimit stores all hash tables in /proc/net/ipt_hashlimit  A
file is created per --hashlimit-name  With that in mind, any iptables rule
can manipulate a given --hashlimit-name.  If you don't specify a
--hashlimit-name, DEFAULT will be used.

I hope that helps.

Cheers,


