From: Paul Caritj <pcaritj@riovia.net>
Subject: Rule Ordering
Date: Mon, 06 Oct 2003 03:01:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F811366.1030608@riovia.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Gents,

I know the answer to this question is already well documented, but I 
need to ask anyway because iptables never behaves the way I expect it to 
in this regard; How, exactly, does rule ordering work for rules added 
through the iptables userspace tool?

For example, say I have a bunch of rules that will be coming and going 
on a very frequent basis, but I have one that I need to keep last in the 
evaluation sequence. A that I would just add the rule that needs to stay 
last with "-A" and all the others with "-I"?

I like to give you guys an easy one once in a while ;)

-Paul


