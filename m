From: Dmitri <dk-netfilter@nth.ca>
Subject: matching -d to a given interface without specifying ip address
Date: Sat, 02 Sep 2006 18:32:44 -0400
Message-ID: <44FA068C.1000202@nth.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Is there a way to define a condition "those packets whose destination is 
the IP address of the given interface" without specifying the actual IP 
address? (it changes, thus needs to be detected and updated)

I want to be able to distinguish those packets addressed to the box, to 
be forwarded, from those just passing through it. (-i matches both)

Such packets can be discovered in the INPUT chains, after the "routing 
decision", but by then it's too late to do DNAT.

Thanks,

--Dmitri

