From: Greg Stark <gsstark@mit.edu>
Subject: Re: sqlnet conntrack/nat modules?
Date: 19 Oct 2003 12:08:51 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <878ynhus4s.fsf@stark.dyndns.tv>
References: <3F92A82D.000013.29759@bj222.163.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F92A82D.000013.29759@bj222.163.com>
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


"XX" <zijiepan@163.com> writes:

>    I want use it to SqlPlus to connect to a Oracle Server behind a linux box
>    using iptables.Does anyone have the sqlnet conntrack/nat modules?

I used to forward sqlnet connections via ssh. That would imply that it ought
to work just fine without using any special nat modules. That was with Oracle
8.0.5 so it's possible this has changed since, but I doubt it.

-- 
greg


