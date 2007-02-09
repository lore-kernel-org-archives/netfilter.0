From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Route aggregaton/deaggregation from eth to g.703 and vica versa
Date: Fri, 9 Feb 2007 09:57:49 -0800 (PST)
Message-ID: <137379.39959.qm@web56214.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all, 

I do not know where to post this question so I suppose
this is place where many network proffessionals gather
and  I will post it here.

At locationA  I have ethernet connection 10/100MB.
Connection to locationB is over four G.703 2MB links.
Something like this 


   locA
---eth---|-------g.703-----|
         |-------g.703-----|
         |-------g.703-----|      locB
         |-------g.703-----|-----eth-------Switch--
         |--------g.703----|

Where | represent nic cards like 
http://www.farsite.co.uk/tcp_ip_ppp_x.21_v.35_pci_cards/farsync_e1_t1_pci_wan_card_linux_windows.shtml

My question is: is possible ( I mean if someone know
and want to share knowledge ) make some route
aggregation at locatioA from eth--to---four g.703 (
2MB) links and transfer data at ~10Mbps from locationA
to locationB, and at locationB join it again at one   
   
10Mbps link? I mean does somebody know if this is
possible using Debian and linux routing technices.
This is very important to me and any knowledge share,
linkk or some more information related to problems to
this will be high apriciated.             

Linux modules loading and administration is not
problem.

Thanks in advance to whom who answer me.

Regards 
Elvir Kuric 


 
____________________________________________________________________________________
The fish are biting. 
Get more visitors on your site using Yahoo! Search Marketing.
http://searchmarketing.yahoo.com/arp/sponsoredsearch_v2.php

