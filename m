From: Ted Kaczmarek <tedkaz@optonline.net>
Subject: New rules set would not work until rules where summarized
Date: Sat, 20 Dec 2003 09:45:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071931525.32295.18.camel@tarkus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Redhat 9
2.4.20-24.9.i686
iptables-1.2.7a-2

I have one setup where I log based upon clients SA's. Each client has
their own prefix they log to.
The rules were very anal in that SA/DA port for each flow was defined. I
tried to add another pair of SA/DA's port rules 
and they refused to work. I tried downgrading to 2.4.20-20.9
no joy. In desperation I redid the rules to limit the amount
of individual rules to SA subnet/DA port , applied the ruleset again
summarized that would not work and it is now working. 

So now instead of having 40 lines of rules, 20 logging and 20 accept, I
now have have 16, 8 logging and 8 accept and it is behaving.

How could I identify what was the root of the problem?

I would like to recreate the problem and gather more data, but any
insight into what I should be looking fow would be appreciated.

Is their some allocation somehwere in the kernel that is possibly too
small?

Or did I hit some obscure bug?

Thanks and Happy Holidays,

Ted




