From: Michael Hale <michaelh@cipheroptics.com>
Subject: bridge conflicting subnets together using NETMAP
Date: Fri, 3 Dec 2004 02:48:14 -0500
Message-ID: <AFEF35BA-44FF-11D9-A098-000A95C4BF56@cipheroptics.com>
Mime-Version: 1.0 (Apple Message framework v619)
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

I was wondering if it is possible to bridge two conflicting subnets 
with the NETMAP rule in such a way that they don't conflict?  The 
problem I am trying to solve is our lan uses 192.168.0.0/255.255.192.0 
and sometimes users establish a bridged vpn connection from their own 
lan which is very often 192.168.1.0/255.255.255.0.  My thought was that 
if there is someway to use the NETMAP rule to make both lans think they 
are talking to a virtual address space that does not conflict with 
anything, then everybody would be happy.  Has anyone already done 
something like this?  Any examples would be greatly appreciated.

Thanks, Michael


