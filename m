From: Jun Sun <jsun@junsun.net>
Subject: Re: a question about user-defined chain
Date: Thu, 5 Jun 2003 07:34:13 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030605073413.A5256@gateway.junsun.net>
References: <E19NqBN-0007eh-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <E19NqBN-0007eh-00@kashyyyk.netfilter.org>; from gbj@glc.cn.net on Thu, Jun 05, 2003 at 04:32:23PM +0800
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
To: sword <gbj@glc.cn.net>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Thu, Jun 05, 2003 at 04:32:23PM +0800, sword wrote:
>    we all know that user can define chains he want,question is: which chain  will match ip packet first? In netfilter ,kernel decide to which chain the ip packet will send by where ip packet issued and where it send to,so the chain INPUT,OUTPUT,FORWARD will select to process ip packet,so what about user-defined chain?   

User defined chain must appear as a target (-j) somewhere in the
predefined system chain.

For example, you may have

iptables -A INPUT -p tcp -j user_tcp_chain

which means your user chain will be used whenever the packets
reaches the above rule and the packets are of tcp type.

Jun

