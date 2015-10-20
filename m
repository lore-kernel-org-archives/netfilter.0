From: giorgio.nicole@arcor.de
Subject: nft 'script' not working
Date: Tue, 20 Oct 2015 10:02:00 +0200 (CEST)
Message-ID: <808081249.162491.1445328120632.JavaMail.ngmail@webmail12.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcor.de; s=mail-in;
	t=1445328120; bh=ZHU1pz8EtlbXCQyyssi3r6B3rXxfEJuwblc3Uv/NIMA=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=csm82B1e4Zw3hg29vAiCMedk/CMYm/KPTf/jFIG+5Mr1kbEOzsXATGY9/evDWynvF
	 l03xL6D+vg7Y54QwcmhfOpuTFNvvKDk1XhBVoQ9bq9hLD7m/yDUb6ZedfDF3seNLJh
	 ygLOeNNSwQ3WmhC3Dd5ug2d9izB9l6dwmZDmbv6s=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm facing problems trying to run a simple nft script to
setup a very simple firewall.

Here are the script pieces:

# cat /etc/nftables/fw_basic.nft
#!/sbin/nft -f
flush ruleset
include "/etc/nftables/ipv4-nat"
include "/etc/nftables/ipv6-nat"
table inet filter {
	chain input {
		type filter hook input priority 0; policy accept;
		iif lo accept
		ct state established,related accept
		ip6 nexthdr icmpv6 icmpv6 type { nd-neighbor-solicit, echo-request, nd-router-advert, nd-neighbor-advert } accept
		tcp dport { 22, 80, 443 } accept
		udp dport { 5353 } accept
	}
}
include "/var/lib/nftables/user.nft"

and:

# cat /var/lib/nftables/user.nft
add chain inet filter input { policy drop; }
# 

And here is the result:
# /etc/nftables/fw_basic.nft
In file included from ./fw_basic.nft:15:1-37:
/var/lib/nftables/user.nft:1:1-45: Error: Could not process rule: No such file or directory
add chain inet filter input { policy drop; }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# 

Further, I noticed that if I remove the last 'include' from the main script, 'fw_basic.nft',
and issue the last command manually:
# nft add chain inet filter input { policy drop\; }
#

it works.

My second question is:

should it be possible to 'include' empty .nft files in a script without having errors ?


thanks,

giorgio
