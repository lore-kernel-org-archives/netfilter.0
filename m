From: "Manestro Oliveira" <manestro123@hotmail.com>
Subject: bypassing a prerouting rule
Date: Wed, 23 Jun 2004 13:24:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY22-F8GvaIyuw4n4a0009ebc4@hotmail.com>
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
      I am a begginer to Linux and I have a PREROUTING rule that makes port 
redirection on incoming packages. But there is a server that don`t accept 
that, and works only without that rule. How can I bypass the rule for that 
server specifically?

     If iptables works by matching rules and leaving the other ones without 
checking them, then I should insert a rule before that and the problem is 
solved. Is this correct?

     Sorry if the question might be stupid, but I am taking the chance for 
being stupid now (and maybe not forever). >)

     Thanks.

_________________________________________________________________
MSN Hotmail, o maior webmail do Brasil.  http://www.hotmail.com


