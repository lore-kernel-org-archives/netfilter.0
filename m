From: "__ Radien__" <radien@zworg.com>
Subject: to use or not to use stateful capabilities
Date: Mon,  5 Apr 2004 03:49:43 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20705.1081162183@zworg.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear All

  For letting outside clients to access the webserver behind the
firewall:

  I want to know, what is the difference
1.   if I use connection states in rules tp accept for forwarding in the
firewall rulset:

Conn. State             -s                     -d                --proto
  -sport        -dport      SYN   ACK

New               outside_client    web_server         tcp       <1024  
       80     Yes   No
Established   web_server       outside_client      tcp       80         
     <1024 Yes   No
Established   outside_client    web_server         tcp       <1024      
   80     No   Yes
Established   web_server        outside_client     tcp       80         
     <1024 No   Yes


2.   or simple fwd rules:

iptables -t filter -A FORWARD -p tcp -s $WEBSERVER --sport 80 -d $OUT -j
ACCEPT
iptables -t filter -A FORWARD -p tcp -d $WEBSERVER --dport 80 -s $OUT -j
ACCEPT


I have a little knowledge about statefulness of the firewall, and can
not underestand what is the deference in such a case. I mean
practically.

Regards
__Radien__

