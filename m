From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: maximum tuple support of hashlimit
Date: Tue, 31 Oct 2006 08:58:19 -0500
Message-ID: <013301c6fcf4$9f019a60$0419a8c0@fly>
References: <002101c6fcd3$1ef3a1e0$6f00a8c0@synapse.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002101c6fcd3$1ef3a1e0$6f00a8c0@synapse.com>
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
To: 'Manish Jain' <manish.jain@globallogic.com>, netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Manish Jain
> Sent: Tuesday, October 31, 2006 4:59 AM
> To: netfilter@lists.netfilter.org
> Subject: maximum tuple support of hashlimit
> 
> Hello Friends,
> 
> I am using hashlimit with hashlimit-mode as srcip-dstip. My 
> expectation is
> to have hashlimit for source-ip and destination ip tuple.
> 
> My question is, how many tuple, hashlimit can manage at any 
> instance of
> time?

Hi,

I'm not entirely sure about your question.  The 'man iptables' shows for
'hashlimit' the following two tunable parameters which may address your
question(?):

       --hashlimit-htable-size num
              The number of buckets of the hash table

       --hashlimit-htable-max num
              Maximum entries in the hash

Cheers,
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)


