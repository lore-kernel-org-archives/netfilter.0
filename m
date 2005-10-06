From: "Amresh Kumar" <amresh_srivastava@hotmail.com>
Subject: (no subject)
Date: Thu, 06 Oct 2005 13:41:09 +0530
Message-ID: <BAY105-F32008F53295C372B97E01E9E850@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi
I am new to iptables i have a problem in adding iptable rule i am adding ip 
table rule

  iptables -A OUTPUT -p tcp -m iprange --src-range 10.0.0.1-10.0.0.20 -m 
iprange  --dst-range 61.12.43.1-61.12.43.20 -j ACCEPT
But i am getting following error
Bad argument `61.12.43.1-61.12.43.20'
Try `iptables -h' or 'iptables --help' for more information.
Actuall i am trying to drop  destination iprange 61.12.43.1-61.12.43.20 to 
source ip range 10.0.0.1-10.0.0.20 .

Is their any other rule  that i can add. plz help me

Thanks and regard..

_________________________________________________________________
Register with e-bay. 
http://pages.ebay.in/msnindia/msn_quad_shopwingold_sept.html Win gold, 
watches and more!


