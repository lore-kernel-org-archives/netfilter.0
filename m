From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Port Forwarding
Date: Wed, 3 Dec 2003 09:44:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203113124.7C79A1B9B8@smtp.ttp.nl>
References: <039a01c3b977$41188a80$6e69690a@RIMAS>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <039a01c3b977$41188a80$6e69690a@RIMAS>
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

> iptables -t nat -A PREROUTING -d $EXTERNALIP_1 -s 
> some_external_IP -p 47 -j
> DNAT --to 192.168.0.19
> 
> How to add more source addresses which will be able to connect?

Add more rules like these that allow it.
Or maybe you compiled a new kernel with netfilter iprange support.
http://www.netfilter.org/documentation/pomlist/pom-combined.html#iprange


Gr,
Rob


