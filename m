From: zottmann@ig.com.br
Subject: Possible conntrack problem
Date: Thu, 1 Jun 2006 08:56:18 -0300
Message-ID: <20060601_115618_060771.zottmann@ig.com.br>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Message-Boundary-by-Mail-Sender-1149162978"
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

--Message-Boundary-by-Mail-Sender-1149162978
Content-type: text/plain; charset=ISO-8859-1
Content-description: Mail message body
Content-transfer-encoding: 8bit
Content-disposition: inline

Hi !! 

I am having a problem that I think may be related to conntrack. 

I am getting dropped packets in the firewall coming from our web server, 
source port 80, and going to external machines on high ports, with both ACK 
and SEQ numbers set. 

It seems to me that these packets are answers from our webserver to 
connections estabilished with it, but, for some reason, the connection 
information is being lost (maybe due to timeout?). 

How can I track this? Has anyone gone through something like it? 

Thanks in advance, 
Carlos. 



--Message-Boundary-by-Mail-Sender-1149162978--


