From: Andrea Tasso <andrea@tasso.info>
Subject: need help firewalling homebrew http+smtp+dns+vpn
Date: Sun, 21 Dec 2003 08:07:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031221070757.GD15390@dragonII>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hello, these are my naive questions, I am a newbie:

I need to firewall my homebrew linux boxes, say to close everything I can to/from outside (internet), and do 
everything inside my vpn. On the FIREWALL machine I also run some server whose services/ports must keep to be 
accessible to/from outside. Those kinds of connections I need to do also to servers outside.
All the machines of the VPN need to be free to suft the outside internet. So also masquerading and forwarding are 
needed.

thanks a lot for your help,
Andrea



That's my box: (see also below for explanations)


   ------------------                        -----------
  | 192.168.8.2 eth0 |-----|                |  FIREWALL |
   ------------------      |      ---------- - - - - - - ---------- 
                           |-----| eth1 192.168.8.1                |
   ------------------      |     |                                 |
  | 192.168.8.3 eth0 |-----|     |                   10.0.0.1 eth0 |----------|
   ------------------            |                                 |          |
                            |----| wlan0 192.168.2.1               |          |
   -------------------      |     --- - - - - - - - - - - - - - ---           |    
  | 192.168.2.2 wlan0 |-----|        |  servers: ssh:22        |              |
   -------------------               |           http:80       |              |
                                     |           https:443     |              |
                                     |           dns:42/53(?)  |              |    my VPN: everything
                                     |           smtp:25       |              |
                                      -------------------------          ---------  in/out (ssh,http,https,dns,smtp +
                                                                              |               "masqued web browsing")
                                                                              |
                                                                              |    "outside"    
                                                                              |
                                                                 -------------------------
                                                      ----------|           eth0          |
                                                     |    dsl           10.0.0.138        |
                                                     |   router                           |
                                                      ----------|                         |
                                                                |      dummy(*) ip        |
                                                                |     111.69.96.69.96     |      
                                                                |         ppp0 (?)        |
                                                                 -------------------------
                                                                             |
                                                                             |
                                                                         internet


(*) dummy ip: the dsl router has a fixed ip I do not write for security
(?) the question mark is for stuffs I am not sure about

