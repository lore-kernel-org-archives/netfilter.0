From: =?iso-8859-1?Q?=D6rjan?= Persson <orange@fobie.net>
Subject: Re: TCP redirect external to external host
Date: Tue, 9 Dec 2003 20:31:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031209193110.GA17111@fobie.net>
References: <20031209190402.GA16255@fobie.net> <1070997211.2880.4.camel@pepelui.baicom.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1070997211.2880.4.camel@pepelui.baicom.com>
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
To: netfilter@lists.netfilter.org

Alexis (..@..com) wrote:
> in fact if you do
> 
> iptables -t nat -A PREROUTING -d host1 -p tcp --dport 33 -j DNAT --to
> host2:44 it keeps the original sender ip.
> 
> if you want to change the sender ip to host1:33 you need to do this
> doing a POSTROUTING rule to do SNAT in this connection.
>
> I hope it helps
>
> please read
> http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

Thanks for taking the time to answer!

Yes, I've read that manual a few times by now but I still doesn't really
understand what's going wrong. If I just use the rule you sent above, a
connection with telnet is just "hangning".

If I add the SNAT-rule it works, but the sender's IP will be altered to
host1 (the first server).

iptables -t nat -A PREROUTING -p tcp --dport 33 -i eth0 -j DNAT --to host2:44
iptables -t nat -A POSTROUTING -d host2 -p tcp --dport 25 -j SNAT --to host1

Why I want this is because I'm moving one SMTP to another location. So
from the postfix logs I get this:
Dec  9 19:27:56 mail postfix/smtpd[20692]: connect from host1[x.x.x.x]

host1 shouldn't be there, the original sender should.

I'm clueless. :(

