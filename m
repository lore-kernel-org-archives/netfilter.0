From: "Irvin, Michael Thad" <michael.irvin@Citicorp.com>
Subject: NATTING for a whole network.
Date: Thu, 9 Dec 2004 12:22:26 -0500
Message-ID: <4D7EBAB4CCB6DB4AB7EE598E9ED186950474D69B@asusfl45cex08.us-fl.cards.citicorp.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

I'm kinda new at this iptables thing.  I've been running into a problem with
trying to NAT for a class C subnetted class A network...i.e. 10.168.1.0/24.
The syntax I've been using is as follows -- $ipt -t nat -A POSTROUTING -o
$outside -j SNAT -to-source $lan, with the variable $lan = "10.168.1.0/24".
Everytime I've ran the script I get the following error <iptables v.x.x.x
Bad IP Address.  Can anyone please help me with the proper syntax to make
this work?  I've tried various options such the one above, also including
the whole subnetmask  and playing around with different delimitation
options, nothing seems to work.

 

Michael "Thad" Irvin
Lead Analyst - Internet Engineering
Citibank Cards Technology
904.954.2213
michael.irvin@citicorp.com


