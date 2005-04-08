From: `VL <vl.homutov@gmail.com>
Subject: Feature request: ability to test if rule is loaded
Date: Fri, 8 Apr 2005 10:59:37 +0400
Message-ID: <aec22fc5050407235958a06990@mail.gmail.com>
Reply-To: `VL <vl.homutov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all.

I recently started to configure my firewall and decided to write some
more advanced shell scripts to make loading of rules easier. My task
was to have a config which looks like:

loadrule client/ssh on/off 
loadrule server/sshd on/off

and i want the ability to run script, which will go thorough this list
and will load rules that are not yet loaded, and remove rules, that
marked off, if they are loaded.

client/ssh is a file, that contains something like this:

NAME="SSH Client"
RULES_NUM="2"
MY_SSH_SERVER1="xxx.xxx.xxx.xxx"

RULE[0]="OUTPUT -o eth0 -p tcp...."
RULE[1]="INPUT -i eth0 ...."

When i want to add rule, my function loadrule runs iptables -A
RULE[0,1...], if i want to disable rule, i call iptables -D
RULE[0,1...]

But! How do i test if rule was loaded? If i delete rules, i get an
error if rule is not loaded, if i add rules, it just added next in
chain.

So, it would be nice to have new iptables option, i think -T , which
will act like -D with one exception: it will not delete rule, just
return true if rule exists in chain, and false otherwise.

It seems to me that it is very easy to add, and that it will be
usefull for system administrators.

For example, if we can`t turn of firewall on critical server,
administrator have to manually review list of rules and delete some,
he decided to remove by some reasons. With my approach he just changes
1 line in readable config to off, and asks script to reload config.

What do you think ?

