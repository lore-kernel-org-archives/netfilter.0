From: Jamie Pratt <jamie@nucdc.org>
Subject: Re: accessing a internal port fowarded email server from the internal
 network
Date: Tue, 09 Dec 2003 08:13:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FD5CA97.9020400@nucdc.org>
References: <3FD3D65E.7000405@yahoo.com.au>
Reply-To: jamie@nucdc.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FD3D65E.7000405@yahoo.com.au>
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

hi - I may be wrong, but there is probably nothing iptables can do for 
you here on this - you should just give your public ip a dns A record 
(probably has one already, or MX at least?) in the internet DNS, and 
then set up a small DNS server on your internal lan/network and just add 
an A record with the same hostname, but pointing to the private IP 
instead. .. - set the users up to see the internal DNS address first in 
the list, then just make the users always use the hostname, and all 
should be work no matter where they are..

(I had this same problem but on a cisco pix firewalled network - 
luckily, the pix is intelligent enough to do this on it's own, but that 
was *going* to be how i solved the same problem)

if this doesn't work, or appeal to you, google for 'netsh' - a windows 
util that will change connection settings via a short script that you 
can set up on a user's laptop..

regards,
jamie

TN wrote:

> Hi all,
> 
> I have a problem which I thought I'd seen the solution so somewhere, but 
> I just can't find the posting anymore.
> 
> I have an iptables firewall, and I port forward to an internal email 
> server on a 192.168.10.0/24 LAN network.
> This all works fine, external email comes & goes OK. My problem is that 
> I want to allow internal network users to address the email server using 
> the external IP address of the firewall.
> 
> Currently, laptop users internal to the network need to then become 
> external when they work external to the LAN, and they have to either 
> setup 2 different email accounts (one using the internal email server IP 
> address, and one using the external IP address), or they have to 
> remember to change their server settings each time they move from 
> internal to external and vice-versa. Both of these are a pain for them.
> 
> I have attempted to allow this to work by using the following prerouting 
> rules & forward rules (default policies are DROP, DROP, ACCEPT)
> 
> iptables -t nat -A PREROUTING -p tcp --dport 25 -j DNAT --to 
> 192.168.10.12:25
> iptables -t nat -A PREROUTING -p tcp --dport 110 -d -j DNAT --to 
> 192.168.10.12:110
> iptables -t nat -A PREROUTING -p tcp --dport 143 -d -j DNAT --to 
> 192.168.10.12:143
> 
> iptables -A FORWARD -p tcp -s 0/0 -d 192.168.10.12/32 --destination-port 
> 25 --syn -j ACCEPT
> iptables -A FORWARD -p tcp -s 0/0 -d 192.168.10.12/32 --destination-port 
> 110 --syn -j ACCEPT
> iptables -A FORWARD -p tcp -s 0/0 -d 192.168.10.12/32 --destination-port 
> 143 --syn -j ACCEPT
> 
> These are just more generalised rules that people commonly use for doing 
> port forwarding - I have just made them less strict by taking about the 
> input & output constraints in an attempt to allow external & internal 
> clients to access the email server via the external ip.
> 
> It doesn't work, the email client just times out, as if I'm still 
> blocking some part of the data stream.
> What am I doing wrong ?
> 
> thanks.
> -Tim
> 
> 
> 
> 
> 
> 



