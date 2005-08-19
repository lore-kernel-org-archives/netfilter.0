From: "Henrique Duran" <hduran@terra.com.br>
Subject: IPTABLES suddenly stop
Date: Thu, 18 Aug 2005 21:42:37 -0300
Message-ID: <20050819004242.D66C744C013@soluezi.terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

            Recently I have configured na Iptables Firewall with transparent
proxy (squid) on a Debian RC3.01 machine. The machine is a pentium 3, with
600MHz and 196 MB of RAM. The script is working fine, there is no problem
with the rules, but a strange thing happens. 

Sometimes the internet connection suddenly stops. The external interface
stop responding. To solve the problem, sometimes I only restart the
interface (ifdown eth0; ifup eth0) bot sometime it doesn't work and the only
solution is to reboot the machine.

I have already checked /proc/net/ip_conntrack, the logs and restarted the
firewall script, but I can only reestablish the service rebooting the
machine.

