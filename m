From: "John Black" <black@arbbs.net>
Subject: (No subject header)
Date: Wed, 28 Jul 2004 11:01:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4107cdbf.195.321c.246791223@arbbs.net>
Reply-To: black@arbbs.net
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a NAT question for everyone.  
 
At work i have a single static IP address that all of the
computers in the LAN uses for the outside world.  My
firewall is also acting as a dns server.  
 
Question 1: When i try to ssh in to a computer from the
outside world it follows the first rule.  But when i change
ssh to listen to a certain address and port it still
defaults to the first rule?
 
Question 2: if the DNS server was running on a server behind
the firewall would this help sloves this problem?
 
 
thanks
john

