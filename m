From: Mohammad Farooq <mohammadfarooq@tango-networks.com>
Subject: How to measure CPU usage of netfilter
Date: Mon, 20 Nov 2006 18:40:40 -0600
Message-ID: <1164069640.4057.31.camel@mfarooq-1.tango-networks.com>
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
To: netfilter@lists.netfilter.org

Hi Guys,
   
  I have about 1000 rules in the iptables. All these rules just forward 
the incoming traffic to other systems. I am trying to measure CPU usage 
of the netfilter. I tried to measure with top command but some how it 
always shows that CPU is 95% idle. I am not sure if top is the 
appropriate command to measure CPU usage of the netfilter. Since all the 
filtering is happening inside the kernel there should be some other command to 
measure kernel's CPU usage. I would appreciate if someone can point to 
the right direction. Thanks.
   
  mf


