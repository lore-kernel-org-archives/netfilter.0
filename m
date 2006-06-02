From: zottmann <zottmann@ig.com.br>
Subject: Possible conntrack problem
Date: Fri, 2 Jun 2006 15:46:42 -0300
Message-ID: <20060602_184642_048181.zottmann@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1149274002"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--Message-Boundary-by-Mail-Sender-1149274002
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

Hi !! 

We are seeing a lot of packets being blocked at our firewall, coming from 
our webserver, port 80, going to the several hosts at the Internet, at high 
ports, with both SET and ACK set. 

It seems that these packets are answers from our webserver to connections 
estabilished to it, and, for some reason, their state is not being kept. 

How can I track this problem? 

We are using iptables 1.3.1, kernel 2.6.11.12, in a Fedora Core 3 machine. 

Thanks in advance, 
Carlos. 




--Message-Boundary-by-Mail-Sender-1149274002--


