From: dlewis@dsl-co.com
Subject: IPTables and Partial NAT Question
Date: Sun, 27 Jul 2003 04:36:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059295014.a54971163c462@webmail.dsl-co.com>
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

Hey all,

 I have a question regarding iptables and natting.  What I'm trying to do is
 setup a iptables firewall to protect my LAN and Servers.
 The catch is that I'm using my Cisco Router to do the Natting.. So what I'm
 trying to do bascially is just route across the 2 nics in the  Redhat 9
 box and use the iptabes to allow/deny stuff from getting across.

 The reason I'm doing this is that there are multiple interfaces for other
things
 on the Cisco and its just easier than trying  to replace the cisco with the RH
box.

So the Firewall has internal ip's on both nic's..

Currently my thoughts are

          Cisco                       eth0      FW     eth1
INET ----------                     ---------------------              
--------- LAN
                 10.255.0.1  10.255.0.2      10.11.11.1                 &
Servers

 so the Cisco will nat the 5 ip's, into 2 direct ip's for servers and 1 for
 general Lan natting for the local workstations...The cisco will have
 simple/basic Access listing as a first line of defence and  then have
 them pass through the  FW box and do detailed rulesets and then off to
 the lan and approperiate machine...

 Can anyone lend any information of how I should configure the FW box to route
 the traffic and any other examples that might help me to do this.
 The last time i used a linux firewall it was a ipchains firewall using NAT
 aswell directly connected to the internet, so this is a little twist for me and
 I'm not exactly sure how I should go about doing it.


 Any help would be appreicated.

 Thanks in advance for your time and comments.

 Dave

