From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: how to negate a limit match?
Date: Sun, 2 Nov 2003 12:49:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <109595440117.20031102124948@lf.lv>
References: <Pine.LNX.4.44.0310291330000.27971-100000@localhost.localdomain>
 <20031029201201.630de190.joerg@schuetter.org>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031029201201.630de190.joerg@schuetter.org>
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
To: iptables mailing list <netfilter@lists.netfilter.org>
Cc: "Robert P . J . Day" <rpjday@mindspring.com>

Wednesday, October 29, 2003, 9:12:01 PM, you wrote:

jso> Hallo Robert,

jso> On Wed, 29 Oct 2003 13:31:10 -0500 (EST)
jso> "Robert P. J. Day" <rpjday@mindspring.com> wrote:

>> 
>>   it's not clear from the man page how to reverse the meaning
>> of a limit match.  if i want to accept everything *over* a given
>> limit, i'm supposed to use the "!".  but where?  is it like
>> this?
>> 
>>   -m ! limit -- limit ... etc etc ...
jso> -m limit ! --limit ...
>> 
jso> Take a look at http://iptables-tutorial.frozentux.net/ . There will you
jso> find a good tutorial for iptables.


Limit cannot be negated, instead write smart limit rules,
for example to allow 5 incoming icmp packets a minute the rule would look like:

iptables -A INPUT -p icmp -m limit --limit 5/min --limit-burst 1 -j ACCEPT
iptables -A INPUT -p icmp -j DROP

or for example to disallow 5 incoming icmp packets a minute but allow
all other:

iptables -A INPUT -p icmp -m limit --limit 5/min --limit-burst 1 -j DROP
(optional) iptables -A INPUT -p icmp -j ACCEPT


P.Krumins


