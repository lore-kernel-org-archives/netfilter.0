From: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Subject: What is wrong with this chain
Date: Mon, 6 Jan 2003 15:54:45 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <748017849.20030106155445@complexsystem.ru>
Reply-To: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
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

Hello List,
   I want to drop portscans and DOS attacks. I've found two chains on
   the internet. But after executing them my connection drops and no
   data passes firewall. Anyone can tell me where i'm wrong?
   
# Log and drop portscans:
echo -n "SCAN "
$IPTABLES -A SCAN -m limit --limit 30/m -j LOG --log-prefix "PORTSCAN " --log-ip-options --log-tcp-options --log-level 1
$IPTABLES -A SCAN -j DROP

# Log and drop DOS attacks:
echo -n "DOS "
$IPTABLES -A DOS -p tcp --syn -m limit -j LOG --log-prefix "SYN Flood "
$IPTABLES -A DOS -p icmp -m limit -j LOG --log-prefix "PING Flood "
$IPTABLES -A DOS -j DROP

-- 
Best regards,
 ITM                          mailto:ruslan@complexsystem.ru



