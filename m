From: "Ian Douglas" <ian@icreditvision.com>
Subject: using iptables for poor-man's load balancing?
Date: Tue, 18 Feb 2003 13:53:21 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HMEBKOCKLOOEJGIOMFAPAEGOFJAA.ian@icreditvision.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

We currently have two machines (soon to be 4) that we'd like to balance our web
traffic to. Say for argument's sake that our public IP is 1.2.3.4 and our
internal LAN machines are:
  192.168.1.1
  192.168.1.12
  192.168.1.16
  192.168.1.17

Just curious if the following rules would work to round-robin the connections:

/sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 80  -j DNAT \
   --to-destination 192.168.1.1:80 \
   --to-destination 192.168.1.12:80 \
   --to-destination 192.168.1.16:80 \
   --to-destination 192.168.1.17:80
/sbin/iptables -t nat -A PREROUTING -p udp -d 1.2.3.4 --dport 433  -j DNAT \
   --to-destination 192.168.1.1:80 \
   --to-destination 192.168.1.12:80 \
   --to-destination 192.168.1.16:80 \
   --to-destination 192.168.1.17:80

??

Thanks for any feedback or suggestions.

Ian


