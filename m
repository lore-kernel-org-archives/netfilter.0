From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Reserving bandwidth with iptables
Date: Thu, 18 May 2006 09:16:16 -0400
Message-ID: <00b401c67a7d$3ecb9d70$0419a8c0@fly>
References: <20060518_131118_033947.zottmann@ig.com.br>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060518_131118_033947.zottmann@ig.com.br>
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
To: 'zottmann' <zottmann@ig.com.br>, netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of zottmann
> Sent: Thursday, May 18, 2006 9:11 AM
> To: netfilter@lists.netfilter.org
> Subject: Reserving bandwidth with iptables
> 
> Is this feasible? Can we reserve bandwidth with iptables 
> alone, or shoule we 
> use another product as well? 

I use 'tc' (traffic control) to shape my 'classified' traffic and iptables
to classify.  When I researched 'tc', I saw you can reserve bandwidth and
have it dynamically allocated to other areas when it's not needed.

In short, look into 'tc'

Cheers,
-pablo


