From: "ctg60 ctg60" <ctg60@msn.com>
Subject: Combination of state match and source/destination match problem.
Date: Wed, 04 Aug 2004 20:26:59 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY11-F4AkOhw2RlC6a000063d2@hotmail.com>
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

Hi all,

Sorry for my English.

I just want to figure out the relation between state match and IP address 
(source and destination ) match of iptables.  And my Redhat 9.0 box which 
has a static IP address of 192.168.220.8 has a ssh service runing on tcp 
port 22.  And my client Linux box with
IP address 192.168.220.6 try to ssh my RH9 box.

Here is my simple iptables rule on 192.168.220.8.

#iptables -F
#iptables -F -t nat
#iptables -F -t mangle
#iptables -P INPUT DROP
#iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
#iptables -A INPUT -s 192.168.220.6 -j ACCEPT

To my understanding, the INPUT chain of 192.168.220.8 box here deny all the 
external NEW connetions INCLUDING connetions from 192.168.220.6. And the 
result is exact what
I expected. I can't ssh my RH9 box from 192.168.220.6 as well as other 
boxes.

But when I change the iptables to:
#iptables -F
#iptables -F -t nat
#iptables -F -t mangle
#iptables -P INPUT DROP
#iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
#iptables -A INPUT -d 192.168.220.8 -j ACCEPT

This time it works, I can ssh 192.168.220.8 from 192.168.220.6. Even when I 
replace the last rule with
#iptables -A INPUT -p tcp --dport 22 -j ACCEPT
it also works.

So this time it means INPUT chain of 192.168.220.8 box here deny all the 
external NEW connetions EXCEPT connetions to 192.168.220.8 OR destination 
port 22.
But this conflicts with previous one. According to the previous example this 
doesn't work.

So my question is what's the relation between state match and 
source/destination match?
Or maybe which one comes first or who's seting overwrite the other?

It makes me confused.And it's really hard for me to look into the kernel 
source for answers.

Thanks and Regards,
George Ma

_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus


