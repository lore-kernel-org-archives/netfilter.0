From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: iptables management problem
Date: Wed, 04 Dec 2002 09:30:36 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c29bba$db98c600$6601a8c0@s3ac>
References: <F139OSnJTycBI0c0deU0002173e@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <F139OSnJTycBI0c0deU0002173e@hotmail.com>
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
To: 'Afshin Lamei' <linux_st@hotmail.com>, netfilter@lists.netfilter.org


> 
> I have installed the Iptables 1.2.6a according to the 
> netfilter's document, 
> but It doesn't act as a service.
> Do I need to manually setup my firewall after each system 
> boot up? --afshin
> 

IPTABLES actually is a ruleset for the kernel regarding network traffic.
In order to to enable the firewall at each boot you need to create a
boot script that loads the rules on each boot.

Read the following link
http://www.e-infomax.com/ipmasq/


