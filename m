From: xavier renaut <list.netfilter=W+vduneg5OqcvWdFBKKxig@public.gmane.org>
Subject: nat, filter, and mangle order
Date: Tue, 8 Jul 2003 15:44:24 -0400
Sender: netfilter-admin=wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <20030708194424.GD17630@natch.8d.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter=wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org


Hello,

here is the scheme for the filter table :



                          _____
Incoming                 /     \         Outgoing
       -->[Routing ]--->|FORWARD|------->
          [Decision]     \_____/        ^
               |                        |
               v                       ____
              ___                     /    \
             /   \                   |OUTPUT|
            |INPUT|                   \____/
             \___/                      ^
               |                        |
                ----> Local Process ----


in which order are processed the nat, filter, mangle for the OUPUT chain
for example ?

if i generate a packet locally, will it hit the nat or the filter table
first ? (in the OUTPUT context)

thanks


-- 
xavier

