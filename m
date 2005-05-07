From: "Robert M. Marmorstein" <rmmarm@CS.WM.EDU>
Subject: Blank Targets
Date: Sat, 7 May 2005 06:34:28 -0400 (EDT)
Message-ID: <Pine.LNX.4.58.0505070630490.20558@th107a-5.cs.wm.edu>
References: <20050507061131.C7CF411B075@mail.cs.wm.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050507061131.C7CF411B075@mail.cs.wm.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

While testing out the graphical tool "firestarter" I noticed that it 
creates a TTL match rule with no target.  iptables -L -n I get:

Chain OUTPUT (policy DROP)
target     prot opt source               destination
DROP       all  --  0.0.0.0/0            0.0.0.0/0           state INVALID
           all  --  0.0.0.0/0            0.0.0.0/0           TTL match TTL 
== 64
ACCEPT     icmp --  192.168.1.0/24       0.0.0.0/0


There is no chain named "      ".  Is this unusual?  What happens to 
packets that match the TTL rule?

Thanks for any input!

Robert


