From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: PREROUTING exclude
Date: Thu, 05 Sep 2002 15:09:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D775772.60604@fugmann.dhs.org>
References: <F16XvpFVjCRGryWtIIZ000009c9@hotmail.com>
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
To: Scott Ainslie <scott_ainslie@hotmail.com>
Cc: netfilter@lists.netfilter.org

Scott Ainslie wrote:
> I want the following rule to work for all machines on my subnet except 
> for 192.168.0.4. How do I exclude this single machine from this rule?
> 
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp \
> -s 192.168.0.0/24 \
> -d 0/0 --dport 80 \
> -j DNAT --to 192.168.0.4:3128
> 

The general "all but some" case, can be done by making a new chain, and 
implement fall-through in this chain.

Given the above example you could do:

iptables -t nat -N DNAT_INT
iptables -t nat -A DNAT_INT -s 192.168.0.4 -j RETURN
iptables -t nat -A DNAT_INT -j DNAT --to 192.168.0.4:3128
iptables -t nat -A PREROUTING -s 192.168.0.0/24 --dport 80 -J DNAT_INT

Or somthing in the likes of that. (I removed the -d 0/0, since its 
redundant = default, and I would also suggest adding and interface 
constraint, just to be sure).

Regards
Anders Fugmann

--
Author of FIAIF
FIAIF Is An Intelligent Firewall
http://fiaif.fugmann.dhs.org



