From: Miguel Manso <mmanso@yahoo.com>
Subject: Linux routing scenario - is this possible?
Date: Sun, 16 Mar 2003 13:25:26 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030316212526.49666.qmail@web11504.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

I'm having a problem with linux routing and maybe
someone on the list could help me out or point me to
the right direction.

I've subscribed an DSL line (1024 kbit) that included
2 static IPs (123.123.123.100 and 123.123.123.101).

My goal is to share the line with two companies that
will have two totaly separed networks.

I've a linux machine with 3 eth's with the following
configuration:

eth0   -> 123.123.123.100  Company 1 static IP
eth0:1 -> 196.168.1.254    Company 1 gateway

eth1   -> 196.168.0.5      DSL line is connected here

eth2   -> 123.123.123.101  Company 2 static IP
eth2:1 -> 196.168.2.254    Company 2 gateway

The gateway of the router is 192.168.0.1 (DSL modem
IP).

The main idea here is having two companies on two
different networks: 192.168.1 and 192.168.2.

What I'd like to achive is:

- external connections to 123.123.123.100 should go to
the eth0 and external connections to 123.123.123.101
should go to the eth2;
- people from 192.168.1 network should connect the
outside world with IP 123.123.123.100 and people from
the 192.168.2 network should use the 123.123.123.101
IP.

Ok, this is my main goal. Am I wrong in any concept?
Is this possible?

If someone could point me to the right direction, I
would appreciate it.

Thanks a lot...


=====
Miguel Manso
mmanso@yahoo.com

__________________________________________________
Do you Yahoo!?
Yahoo! Web Hosting - establish your business online
http://webhosting.yahoo.com

