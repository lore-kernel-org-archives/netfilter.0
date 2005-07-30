From: Gus Collins <gcollins@ieee.org>
Subject: Rules for squid via ssh tunnel
Date: Fri, 29 Jul 2005 22:25:30 -0400
Message-ID: <42EAE51A.3080400@ieee.org>
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

I believe this is suppose to be easily done, but I sure can't seem to 
make it work.  Here's my setup.

I setup a squid proxy on my firewall machine to allow http traffic from 
my wlan to be encrypted through a ssh tunnel (i.e., ssh -L 
3128:squid_server:3128 ...).  Worked great until I added iptables to 
that setup.

My question is: what rules do I need on the server to allow my local 
wlan to access the web via the proxy running on the firewall?

I tried the rule below w/o success:

iptables -A INPUT -p tcp --dport 3128 -m state --state 
NEW,ESTABLISHED,RELATED

On the client, I have the default output policy of accept, so it should 
be ok?

Any help greatly appreciated!

Gus Collins

