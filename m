From: Ruslan Spivak <alienoid@is.lg.ua>
Subject: MARK and ! question: one more question
Date: Fri, 27 Jun 2003 11:04:15 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFBFA7F.3080304@is.lg.ua>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Wilson <chris@netservers.co.uk>
Cc: netfilter@lists.netfilter.org

Hello.

Yesterday you helped me with my question:

iptables -t mangle -N setmark
iptables -t mangle -A setmark -s   193.220.70.0/27  -j RETURN
iptables -t mangle -A setmark -s   193.108.240.0/22 -j RETURN
iptables -t mangle -A setmark -d ! 193.220.70.32/27 -j RETURN
iptables -t mangle -A setmark -j MARK --set-mark 107
iptables -t mangle -A POSTROUTING -j setmark

It makes logic: NOT from src1 AND NOT from src2 AND dst=some_dst_addr 
THEN mark packet with 107

Can you help me to construct logic: (from src1 OR from src2) AND 
dst=some_dst_addr THEN mark packet with 108
Possible form: (from src1 OR from src2 OR from src3 OR ... and so on) 
AND dst=some_dst_addr THEN mark packet with 108

Can you give me an example with above networks? - i mean packets with
(src=193.220.70.0/27 or with src=193.108.240.0/22) and 
dst=193.220.70.32/27 will be marked with 108.

Your help is very, very appreciated.
Thanks in advance.

Best regards,
Ruslan




