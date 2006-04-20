From: Joerg Pommnitz <pommnitz@yahoo.com>
Subject: DHCP-Daemon bypasses Linux iptables
Date: Thu, 20 Apr 2006 04:42:14 -0700 (PDT)
Message-ID: <20060420114214.85156.qmail@web51410.mail.yahoo.com>
Reply-To: Joerg Pommnitz <pommnitz@yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,
I was seriously puzzled why iptables could not stop dhcp requests from reaching ISC dhcpd. Now I found the reason: instead of listening on a UDP socket dhcpd installs a LPF similar to tcpdump or ethereal. This bypasses the protection from the firewall. What can I do to regain that protection?
 
--  Regards 
       Joerg 





