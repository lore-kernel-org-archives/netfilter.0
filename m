From: Patrick <boysdk@hotmail.com>
Subject: Urgent: Please help me about block port 80
Date: Thu, 20 May 2004 16:39:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40AC6EA8.69A94AF4@hotmail.com>
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

Dear sir/madam,

My goal is to allow only one IP(192.168.1.10) to access my server via
port 80 or 8080 and forward all request from port 80 to port 8080.

What I do is as below.

*nat
:PREROUTING ACCEPT [1:48]
:POSTROUTING ACCEPT [3:230]
:OUTPUT ACCEPT [3:230]
-A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-ports 8080
COMMIT
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Lokkit-0-50-INPUT - [0:0]
-A INPUT -j RH-Lokkit-0-50-INPUT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp -s 192.168.1.10/255.255.255.255
--dport 8080 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp -s 192.168.1.10/255.255.255.255
--dport 80 --syn -j ACCEPT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
COMMIT

It seems that the port 80 and 8080 open to public after I add prerouting
rule.  Would you mind how I could acheive my goal?  Thanks a lot.

Best regards,
Patrick

