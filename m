From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Masquerading on local ports
Date: Thu, 20 Mar 2003 16:29:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019C75@hslex01.hslbz.local>
References: <1048169013.1491.107.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1048169013.1491.107.camel@localhost.localdomain>
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

> And here is the question. How is it possible to nat a lokal port?
> 
> IPTABLES -t nat -A PREROUTING -p tcp -d 127.0.0.1 
> --destination-port 81 -j DNAT --to-destination 127.0.0.1:80
> 
> telnet localhost 80  <<< works
> telnet localhost 81  <<< Connection refused

iptables -t nat -A PREROUTING -d 127.0.0.1 -p tcp --dport 80 -j REDIRECT
--to-ports 81


Rob


