From: "Remus" <rmocius@auste.elnet.lt>
Subject: Port Forwarding
Date: Wed, 3 Dec 2003 08:26:43 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <039a01c3b977$41188a80$6e69690a@RIMAS>
References: <3FCEC98A.8000703@mchsi.com>
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

Hi folks,

I have a PREROUTING rule:
iptables -t nat -A PREROUTING -d $EXTERNALIP_1 -s some_external_IP -p 47 -j
DNAT --to 192.168.0.19

How to add more source addresses which will be able to connect?


Thanks in advance

Remus


