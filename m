From: Rohan Almeida <arc_of_descent@gmx.net>
Subject: iptables REDIRECT with patch-o-matic
Date: Fri, 13 Sep 2002 16:16:33 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02091316163300.00916@sanitarium>
Reply-To: arc_of_descent@gmx.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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


Hi List,

Take the following command:
[rohan@sanitarium rohan]$ iptables -t nat -i eth0 -A PREROUTING \
			--protocol tcp -s 10.0.0.0/255.255.255.0 \
			-d 10.0.0.1/32 --dport www -j REDIRECT \
			--to-port 800

With redhat rpms, kernel-2.4.18-5, iptables-1.2.5-3
the above command works fine.

Now, i downloaded iptables-1.2.7a, patch-o-matic-20020825
and using kernel source tree of 2.4.18
I applied the following patches of patch-o-matic:
	base AND extra

Then i compiled the kernel.
Now with this patched kernel and iptables-1.2.5-3 rpm,
I am getting the following error when running the above command:
"iptables: Invalid argument"

What am i doing wrong?

If i just have to upgrade my iptables to 1.2.7a, then
i'm sorry for posting this :-)

Thanx

--
arc_of_descent


