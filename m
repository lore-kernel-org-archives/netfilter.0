From: Sandro Dentella <sandro@e-den.it>
Subject: ip ro get problem
Date: Wed, 15 Sep 2004 12:45:01 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040915104501.GA10207@bluff>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables <netfilter@lists.netfilter.org>

Hi all,

I'm using ip route get to debug a routing probelm and I get:

    root@fw-euronet argo # ip route get 192.168.254.10 
    192.168.254.10 dev eth0  src 192.168.254.1 
	cache  mtu 1500 advmss 1460
    root@fw-euronet argo # ip route get 192.168.254.10 from 192.168.5.2
    RTNETLINK answers: Invalid argument


What does really mean "RTNETLINK answers: Invalid argument", 


I get the same error w/

    root@fw-euronet argo # ip route get 192.168.254.10 iif tun0
    RTNETLINK answers: Invalid argument

My rules are:
    root@fw-euronet argo # ip ru li
    0:      from all lookup local 
    30:     from all iif tun0 lookup adsl 
    38:     from 192.168.254.10 lookup hdsl 
    40:     from 217.58.51.160/27 lookup hdsl 
    41:     from 81.121.243.248/30 lookup adsl 
    52:     from all iif eth0 lookup adsl 
    53:     from all iif eth2 lookup adsl 
    32766:  from all lookup main 
    32767:  from all lookup default 

where you can see that tun0, where 192.168.5.0/24 is, should look table adsl
that is define this way:

    root@fw-euronet argo # ip ro ls table adsl
    81.121.243.248/30 dev eth3  scope link  src 81.121.243.250 
    217.58.51.160/27 dev eth1  scope link  src 217.58.51.162 
    192.168.5.0/24 dev tun0  scope link 
    192.168.1.0/24 dev eth2  scope link  src 192.168.1.1 
    192.168.254.0/24 dev eth0  scope link  src 192.168.254.1 
    default via 81.121.243.249 dev eth3 

   
TYA
sandro
*:-)


-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

