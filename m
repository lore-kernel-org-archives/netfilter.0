From: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Subject: Iptables -m limit problem
Date: Fri, 10 Jan 2003 11:32:16 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6337869200.20030110113216@complexsystem.ru>
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

Hello netfilter list,
I want to limit connectionss to http port to maximum 2 persecond from
one host. I wrote the following line but it's not working :(

/usr/local/sbin/iptables -A ip_limit -p tcp --dport 80 -m limit --limit 2/second -j ACCEPT
/usr/local/sbin/iptables -A INPUT -j ip_limit

-- 
Best regards,
 ITM                          mailto:ruslan@complexsystem.ru



