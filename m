From: Jared Cook <jared@vsahost.com>
Subject: Using NAT to relay traffic
Date: Wed, 23 Mar 2005 17:57:41 -0600
Message-ID: <42420275.7030909@vsahost.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I have two servers on two different networks.  I am running a service on 
box A that I am transitioning to box B.  While I wait on DNS to 
propagate, I would like to do some iptables magic to send traffic from 
box A to box B using NAT.  For instance, when pop3 email users connect 
to box A, I would like box A to send the request to box B 
transparantly.  Is this possible?  I have had success doing port 
forwarding to the local machine, but when I specify box B as the "--to", 
it doesn't work.  Any help would be greatly appreciated.

Thanks,
Jared

