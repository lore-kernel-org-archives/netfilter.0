From: "ISLERO77@telefonica.net" <ISLERO77@telefonica.net>
Subject: Problems loading a Patch-O-Matic match
Date: Mon, 17 Mar 2003 19:16:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <b61abf69.bf69b61a@teleline.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: es
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
To: netfilter@lists.netfilter.org


Hi, I'm trying to load the mport match. I have made all the steps, I have 
made the new kernel and all of that, but the file 
/usr/src/iptables/libipt_mport.so doesn't exist, so I can't use this match. 
 
for example, if I write iptables -A INPUT -p tcp -m mport --ports 20:23,80 -j 
DROP 
the answer that I receive is:  
iptables v1.2.5: Couldn't load match `mport':/usr/lib/iptables/libipt_mport.so: 
cannot open shared object file: No such file or directory 
 
 
There are two mport files that are created: 
 
   /usr /src/linux-2.4.18.SuSE/include/config/ip/nf/match/mport/module.h 
and 
   /lib/modules/2.4.18-64GB-SMP/kernel/net/ipv4/netfilter/ipt_mport.o 
 
Does anybody know what can I do? 
 
	Thanks, 
 
	Juan. 
 


