From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: can i have boolean OR between multiple addresses in
	iptablesexpression?
Date: Fri, 9 Jun 2006 09:18:00 -0400
Message-ID: <01b501c68bc7$22461990$0419a8c0@fly>
References: <20060609003246.GE24839@mini.alaya.net>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060609003246.GE24839@mini.alaya.net>
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
To: netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> prosolutions@gmx.net
> Sent: Thursday, June 08, 2006 8:33 PM
> To: netfilter@lists.netfilter.org
> Subject: can i have boolean OR between multiple addresses in 
> iptablesexpression?
> 
> 
> 
> for example i would like to have a rule with -s !127.0.0.1 OR 
> !172.16.0.0/24   

I believe you can't.  What I've done is simply create several rules with the
predicate slightly different in each to accomplish an OR.  If you'd like to
make it obvious, you can create a new chain and place your different rules
there.
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)


