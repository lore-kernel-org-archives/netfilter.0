From: "Nix N. Nix" <nix@go-nix.ca>
Subject: Re: New to IP Tables
Date: 13 Nov 2002 20:41:26 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037238085.6792.51.camel@tux.go-nix.ca>
References: <580E532D9F7A9B4BAE8A130848E0DDA702A0B751@franklin.narus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <580E532D9F7A9B4BAE8A130848E0DDA702A0B751@franklin.narus.com>
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
To: David Reta <DavidR@Narus.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Wed, 2002-11-13 at 19:31, David Reta wrote:
> I just started using IP Tables and have a question. I was not able to find
> the answer in any of the docs I've read so far.
> I have a machine that I am using as a router and running Ip Tables on it.
> Here is a list of my tables.
> 
> [root@qa-gate root]# iptables -L
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination         
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp-data
> 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain 
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:26 
> DROP       tcp  --  anywhere             anywhere           
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination         
> 
> Chain test (0 references)
> target     prot opt source               destination
> 
> I am not able to pass any data through the router. Here is the scenario, I
> want to access a Web Site which is on the other side of the router. The way
> that I interpret this is that the packet will get passed to the first chain
> which is
> ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http

Remember that iptables has multiple tables, containing multiple chains. 
You are looking at the filter table only here.  There are 2 others:
"nat" and "mangle".  to list entries in the various tables use this:

iptables -t filter -L <-- This will show you what you wrote above only
one of 3 tables
iptables -t nat -L    <-- This will show you your "nat" table - it takes
care of port-forwarding and masquerading.
iptables -t mangle -L <-- This will show you your "mangle" table -
here's where you can "mangle" your packets in various ways - you
probably don't need to manipulate this table at all.

It sounds to me that you're trying to port-forward http from one
interface to the other.  The way to do that is this:

iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to-destination
<web_server_host>:<web_server_port>

This will send /all/ TCP packets baring destination port 80 to
<web_server_host>:<web_server_port>

> and be let through, yet this is not happening. All tcp traffic is being
> blocked which is defined by my 6th rule. I guess I am not understanding
> this, but I would think that the packet would match the first rule and be
> passed through. The following chains would be ignored, but this is not the
> case.  My logic is probably wrong. Any help would be appreciated.
> 
> Thanks,
> David


