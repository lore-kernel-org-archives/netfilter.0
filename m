From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT matching question
Date: Sun, 29 Sep 2002 16:12:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929151220.BHYV6699.mta01-svc.ntlworld.com@there>
References: <Pine.GSO.4.44L-027.0209291005290.1180-100000@unix4.andrew.cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.44L-027.0209291005290.1180-100000@unix4.andrew.cmu.edu>
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
To: netfilter@lists.netfilter.org

On Sunday 29 September 2002 3:15 pm, Mohan Khurana wrote:

> I'm trying to use the equalize nexthop iproute2 command with netfilter in
> order to load balance between two ISPs on this router.  Equalize gives me
> different gateway IPs on route determination.  The problem is, if I have
> two different ISPs, I think I want something in the NAT table that would
> determine which gateway the packet was going out of in order to match it
> to the right --to-source address.

Okay - I understand why you want to change the source address now, however I 
think you're attempting to set it to the wrong value.   If you set the source 
address of a packet to be the next hop router you're just about to send it 
to, then the reply will get back to that router and no further.

I assume your network setup is something like this:

Internet
    |
ISP no. 1
    |
Router 1
    |
Public IP 1
   eth0
Netfilter box eth2 ------- Local network with private addresses
   eth1
Public IP2
    |
Router 2
    |
ISP no 2
    |
Internet

You need to SNAT to Public IP 1 if you're sending via ISP 1, and Public IP 2 
if you're sending via ISP 2.

Therefore I suggest you use the following rules in your POSTROUTING chain:

iptables -A POSTROUTING -t nat -o eth0 -j SNAT --to $pubIP1
iptables -A POSTROUTING -t nat -o eth1 -j SNAT --to $pubIP2

(Note that PubIP1 is not 1.2.3.4 - that address is on router 1.   Similarly 
PubIP2 is not 5.6.7.8 - that address is on router 2.)

Then when the replies come back in again (they will come through the same ISP 
as the outbound packet left, because that's the way PubIP1 and PubIP2 are 
routed), they will reach the netfilter box, which can do the reverse NAT, and 
send the packets on to the original source somewhere inside your LAN.

Just don't ask about how to do this for incoming connections (ie servers on 
your network instead of clients).

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

