From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: need help firewalling homebrew http+smtp+dns+vpn
Date: Sun, 21 Dec 2003 08:12:13 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312211612.hBLGCENC015988@server5.bandwidthco.com>
References: <20031221070757.GD15390@dragonII>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031221070757.GD15390@dragonII>
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
To: 'Andrea Tasso' <andrea@tasso.info>, netfilter@lists.netfilter.org

This is a pretty nifty setup Andrea.  As for the specific rules you are
going to need to allow it to perform, I agree with Anthony in that you
should consult the tutorials as this will be a somewhat complex rule set
(too much for me to list here).  Couple of comments:

1. Port 42 is WINS replication so you do not need to worry about it unless
you are using a complex & pure SAMBA setup on the internal machines.

2. Double layer of SNAT is fine and provides an extra layer of security of
internal machines.

3. It's not clear to me where or how your VPN is connecting, and where the
end points are.  However, since it appears to be in-line to the double SNAT,
architecturally it is sound and should work.

4. It's not clear why you are concerned with ppp0 or PPPoE encapsulation.
Your DSL router should handle that just fine.  Since your interface to the
outside world has a static IP, you can use SNAT for these rules instead of
MASQ.  If you have a typical DSL router, is not your external interface an
eth? And not a ppp?.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Andrea Tasso
Sent: Saturday, December 20, 2003 11:08 PM
To: netfilter@lists.netfilter.org
Subject: need help firewalling homebrew http+smtp+dns+vpn

hello, these are my naive questions, I am a newbie:

I need to firewall my homebrew linux boxes, say to close everything I can
to/from outside (internet), and do everything inside my vpn. On the FIREWALL
machine I also run some server whose services/ports must keep to be
accessible to/from outside. Those kinds of connections I need to do also to
servers outside.
All the machines of the VPN need to be free to suft the outside internet. So
also masquerading and forwarding are needed.

thanks a lot for your help,
Andrea



That's my box: (see also below for explanations)


   ------------------                        -----------
  | 192.168.8.2 eth0 |-----|                |  FIREWALL |
   ------------------      |      ---------- - - - - - - ---------- 
                           |-----| eth1 192.168.8.1                |
   ------------------      |     |                                 |
  | 192.168.8.3 eth0 |-----|     |                   10.0.0.1 eth0
|----------|
   ------------------            |                                 |
|
                            |----| wlan0 192.168.2.1               |
|
   -------------------      |     --- - - - - - - - - - - - - - ---
|    
  | 192.168.2.2 wlan0 |-----|        |  servers: ssh:22        |
|
   -------------------               |           http:80       |
|
                                     |           https:443     |
|
                                     |           dns:42/53(?)  |
|    my VPN: everything
                                     |           smtp:25       |
|
                                      -------------------------
---------  in/out (ssh,http,https,dns,smtp +
 
|               "masqued web browsing")
 
|
 
|    "outside"    
 
|
 
-------------------------
                                                      ----------|
eth0          |
                                                     |    dsl
10.0.0.138        |
                                                     |   router
|
                                                      ----------|
|
                                                                |
dummy(*) ip        |
                                                                |
111.69.96.69.96     |      
                                                                |
ppp0 (?)        |
 
-------------------------
 
|
 
|
 
internet


(*) dummy ip: the dsl router has a fixed ip I do not write for security
(?) the question mark is for stuffs I am not sure about



