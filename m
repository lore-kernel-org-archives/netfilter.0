From: kelly <kelly@cliffhanger.com>
Subject: Re: General NAT
Date: Wed, 08 Feb 2006 11:56:37 -0600
Message-ID: <28895.4624826603$1139424547@news.gmane.org>
References: <000701c62cc3$528ac9b0$7b82a8c0@aladin>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <000701c62cc3$528ac9b0$7b82a8c0@aladin>
Content-disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Master <account@netje.nl>
Cc: netfilter@lists.netfilter.org


In regards to the routing, use the "iproute2"
tool. http://www.policyrouting.org/

What does your interface configs look like?

	i.e., ip addr <enter>

What does your current routing table look like?

	i.e., ip route <enter>

-- 
kelly
http://home1.gte.net/res0psau/index.html#Hang-Gliding-Stuff

	   --    -- 
	     \  /
	      \/
	      /\
	     /  \
	   --    --



Quoting Master <account@netje.nl>:
        Hi,
         
        I am new to IPTABLES. I have used Cisco stuff for many years, but am now moving to real world ???
         
        I need to get a DNAT/SNAT in/out working. The IN part seem to be working, but the route OUT seem to be the problem.
         
        Example:
        On the out-side, I have address 10.10.10.40, at port 11022 (SSH) on eth1
        I need to NAT this to 192.168.1.101:22 (real port) on eth2
        I also need to make sure that the host is able to get out on 10.10.10.40 and not on the default route of route.
         
        Can anyone send me a clue on this?
         
        Regards,
           Richard
        
        

