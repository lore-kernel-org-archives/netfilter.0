From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: help iptables queuing
Date: Wed, 18 Jun 2003 20:55:56 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDAEOLNEAA.georgev@citadelcomputer.com.au>
References: <20030618093855.41783.qmail@mail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030618093855.41783.qmail@mail.com>
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
To: Paridhi Bansal <paridhibansal@mail.com>, netfilter@lists.netfilter.org

DId you use `iptables -N QUEUE` ?
Your QUEUE table would only work for tables in the "filter", so it only
works for INPUT, FORWARD and OUTPUT and not the table of "nat" table.

For some reason I couldn't create a QUEUE which different tables could cross
over.. ie. -t nat can't  -j to a QUEUE which is created in -t filter.... get
it..

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Paridhi Bansal
Sent: Wednesday, June 18, 2003 7:39 PM
To: netfilter@lists.netfilter.org
Subject: help iptables queuing


HI!!

I am using RedHat linux 7.3 with iptablesv1.2.5..I am using iptables queuing
to get the packets to my application...I have used thefollowing
iptables' commands:

	iptables -t nat -A OUTPUT -j QUEUE
	iptables -t nat -A PREROUTING -j QUEUE
	iptables -t nat -A POSTROUTING -j QUEUE
	iptables -A INPUT -j QUEUE

But instead of getting all the packets,i just get first packet of every
connection.For example, just first packet of TCP telnet, FTP connection
(with SYN bit set and ACK not set )and not the subsequent packets.Why is
this so?????

Can somebody help me with the explanation of this??????


Paridhi
--
__________________________________________________________
Sign-up for your own FREE Personalized E-mail at Mail.com
http://www.mail.com/?sr=signup

CareerBuilder.com has over 400,000 jobs. Be smarter about your job search
http://corp.mail.com/careers




