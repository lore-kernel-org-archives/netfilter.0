From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Help on IPTABLES
Date: Thu, 9 Oct 2003 15:54:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031009164635.174791B8D7@smtp.ttp.nl>
References: <83055D4B014C9E478D2F04624B9E82CF39E7D2@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CF39E7D2@noveldc.novelgmt.mu>
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
To: 'Gilles Yue' <gyue@novelgmt.intnet.mu>, netfilter@lists.netfilter.org

> Can somebody explain to me why is when i changed my Chain 
> INPUT Rules from ACCEPT to DROP, i cannot browse the internet 
> despite opening port 80 in the INPUT rule.
...
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> RH-Lokkit-0-50-INPUT  all  --  anywhere             anywhere
> ACCEPT     tcp  --  anywhere             anywhere           
> tcp spt:http
> ACCEPT     udp  --  anywhere             anywhere           
> udp spt:http

Because you used sport. You are trying to reach servers that are
*listening* on port 80/443 so you should use dport (destination = port
80/443). You are most likely not sending from port 80/443.


Gr,
Rob


