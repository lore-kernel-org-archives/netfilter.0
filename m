From: David Reta <DavidR@Narus.com>
Subject: New to IP Tables
Date: Wed, 13 Nov 2002 16:14:33 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <580E532D9F7A9B4BAE8A130848E0DDA702A0B74F@franklin.narus.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

	I just started using IP Tables and have a question. I was not able
to find the answer in any of the docs I've read so far.
I have a machine that I am using as a router and running Ip Tables on it.
Here is a list of my tables.

[root@qa-gate root]# iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp-data

ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain 
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:26 
DROP       tcp  --  anywhere             anywhere           

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain test (0 references)
target     prot opt source               destination

I am not able to pass any data through the router. Here is the scenario, I
want to access a Web Site which is on the other side of the router. The way
that I interpret this is that the packet will get passed to the first chain
which is
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http
and be let through, yet this is not happening. All tcp traffic is being
blocked which is defined by my 6th rule. I guess I am not understanding
this, but I would think that the packet would match the first rule and be
passed through and the following chains would be ignored. My logic is
probably wrong.

Thanks,
David



