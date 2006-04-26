From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Login load balancing
Date: Wed, 26 Apr 2006 14:20:36 -0400
Message-ID: <017e01c6695e$1e77d550$0419a8c0@fly>
References: <444FAEFF.1040100@uvic.ca>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <444FAEFF.1040100@uvic.ca>
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
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Drew Leske
> Sent: Wednesday, April 26, 2006 1:34 PM
> To: netfilter@lists.netfilter.org
> Subject: Login load balancing
> 
> The only half-solution I have come up with so far is to define a
'director'
> box with the 'bob' alias, and then periodically grab load metrics from the
> participating hosts, determine of the 'bob's which is the least loaded,
and
> then *cough* update a DNAT rule to redirect requests coming in for 'bob'
to
> the least-loaded 'bobX'.

Hi Drew,

I believe the above is what you'll want to implement.  As your research has
probably already shown, the load balancers in the market are for HTTP.  A
good load balancer will need to communicate with the backend clients so it
has data on load and other metrics necessary for it to make a decision on
which server to serve.

You could use wget to fetch metrics from all the servers (include a
timestamp so you know when your data is stale) and have the director
consider this information when it punches down new IPTABLEs rules.

Cheers,
-pablo


