From: "Antonio W. Lagnada" <nfets@msn.com>
Subject: Newby Question
Date: Sat, 19 Oct 2002 00:00:06 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F23V4jWdrEr6wSSakoC000006ea@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Help!

I can't seem to get iptables to forward to my internal server

eth0:  INTERNAL_IP
eth1:  INTERNET

WEBSERVER_IP is the ip address of the webserver

I am trying to forward port 80 to an internal machine at port 8080 and it 
doesn't work.  If I change the ip address to be eth0's ip, then it works.

# this doesn't work
$IPTABLES -A PREROUTING -t nat -i eth1 -p tcp --dport 80 \
    -j DNAT --to $WEBSERVER_IP:8080

# if I run a webserver on the firewall machine, the following works
$IPTABLES -A PREROUTING -t nat -i eth1 -p tcp --dport 80 \
    -j DNAT --to $INTERNAL_IP:8080


--
nfets@msn.com



_________________________________________________________________
Internet access plans that fit your lifestyle -- join MSN. 
http://resourcecenter.msn.com/access/plans/default.asp


