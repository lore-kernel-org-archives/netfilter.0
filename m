From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: module matches a set of source or destination ip addresses
Date: Tue, 12 Apr 2005 02:30:59 -0500
Message-ID: <425B7933.2040906@riverviewtech.net>
References: <200504120928.01319.igorpopov@newmail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504120928.01319.igorpopov@newmail.ru>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Igor Popov <igorpopov@newmail.ru>
Cc: netfilter <netfilter@lists.netfilter.org>

Igor Popov wrote:
> 	Hi all,
> It there iptables module(something like mport), but that matches a set of 
> source or destination ip addresses:
> iptables -A ... -p ... -m megamatcher -s ip1,ip2,...-d ip1,ip2,... -j ...
> 

If the IPs in question are in a subnet you can always specify the subnet it's self.  I.e.

iptables -A ... -p ... -s 192.168.0.0/24 -d 172.30.16.0/128 ... -j ...

You might want to take a look at the set match.  Set uses an external program (ipset?) to create and maintain the sets that are matched against.  I think set will allow you to have multiple IPs in it that are not necessarily in the same subnet or contiguous.  So that may do it for you.  I have not messed with ipset so I'm not much help for you.  Though a read of the man for it should help.



Grant. . . .

