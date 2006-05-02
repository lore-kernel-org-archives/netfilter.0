From: Pedro Werneck <pedro.werneck@terra.com.br>
Subject: Obtain original address from redirected connection
Date: Tue, 2 May 2006 02:54:50 -0300
Message-ID: <20060502025450.73457687.pedro.werneck@terra.com.br>
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
To: netfilter@lists.netfilter.org.


Hi


I have a daemon, a sort of proxy, written in Python, who receives
redirected connections with a rule like this:

iptables -t nat -A PREROUTING -j DNAT -p TCP -s source --to-destination host:port

The problem is that I need access to the original destination address,
but I could not find a way to do that when I wrote the daemon. Someone
suggested me using ULOG and parsing the address from ulogd logfile, and
this worked for some time, but now I have several simmultaneous
connections to the daemon and things get out of sync very easily when
reading the file.

Someone suggested using SO_ORIGINAL_DST. The constant is not available
in Python socket module, so I used the value 80, from iptables_ipv4.h
headers. The problem now is that the getsockopt() call doesn't work with
any values for 'level' parameter. First I tried 0 and 6, but they give
the errors 'Invalid Argument' and 'Protocol not available' respectively.
Just for testing I tried all other values from /etc/protocols and they
give 'Operation Not Supported'.


Is it possible to do this with SO_ORIGINAL_DST, or is there any other
approach for obtaining the original address ?


Thanks for any help

-- 
Pedro Werneck

