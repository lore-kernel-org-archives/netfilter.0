From: pacific redwoods <pacificredwoods@yahoo.com>
Subject: NAT, 2 boxes 1 in private network, is config correct? Diagram enclosed.
Date: Fri, 13 Feb 2004 08:11:44 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040213161144.8183.qmail@web20508.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,
I have 1 connection to the Internet(2XX.100.20.10). 1 hub, 1 firewall, 1 box in private network.

The firewall has 3 NIC cards, eth0,eth1,eth2. I can't reach the private network using ssh. I have
ssh running on the firewall on port 1229. Firewall has the NAT rule. Ssh is also running on the
private network box(target). The firewall has port 1229 open and listening(verified).

./iptables -t nat -A PREROUTING -p tcp 1229 -i eth0 -j DNAT -to 192.168.10.100:22

Does anyone know why this would not work? My OS is Ferora Core1, all patched up.

Thank-you!

(Make believe routable IP addresses to protect the innocent)

     ------------------------------
    |                              |
    |            eth0  Nic Card 1 -|-- 2XX.100.10.14 --------->  gateway 2XX.100.20.10
    |            eth1  Nic Card 2 -|-- 2XX.100.10.15 ------->  | gateway 2XX.100.20.10
    |            eth2  Nic Card 3 -|-- 2XX.100.10.16 ----->  | | gateway 2XX.100.20.10
    |                              |                       | | |                       
    | Router/Firewall/etc box      |                       | | | 
     ------------------------------                        | | |
                                                           | | |
                       --------<--------<-----------------<| | |
                      |   ------<-----------<---------------<| |
                      |  |   ------<-----------<--------------<|
                      |  |  |     
 to/from providors    |  |  |
 gateway(Main         |  |  |
 Internet connection) |  |  |
 | 2XX.100.20.10      |  |  |
 |                    |  |  |
 |------------->|     |  |  |
               ----------------
              |                |
              |  8 Port HUB    |
               ----------------
                     |  |  |
                     |  |   -<-----------------<--------------<|
                     |   ---<---------------<---------------<| |
                      ----<-------------<-----------------<| | |
                                                           | | |
     ------------------------------                        | | |
    |                              |                       | | |
    |           eth0   Nic Card 1 -|-- 192.168.10.100 ---->| | | gateway 2XX.100.10.14
    |           eth1   Nic Card 2 -|-- 192.168.10.101 ------>| | gateway 2XX.100.10.14
    |           eth2   Nic Card 3 -|-- 192.168.10.102 -------->| gateway 2XX.100.10.14
    |                              |                                              
    | SSH/ Web Server/ Database/   |  
    | misc applications            |
     ------------------------------ 

__________________________________
Do you Yahoo!?
Yahoo! Finance: Get your refund fast by filing online.
http://taxes.yahoo.com/filing.html

