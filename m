From: gb <gillian.bennett@celentia.com>
Subject: iptables with nat problems
Date: Thu, 25 Sep 2003 13:58:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064462286.4179.72.camel@rh-possum>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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



Hi,

I am running RH8 firewalls with iptables 1.2.6a. The firewalls work just
fine, but on reboot the nat part doesn't start up. It will not let
internal traffic out or external traffic in until I do a restart.

I set up ip_forward to 1 in sysctl.conf, and the script I am using loads
all necessary modules right at the start.

boot.log shows output from the script as starting without error , and
there are no errors in the messages or kernel logs either.

An iptables -L shows the tables as loaded, and iptables -t nat -L shows
that the nat tables are loaded. 

I use DHCP to the PC's on the internal lan, could this be the problem?
It starts after iptables during bootup and I wondered if this could be
stopping iptables getting the nat stuff sorted.

Thanks, Gillian




