From: JM <jerome@gmanmi.tv>
Subject: iptables help..
Date: Fri, 10 Oct 2003 12:45:55 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310101245.55993.jerome@gmanmi.tv>
Reply-To: jerome@gmanmi.tv
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

network looks like this...


                                                           LAN 
                                                              |
                                                              |
                                                        Firewall
                                                               |
                                                               |
remote server ( A, B, C ) ---- router2 ----- router1 ----- route3 --- remote server (1, 2, 3 etc ) --- internet
                      |
 Datacenter     |
     (network)    |
          remote server (x,y,z)
                    |
                    |
                 internet

i want to access the http server on "remote server x" from LAN.. without going through the internet..
so what i did is setup DNAT on "remote server A" but somehow its not working.. 

this is my ruleset..

NAT
-A PREROUTING -d serverA_IP -p tcp -m tcp --sport 1024:65535 --dport 81 -j DNAT --to-destination serverx_IP:80

FILTER
-A INPUT -p tcp -s LAN_IP/24 --sport 1024:65535 -d serverA_IP --dport 81 -j LOG --log-prefix "INPUT packets:"
-A FORWARD -d  serverx_IP -p tcp -m tcp --sport 1024:65535 --dport 80 -m state --state NEW -j ACCEPT
-A FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -p tcp -j LOG --log-prefix "FORWARD packets:"


TIA
jm

