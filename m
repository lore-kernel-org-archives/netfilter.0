From: "Afshin Lamei" <linux_st@hotmail.com>
Subject: publishing 2 web server on one valid IP
Date: Mon, 29 Sep 2003 15:42:49 +0330
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law15-F11L2m9lHiu3f0003d05e@hotmail.com>
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

hi
I have 2 web servers in my DMZ. when there was one, I used DNAT to publish 
the single web server on port 80 of the external interface of my firewall. 
now I don't know how to distinguish between the requests of 2 web servers, 
because I have only one IP address available for the external interface.
Is there any solution using iptables, to know that which http request must 
be DNAT to which web server?
regards,
afshin

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


