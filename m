From: Xemul <epv_xemul@mail.ru>
Subject: Re: Traffic limitation with iptables
Date: Wed, 23 Jul 2003 19:17:30 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030723191730.5a3110d2.epv_xemul@mail.ru>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BF6B@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15BF6B@wardrive.citadelcomputer.com.au>
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
To: netfilter@lists.netfilter.org

On Wed, 23 Jul 2003 08:07:40 +1000
"George Vieira" <georgev@citadelcomputer.com.au> wrote:

> Use the Quota patch and it'll limit the rule by itself..			
> 

Thank you VERY much :)
This is exactly what I want.
Well I've got one more question.
Consider using 2 additional tables like this:

iptables -N table1
iptables -N table2
iptbales -A FORWARD -s 192.168.2.1 -j table1
iptables -A FORWARD -s 192.168.2.2 -j table2
iptables -A table1 -m quota --quota 10000 -j RETURN
iptables -A table1 -j DROP
iptables -A table2 -m quota --quota 10000 -j RETURN
iptables -A table2 -j DROP

By doing this I'll limit outgoing traffic for 192.168.2.1 and for .2
independently and the speed won't be too small I hope.
Then consider I have not 2 but 100 tables like table1, table2, ...
table100. What about the perfomance in this case? Won't it be too small?

