From: "Mike O" <mikeeo@msn.com>
Subject: weird netfilter problem
Date: Tue, 29 Jun 2004 13:02:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY4-F21sPlRDETxXK20008facb@hotmail.com>
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

Im trying to track down a problem Im having with iptables. For some reason 
the internal machines cannot reach the internet until I ping them from the 
iptables box. I check the conntrack tables and there still valid entries in 
there for that machine. if I reboot it works for about 5 minutes then stops. 
I tried upgrading the kernel to 2.4.26 and iptables 1.2.11 and the same 
problem happens. Any ideas? this was working fine for over 6 months then 
just starts doing this.

-Mike



