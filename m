From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables port80 forward and snat
Date: Fri, 13 Jan 2006 22:36:39 +0100
Message-ID: <000601c61889$7032a030$0101000a@sterenborg.info>
References: <005701c61875$46484720$6c00a8c0@ATMIT>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005701c61875$46484720$6c00a8c0@ATMIT>
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

> I have a RH ES4 box with 3 eth.ports and safesquid installed.
> Safesquid listens on port 8080.
> Eth0 = 1.1.1.1  (Internet connection)
> Eth1 =  2.2.2.2
> Eth2 = 192.168.1.1 (needs to be sNATted)
> 
> How do I setup iptables to:
> 
> 1- Snat traffic coming in on eth2

Via which NIC ? My "magical powers" tell me that it's probably eth0.

$ipt -t nat -A POSTROUTING -i eth2 -s 192.168.1.0/24 \
  -j SNAT --to 1.1.1.1

> 2- port forward http traffic coming in on eth1 to port 8080 (so it
> will hit the safesquid running on the box)

$ipt -t nat -A PREROUTING -i eth1 -p tcp --dport 80 \
  -j DNAT --to 2.2.2.2:8080


Gr,
Rob


