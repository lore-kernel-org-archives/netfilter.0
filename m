From: Tsuyoshi Takada <acroyear@gmx.ch>
Subject: iptables limit-burst trouble
Date: Mon, 09 Jun 2003 11:22:21 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030609111735.C484.ACROYEAR@gmx.ch>
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


Hi,

I want to limit Web DoS attack.

I have set the following but it does not work well.

iptables -N flood-chk
iptables -A INPUT     -p tcp --dport 80 --syn -j flood-chk
iptables -A flood-chk -m limit --limit 1/sec --limit-burst 2 -j RETURN
iptables -A flood-chk -j LOG --log-prefix "IPTABLES HTTP FLOOD-PACKET"
iptables -A flood-chk -j DROP

After I accessed to my web site,
I pushed reload button of my web browser repeatedly but 
I was not denied by iptables.
Why?

regards,

-- 
Tsuyoshi Takada <acroyear@gmx.ch>



