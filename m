From: Nathan Littlepage <nathan@iwantka.com>
Subject: physdev module
Date: Tue, 13 Apr 2004 20:28:01 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404132028.01940.nathan@iwantka.com>
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

Is there something special to loading the ipt_physdev module prior to loading 
iptables rules dealing with the module? I can't for the life of me figure out 
why in my rc.firewall script the module will load on command but produce 
invalid argument when the iptables rules are executed for the -m physdev.
Yet, if I execute the script again, the -m physdev rules become active.


