From: "Eric Gibson" <aithien@bellsouth.net>
Subject: iptables -f locks me out?
Date: Sat, 18 Oct 2003 15:37:23 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c395af$409f1a10$0201a8c0@ERICDEV>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hey,

    Is there anyway around this? It never used to happen with ipchains... Whenever I
run iptables -F, or stop my shorewall script with it's init script (or if there is
an error in the
config file, and it stops itself.) it completely locks me out of remote access and I
have to call up my admin and have him drive 15 miles to the site and reboot the
machine (I'm out of state).

    It's really annoying... I'm running Redhat 9.0, 2.4.20-20.9 kernel...

Eric




