From: boka <boka@sto-procent.art.pl>
Subject: pptp and nat problem
Date: Thu, 12 Feb 2004 11:37:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <402B577C.9060500@sto-procent.art.pl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi !

I have to enable pptp traffic through my nat box (2.4.24, iptables 
1.2.9, 2 interfaces (eth0 - private IP, eth1 - public IP)). I have 
compiled kernel (and iptables )with pptp-conntrack-nat.patch from 
patch-o-matic-20031219 with following options to kernel config:

...
Networking options
<*>   IP: GRE tunnels over IP
  [*]     IP: broadcast GRE over IP
...
Networking options -> IP: Netfilter Configuration -> Connection tracking
<*>   GRE protocol support
  <*>    PPTP protocol support
...

and it is not working. Right now i can not post a log from tcpdump ... 
Is there any possibility to check what contrack modules are switch on in 
working kernel ?

ps. any ideas ?

greetz
boka

