From: Richard Bellamy <richard.bellamy@virgin.net>
Subject: Being selective about traffic and interfaces
Date: Mon, 8 Mar 2004 15:07:59 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040308150758.GB16848@virgin.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi

I have just set up an ecrypted connection (with OpenVPN) between my laptop and router currently all traffic goes down the vpn. I would like to allow ssh traffic to bypass the vpn.

The situation is this:

Router:							Laptop:
192.168.0.1 - tun0					192.168.0.2 - tun0
	|							|
10.44.10.1 - eth0					10.44.10.2 - eth0
	|							|
	---------------------------------------------------------

The default route on the laptop is set to 192.168.0.1 so all traffic is automatically sent encrypted. I need to be able to send everything but ssh down the vpn(with the possibility for https later on). I beleive that this would have to happen before routing took place. OpenVPN is on udp/5000.

I would be very grateful for any assistance.

Richard 

