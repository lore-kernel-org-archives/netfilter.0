From: "John York" <john@logihost.com>
Subject: RE: Windows VPN server behind iptables
Date: Fri, 17 Jan 2003 00:53:28 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c2bdf5$2472b690$0200a8c0@loaner>
References: <000e01c2bdd0$2314d410$0200a8c0@loaner>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c2bdd0$2314d410$0200a8c0@loaner>
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

Got it.

Started using shorewall, and configured it per their instructions. Sorry
to waste bandwidth :)

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of John York
Sent: Thursday, January 16, 2003 20:27
To: netfilter@lists.netfilter.org
Subject: Windows VPN server behind iptables

Hi all,

I set up my first IPtables box, doing NAT and port forwarding. I've
managed to Google most of the kinks out, but this one perplexes me.
There is a Win2K VPN server behind the firewall, using PPTP. It will
accept connections, but chokes before accepting the username/password.
The most I've been able to figure out is that it has something to do
with protocol 47.

All other forwards (HTTP, HTTPS, POP, SMTP, Telnet) work fine. Any
ideas?

Thanks,
John



