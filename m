From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: TARpit question
Date: Sun, 18 Apr 2004 16:36:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040418143658.DD88A474C@sterenborg.info>
References: <20040418132912.99066.qmail@web40707.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040418132912.99066.qmail@web40707.mail.yahoo.com>
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

> I am trying to use the TARPIT feature as much as possible.
> People can use the services I offer on the public IP I have; 
> other ports are not their business.
> 
> For priviliged ports that are not in use things are easy. 
> Make the port UNTRACKED and make TARPIT the target.
> 
> For ports that are in use things are more difficult for me as 
> a netfilter/iptables amateur.
> 
> Does anybody know about examples available on the net?
> Or does anyone have some tips, examples?

I've never used TARPIT because of this :
http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-TARPIT

At the bottom it states :
You probably don't want the conntrack module loaded while you are using
TARPIT, or you will be using resources per connection.

If you've loaded the conntrack module, you're conntracking. AFAIK you can't
untrack a single port or a range of ports.

There is an example in the link above and it looks quite straight forward to
me.
If you're sure that you want to use TARPIT, maybe the following works for
you :

iptables -A INPUT -m state --state RELATED,ESTABLISED -j ACCEPT
iptables -A INPUT -i <if_in> -p <protocol> --dport <any_service> \
  -j ACCEPT
<More rules>
iptables -A INPUT -j TARPIT

It shouldn't matter what the policy for the chain is : the last rule matches
all packets that didn't match in earlier rules and these will be sent to the
TARPIT. So these packets will never reach the policy setting of the chain
(ACCEPT or DROP).


Gr,
Rob


