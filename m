From: Paulo Andre <pandre@darkstar.nom.za>
Subject: Iptables error
Date: Wed, 25 Aug 2004 10:19:46 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200408251019.46720.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

This morning I rebooted one of our firewalls, I have created a new kernel for 
it (2.4.20, patched kernel with latest p-o-m ng). 
When I run my firewall script, all I get is errors, seems to be a problem with 
iptables 'tables' as none of the rules are create but the default policies 
are in place, in dmesg I have the following error:

ip_tables: table screwed up!

This firewall is a production server and I can only really take it down 
tonight to check it, anyone had something like this before?

Paulo


