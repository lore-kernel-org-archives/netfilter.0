From: "Stephan Viljoen" <steph@gabswave.net>
Subject: RE: Weird routing problem. (I think)
Date: Thu, 6 Nov 2003 16:44:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004f01c3a474$7fc9a970$0200010a@Tinkerbell>
References: <1068129245.22285.1.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1068129245.22285.1.camel@main.tqmcube.com>
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
To: 'IPTables Mailing List' <netfilter@lists.netfilter.org>

It works 100% fine from outside of the network. I'm getting the problem
from some off my users on a private subnet. The thing that baffles me is
that they can connect to any other server on the same IP subnet as the
mail server with no problems.




-----Original Message-----
From: David C. Hart [mailto:DCH@TQMcube.com] 
Sent: Thursday, November 06, 2003 4:34 PM
To: Stephan Viljoen
Cc: Iptables Mailing List
Subject: Re: Weird routing problem. (I think)

On Thu, 2003-11-06 at 09:21, Stephan Viljoen wrote:
> Some off my clients started complaining that they're having problems
> connecting to my mail server. Now all this worked fine up until
> yesterday. I'm not blocking any ports nor am I blocking ICMP on the
> network.
> 
Rather slow but  . . . 

[root@mail2 root]# telnet 217.10.176.138 25
Trying 217.10.176.138...
Connected to 217.10.176.138.
Escape character is '^]'.
EHLO *****
220 gabswave.net ESMTP Exim 4.24 Thu, 06 Nov 2003 16:28:14 +0200
501 Syntactically invalid EHLO argument(s)
quit
221 gabswave.net closing connection
Connection closed by foreign host.



