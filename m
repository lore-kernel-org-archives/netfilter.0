From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: SNAT?
Date: Tue, 29 Oct 2002 14:17:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c27f4d$87579af0$0401000a@robbysan.org>
References: <003f01c27f47$60e06740$c800640a@grooverider>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003f01c27f47$60e06740$c800640a@grooverider>
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
To: 'NetFilter Mailing List' <netfilter@lists.samba.org>

> The thing is, is there any way to SNAT a individual computer on my
> internal network to a different public ip address?

Sure.

> All my internal network is masqueraded as the x.x.x.98/24 ip
> address. I
> want to SNAT my internal IP address 10.100.0.200 to
> x.x.x.99/24 Is that
> possible?

Create the rules in this order :

# iptables -t nat -A POSTROUTING -s 10.100.0.200 -j SNAT --to-source
x.x.x.99
# iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -j SNAT --to-source
x.x.x.98

# iptables -A FORWARD -s 10.100.0.200 -d x.x.x.99 -j ACCEPT
# iptables -A FORWARD -s 10.100.0.0/24 -d x.x.x.98 -j ACCEPT

When the first rule is matched, it is executed.
So your PC on 10.100.0.200 hits first its own rule so never hits the
subnet rule.
The other PC's don't hit the specific rule and match the subnet rule.
Of course the PC would have to have a static IP address, because
otherwise another PC could be 10.100.0.200...


Rob


