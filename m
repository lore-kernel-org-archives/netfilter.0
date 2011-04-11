From: Andrew Beverley <andy@andybev.com>
Subject: Re: Load Balancing issue
Date: Mon, 11 Apr 2011 18:46:44 +0100
Message-ID: <1302544004.1551.8.camel@andybev>
References: <4DA2CB4D.2070402@pierce.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302544017; bh=YWdV8K0pJ25k8d+55f83qnzBwhXLMnSD+SAPE
	J/JEXk=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=b+WHbZhx
	lbSaMUV08b7Cq/6+outPAQbLk2erJAlDWUUPE3e+oapIea1dYal5a7Os/U3G3Slcfsp
	+I99iGgusdeEGbOW/bEU8OPKqYrULI24ES2o7JDNU3FZbNO2OoSM49ViYH+l0WwLvln
	dfKxcBrrQhJvSyHXqyUp3HU0+mIsg=
In-Reply-To: <4DA2CB4D.2070402@pierce.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Evan Pierce <evan@pierce.co.za>
Cc: netfilter@vger.kernel.org

On Mon, 2011-04-11 at 11:35 +0200, Evan Pierce wrote:
> All I want to do is to get all port 80 and port 443 traffic to go up the
> 4mb adsl line and the rest can go up the 512kb line.
> 
> I have the rules as follows:
> 

I do a similar thing (successfully), so comparing my rules with yours:

> ip route add table 4 default via 192.168.1.1
>

I don't think it will make any difference, but I have the device as
well:

ip route add table 4 default dev eth4 via 192.168.1.1

> iptables -t mangle -A PREROUTING -p tcp --dport 80 -s 192.168.11.0/24 -j
> MARK --set-mark 4
> iptables -t mangle -A PREROUTING -p tcp --dport 443 -s 192.168.11.0/24
> -j MARK --set-mark 4

I think your marking is fine. You don't need to save the mark of the
connection as you're not bothered about the connection as a whole - all
packets on that connection will be marked regardless as they'll always
be going to the same port numbers. Packets returning aren't marked, but
you're not doing anything with them - they should just go back to the
source host.

> iptables -t nat -A POSTROUTING -o eth4 -j SNAT --to-source 192.168.1.2
> iptables -t nat -A POSTROUTING -o eth3 -j SNAT --to-source 197.213.0.42
> ip rule add fwmark 4 table 4
> ip route flush cache
> 

Try in addition:

echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter

According to the HOWTO that I used
http://www.sysresccd.org/Sysresccd-networking_en_Iptables-and-netfilter-load-balancing-using-connmark

"You must also disable Reverse Path Filtering. It's an option enabled by
default that increases the security and prevents ip spoofing by checking
that the source address of the incoming packets matches the routing
table on the local machine"

Andy


