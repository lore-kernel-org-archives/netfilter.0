From: "John Lumby" <johnlumby@hotmail.com>
Subject: migrating ipchains to iptables
Date: Mon, 31 Mar 2003 21:27:54 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F78G1vzGbjkJ3FvTFnQ00016fee@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm running a 2.4.18-3 kernel but for strange reasons have always used 
ipchains.   Now want to switch to iptables.   Wondering if anyone has ever 
written a script which will read an ipchains file as created by

       /etc/rc.d/init.d/ipchains save

and either convert it to /etc/rc.d/init.d/iptables save format or set up the 
"corresponding" iptables chains directly.

John



_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail


