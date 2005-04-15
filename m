From: marcus <marcus@lanhelp.com.br>
Subject: Redirecting internal tcp connections
Date: Fri, 15 Apr 2005 14:12:59 -0300
Message-ID: <425FF61B.9090008@lanhelp.com.br>
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

Hi, I have a lpd server on a remote host that ISP blocks port 515. I try 
to use something like "lpr -Plp@remotehost.com:900" but lprng doenst 
seems to recognize the port argument. So, I think to use iptables to 
redirect TCP requests on port 515 to port 900 but I dont know how. I've 
tried the following:

#iptables -A OUTPUT -p tcp --dport 515 -j REDIRECT --to-port 900

This gives me a "iptables: Invalid argument"

Any ideas?




