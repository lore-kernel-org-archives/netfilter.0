From: TN <tnuro@yahoo.com.au>
Subject: accessing a internal port fowarded email server from the internal
 network
Date: Mon, 08 Dec 2003 12:39:42 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD3D65E.7000405@yahoo.com.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I have a problem which I thought I'd seen the solution so somewhere, but 
I just can't find the posting anymore.

I have an iptables firewall, and I port forward to an internal email 
server on a 192.168.10.0/24 LAN network.
This all works fine, external email comes & goes OK. My problem is that 
I want to allow internal network users to address the email server using 
the external IP address of the firewall.

Currently, laptop users internal to the network need to then become 
external when they work external to the LAN, and they have to either 
setup 2 different email accounts (one using the internal email server IP 
address, and one using the external IP address), or they have to 
remember to change their server settings each time they move from 
internal to external and vice-versa. Both of these are a pain for them.

I have attempted to allow this to work by using the following prerouting 
rules & forward rules (default policies are DROP, DROP, ACCEPT)

iptables -t nat -A PREROUTING -p tcp --dport 25 -j DNAT --to 
192.168.10.12:25
iptables -t nat -A PREROUTING -p tcp --dport 110 -d -j DNAT --to 
192.168.10.12:110
iptables -t nat -A PREROUTING -p tcp --dport 143 -d -j DNAT --to 
192.168.10.12:143

iptables -A FORWARD -p tcp -s 0/0 -d 192.168.10.12/32 --destination-port 
25 --syn -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -d 192.168.10.12/32 --destination-port 
110 --syn -j ACCEPT
iptables -A FORWARD -p tcp -s 0/0 -d 192.168.10.12/32 --destination-port 
143 --syn -j ACCEPT

These are just more generalised rules that people commonly use for doing 
port forwarding - I have just made them less strict by taking about the 
input & output constraints in an attempt to allow external & internal 
clients to access the email server via the external ip.

It doesn't work, the email client just times out, as if I'm still 
blocking some part of the data stream.
What am I doing wrong ?

thanks.
-Tim




