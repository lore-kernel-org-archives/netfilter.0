From: enjoy.the.silence@iol.it
Subject: Re: problem with DNS server behind nat/packet filter
Date: Fri, 09 May 2003 15:48:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030509134820.4146.qmail@zero.sukkonet.it>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

i have the following roules in nat/PREROUTING: 

Chain PREROUTING (policy ACCEPT 89 packets, 5600 bytes)
pkts bytes target     prot opt in     out     source               
destination
   0     0 DNAT       tcp  --  any    any     anywhere             anywhere  
tcp dpt:webcache to:10.0.6.6:80
   0     0 DNAT       tcp  --  any    any     anywhere             anywhere  
tcp dpt:domain to:10.0.6.5
   3   193 DNAT       udp  --  any    any     anywhere             anywhere  
udp dpt:domain to:10.0.6.5 

i guess the third one might be the one that is doing the wrong job. 
although, it should only alter incoming packets on port 53 to my external ip 
so that they go to the internal box which is running the dns server. it 
should not touch the source address which will be become the destination 
address of the dns replies. or am i wrong? 

thank for now!

