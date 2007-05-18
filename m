From: Alex Tang <altitude@funkware.com>
Subject: redirect 127.0.0.1:25 -> 127.0.0.1:2000
Date: Fri, 18 May 2007 15:36:19 -0700
Message-ID: <464E2A63.3020903@funkware.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi folks.

I'm using a nat PREROUTING rule to forward all connections from port 25 
to port 2000.  This works fine for all addresses except for localhost.

the rule i'm using is: "-A PREROUTING -p tcp -m tcp --dport 25 -j 
REDIRECT --to-ports 2000" (CentOS4, kernel 2.6.9-55, iptables-1.2.11)

For example, on my machine: foobar.example.com

If i telnet from any machine other than foobar.example.com to 
foobar.example.com:25, the connection is redirected  properly to 
foobar.example.com:2000. 

However, if i telnet from foobar.example.com to localhost:25, i get a 
connection refused. 

Telnetting to from foobar.example.com to localhost:2000 works fine (as 
expected)

Telnetting from foobar.example.com to foobar.example.com:25 also does 
not work.

I know that you can't do prerouting from localhost -> some.other.host 
(or vice versa), but i thought localhost->localhost would work.

Am i screwing up the rule? Should I add another rule?  Or am i just SOL.

Thanks.

...alex...


