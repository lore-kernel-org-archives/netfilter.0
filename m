From: "vipin mehta" <vipin_mehta@hotmail.com>
Subject: Changing TCP header using Netfilter
Date: Sat, 08 Feb 2003 03:07:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F42rf3yXvEbjkyqU7a000000773@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,
   I am implementing a connection failure resistant server side TCP. At some 
point, the implementation demands to change the TCP sequence number and 
window size of the outgoing packets. I have been using the QUEUE target 
confidently all this while for bringing the packets to the user space and 
analysing and then releasing them back into the kernel but I had not 
realized that I cant 'change' the packet and reinsert it. I can only ACCEPT 
or DENY the packet. Is there any way to change the TCP header information of 
the outgoing packet from the user space. I would not like to go into the 
ip_queue_xmit function and do the same. Please advise.

Regards,
Vipin





_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


