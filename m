From: Mikko Alutoin <mikko.alutoin@vtt.fi>
Subject: Transparent proxying using REDIRECT
Date: Thu, 17 Jul 2003 09:24:59 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4.2.2.20030717085400.00cb6ac0@vttmail.vtt.fi>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I have a question about transparent proxying. Suppose I have the following 
rule in my kernel:

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT 
--to-port 3128

The purpose of the rule is that all web traffic is captured by a proxy 
listening to a local port. Now the question:

How does the proxy get to know the original destination IP address and 
port? By looking into the HTTP-request, perhaps? If so, what if the 
application protocol (some other than HTTP) does not contain the 
destination URL?

Cheers,
Mikko



