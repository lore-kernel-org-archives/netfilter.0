From: "Paridhi Bansal" <paridhibansal@mail.com>
Subject: help iptables queuing
Date: Wed, 18 Jun 2003 04:38:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618093855.41783.qmail@mail.com>
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

HI!!

I am using RedHat linux 7.3 with iptablesv1.2.5..I am using iptables queuing to get the packets to my application...I have used thefollowing
iptables' commands:

	iptables -t nat -A OUTPUT -j QUEUE
	iptables -t nat -A PREROUTING -j QUEUE
	iptables -t nat -A POSTROUTING -j QUEUE
	iptables -A INPUT -j QUEUE

But instead of getting all the packets,i just get first packet of every connection.For example, just first packet of TCP telnet, FTP connection (with SYN bit set and ACK not set )and not the subsequent packets.Why is this so?????

Can somebody help me with the explanation of this??????


Paridhi
-- 
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

CareerBuilder.com has over 400,000 jobs. Be smarter about your job search
http://corp.mail.com/careers


