From: Hitesh Ballani <hb69@cornell.edu>
Subject: tunneling and iptables
Date: Tue, 09 Mar 2004 21:52:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
References: <00c001c40644$19931970$6cfaa8c0@Defiant>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00c001c40644$19931970$6cfaa8c0@Defiant>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

i was stuck with the interaction of iptables and tunneling ...if i have an 
ip-ip tunnel, are the ip hooks checked for both the outer and the inner ip 
header ?

Also,  the mark extension allows you to mark packets with 16-bits marks 
which is big enough to encode the port number, but if i try to add policy 
routing on the fly using the ip rules command then i get screwed because 
the table-id (for specifying which table has the rules to route this 
packet) is only 8-bits and so, I cannot encode the port numbers in there 
... i know this is not a clear description but if you know anything about 
this problem, i would be more than happy to spell the details out...

Thanks,

Hitesh


