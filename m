From: "Slagter, EM" <eslagter@wlz.nl>
Subject: Possible bug ipsec and SNAT?
Date: Wed, 19 Dec 2007 12:42:44 +0100
Message-ID: <476903B4.8060303@wlz.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wlz.nl; h=message-id:date:
	from:mime-version:to:subject:content-type:
	content-transfer-encoding; q=dns/txt; s=2007072701; bh=8WCK6/q+F
	dvsmS03mZFyZqpkx7Y=; b=JeXavLt6XiubHzEFHxGK2UClpVg/j6ZaJssraTgiQ
	EXL/VtIYBvBm6yYBDOcoaLwno7nOHCQ9Gt0D3UwvvL5V2L1BmWjyUBPj0H4+YmdL
	ZXl0/ytI8wbjHxKxSTO7DM41CI/piWjjvrm+lV7z1EKOwD1CURIhH733SIVVqlId
	4I=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Hi,

I don't know whether this netfilter behaviour is a bug or intentional,
but at least for me it's not what I'd expect (nor want).

Our system (simplified to significant parts):
- linux i386 kernel 2.6.21.2 vanilla, almost all netfilter and ipsec
parts compiled in, no (relevant) modules
- one vlan interface connected to public internet
- one vlan interface connected to internal vlan, RFC addresses
- pluto ("openswan") to manage ISAKMP, appropriate config file
- some netfilter rules that include -m policy to separate the ipsec
traffic before and after encapsulation (for instance to prevent traffic
to be sent over internet without encryption)

Using this scenario, it works pretty much as documented.

As soon as I add SNAT to traffic originating from this vlan (as required
by our supplier), the rules that (properly) used to match on "-m policy
--pol ipsec --dir out --tunnel-src ... --tunnel-dst ..." no longer
match. Even if I remove the tunnel-src and --tunnel-dst the rule no
longer matches. If I change "the --pol ipsec" to "--pol none" the rule
matches again. This is wrong IMHO as the traffic is still encapsulated
(checked this with tshark) as expected.

I've checked the ChangeLogs of the kernel from 2.6.21.2 to current but
there doesn't seem to have been a relevant patch on this matter.

"Please help" ;-)

