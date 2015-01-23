From: Thomas Preissler <thomas@preissler.co.uk>
Subject: Order of iptables vs. ip6tables chains
Date: Fri, 23 Jan 2015 22:31:16 +0000
Message-ID: <20150123223116.GA3522@blackhole.tracing.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello folks,

I am wondering in which order are iptables/ip6tables rules executed?
So for example I have the same rules on v4 and v6 on INPUT and FORWARD
matching MAC addresses, interestingly only ipv4's counters are <> 0.
(I know about ebtables.)

So I guess the order is v4 INPUT then v6, after that v4 FORWARD then v6
- for example?

And yes, I can't wait for nftables to go live...


Kind Regards

Thomas

-- 
www.preissler.co.uk | Twitter: @module0x90 | PGP-Key: 75889415
GPG Fingerprint:  CCBD 153A D257 CA7E A217  FDF7 5928 03D1 7588 9415
