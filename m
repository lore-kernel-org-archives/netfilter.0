From: "Ravi Verma" <ravi.verma@telecommand.com>
Subject: Iptables ACCEPT and DROP
Date: Fri, 16 Apr 2004 10:56:17 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c423dc$1e471a10$8101a8c0@TELECOMME9F58X>
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

Dear Friends:

I have observe a behavior of iptables which I need to understand.

216.155.193.168 is the IP address of Yahoo's messenger site and it
listens on port 5050.

The following command will allows the machine to connect to
216.155.193.168.

iptables -A OUTPUT -o eth0 -p tcp -d 216.155.193.168 --dport 5050 -j
ACCEPT

After that, I see output like following:

#telnet 216.155.193.168 5050
Trying 216.155.193.168...
Connected to 216.155.193.168.
Escape character is '^]'.

Now when I issue
iptables -A OUTPUT -o eth0 -p tcp -d 216.155.193.168 --dport 5050 -j
DROP And iptables -A OUTPUT -o eth0 -p tcp -d 216.155.193.168 --dport
5050 -j REJECT

Still, it allows connection to 216.155.193.168 on port 5050.

How does this work? It seems -j DROP is not opposite of -j ACCEPT. How
can stop this?

Kind regards.

Ravi Verma


