From: nitin mandolkar <nitinmandolkar@gmail.com>
Subject: Port Forwarding Need help
Date: Thu, 16 Dec 2004 21:26:19 +0530
Message-ID: <1282c4c804121607563fa643e1@mail.gmail.com>
Reply-To: nitin mandolkar <nitinmandolkar@gmail.com>
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

Need Help in port forwaeding.

This is my set up.

                  DSL ROUTER (WAN IP : x.x.x.x | LAN IP 192.168.5.1)

                                              |
                                              |
                                              |
                 Linux Machine (eth0: 192.168.0.2 eth1: 192.168.5.12)
                                              |
                                              |
                                              |
                 Windows machine(eth1: 192.168.5.4)(IIS is running on
                 this machine on port 80)                    

                From router i am forwarding the request to linux
machine to port 80.
                any one from out site they are able to see a test
pages on linux
                machine.
              
              i want to forward any request coming on port 80 on linux
machine to
               windows machine on port 80.
  

/sbin/iptables -A PREROUTING -t nat -p tcp -s 192.168.5.1 -d
192.168.5.12 --dport 80  -j DNAT --to-destination  192.168.5.4:80

I Use above iptables entry but it is not working.

Nitin mandolkar.

