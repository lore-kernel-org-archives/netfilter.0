From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Problem with LOG in /var/log/messages
Date: Sun, 19 Sep 2004 16:04:11 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <414DE63B.8050605@newkirk.us>
References: <20040918173731.14655.qmail@web20923.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040918173731.14655.qmail@web20923.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: yann Conan <yahn_ick@yahoo.fr>
Cc: netfilter@lists.netfilter.org

yann Conan wrote:
 > On Mandrake if I do a tail -f /var/log/messages I see
 > the DROP
 > On RedHat it doesn't work.

At a guess, there's already some rules in place on the RH box, and you 
added your LOG rule after them.  I've seen that many RH and Fedora 
installs create a default ruleset, even if told "no firewall" during 
installation!

Try "iptables -vnL" and see if there's other rules already in place, and 
check the packet & byte counts (first two numbers on each rule's line) 
to confirm if your LOG rule is actually matching packets.

If you have default rules in place (RH likes jumping to a custom chain, 
like 'lokkit' something) then "iptables -F" to flush rules in filter 
tables chains, set DROP policies, then "service iptables save" will 
ensure that this configuration will be restored on reboot.  (if your 
ruleset is not overly complicated, and doesn't depend on 'current' info 
like dynamic IP changes, you can just save/restore your rules this way 
pretty damn easily)  You can look at the rules that will be restored 
during startup this way by examining /etc/sysconfig/iptables.

Another suggestion is to insert "kern.=debug  /var/log/firewall" near 
the top of /etc/syslog.conf (and restart syslog with "service syslog 
restart" or a reboot), then add "--log-level 7" to each of your LOG 
rules.  Unless you're running a debug build of a kernel, you should get 
almost exclusively firewall-LOG entries in that file.  Then use 
"--log-prefix 'SSHin:'" or whatever to aid in identifying LOG entries, 
where and why they were logged.

j

> Hi all,
> 
> I done this configuration test with iptables :
> iptables -P INPUT DROP
> iptables -A INPUT -j LOG
> iptables -P OUTPUT DROP
> iptables -A OUTPUT -j LOG
> 
> I done this with iptables on a mandrake and on a
> REDHAT.
> I try to ping in 127.0.0.1 and after
> On Mandrake if I do a tail -f /var/log/messages I see
> the DROP
> On RedHat it doesn't work.
> 
> the syslog.conf on RedHat and Mandrake are:
> *.info;mail.none;;news.none;authpriv.none
> -/var/log/messages
> 
> What is the problem or what is the difference about
> default configuration between Mandrake and redHat?
> 
> Best Regards,
> 
> Yann Conan
> Bordeaux,France

