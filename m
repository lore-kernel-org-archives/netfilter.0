From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: start SNAT for new connections
Date: Mon, 30 May 2005 22:48:46 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0505302238170.4101@yvahk01.tjqt.qr>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,


the Squid web proxy (version 3) has a mode to act as a transparent proxy; 
however, the IP that shows up in the webserver (or parent webcache) is that of 
the squid, not the IP of the clients.

I thought there might be some netfilter magic I could do, but using iptables 
would require me to know the source IP in advance, which I do not.
I did/do not want to use a PF_SOCKET, because it would be too much work 
for just changing the source address.

So maybe there is a better way to do this? What I would prefer
is something like this cut-down pseudo-C code:

  int input_fd = accept(...);
  getsockname(input_fd, &source_ip, ...);
  read(input_fd, &dest_ip, ...);

  int output_fd = socket(AF_INET, SOCK_STREAM, ...);
  start_snat(output_fd, &source_ip); // some sort of bind() or whatever
  connect(output_fd, &dest_ip);

is this possible by any means? (And if I need to write
some kernelspace code, let it be...)



Regards,
Jan Engelhardt
-- 

