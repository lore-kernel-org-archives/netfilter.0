From: Robert Cole <robert.cole@support4linux.com>
Subject: iptables module load error
Date: Mon, 19 May 2003 13:45:32 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305191345.32430.robert.cole@support4linux.com>
Reply-To: robert.cole@support4linux.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I get this:

fw root # insmod ip_tables
Using /lib/modules/2.4.20-hardened-r2/kernel/net/ipv4/netfilter/ip_tables.o
/lib/modules/2.4.20-hardened-r2/kernel/net/ipv4/netfilter/ip_tables.o: 
unresolved symbol nf_unregister_sockopt
/lib/modules/2.4.20-hardened-r2/kernel/net/ipv4/netfilter/ip_tables.o: 
unresolved symbol nf_register_sockopt
fw root #

When trying to load the ip_tables.o module and it causes problems on down the 
line with other modules not loading. 

Anyone have any idea how to fix this? I'm running kernel 2.4.20. I have 
everything under the netfilter section marked as a module except for realm 
match support (because the kernel fails to compile with it).

Thanks,
Robert

