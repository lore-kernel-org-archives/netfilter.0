From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: problems with firewall, DMZ
Date: Sat, 7 Aug 2004 08:49:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040807124938.GA9000@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I have got a pair of 2 public IPS to test from my ISP. I have assigned
both for my gateway machine and one of them is Natted to a test mail server
at DMZ. I can access the mail server from outside world as,
telnet <external ip> 25
it works fine

My internal users can access it as,
telnet 10.10.10.2 25
it works fine,

But I cannot do 
telnet <external ip> 25
from inside.
Same for POP3 and HTTP.
I cannot do it even from the gateway(firewall) machine itself.

What must be the problem?

With warm regards,
-Payal

