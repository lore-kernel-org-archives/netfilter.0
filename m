From: Henti Smith <bain@tcsn.co.za>
Subject: transparent squid with internal sites as well
Date: Mon, 25 Nov 2002 12:19:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021125121935.0adac911.bain@tcsn.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi there 

I have a little problem I'm hoping somebody can help me with.

We are running a WAN here with firewall and tranparent proxy. I have some webservers on the inside of the firewall (yes I know .. this is not my choice... *sigh*)
which I'm forwarding all data to ip's to those machines. 

The problem is:

With transparent proxy working the way it should, nobody on the internal network can see the internal websites.
With transparent proxy off, all works but I have no way of seeing who browses where anor content control.

here is firewall rules that pertain to setup.

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
REDIRECT   tcp  --  10.0.0.0/8           0.0.0.0            tcp dpt:www redir ports 3128 
REDIRECT   tcp  --  10.0.0.0/8           0.0.0.0            tcp dpt:3128 redir ports 3128 
DNAT       tcp  --  anywhere             web1		    tcp dpt:www to:10.0.0.10:80 
DNAT       tcp  --  anywhere             web1               tcp dpt:https to:10.0.0.10:443 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       all  --  10.0.0.0/8          !10.2.0.0/16        to:liveip
SNAT       all  --  192.168.1.0/24       anywhere           to:liveip

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

as off right now .. transparent proxy is not logging any internal traffic ... but I need to have tranparent proxy but still allow internal users to browse to web1

any suggestions ? 

Henti Smith

