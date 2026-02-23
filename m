Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE9267B89
	for <netfilter@vger.kernel.org>; Mon, 23 Feb 2026 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858663; cv=none; b=ImnJuLd456s971CaojRciOP0pCiH46OKxgZsPyz5eP83LhbUXbpJ0XQtJyrVroaTeUSotaj82GKgimMWwV/K+GSR1VHf86lffrRTrNzBeo0FML8EfIdcipfzmGJHdDh1hk+kwo/L49i7G1tR7xO9gqqRtyNXRq6b6dF6a+E9mnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858663; c=relaxed/simple;
	bh=iBliVE3ytVyyX6j03nNi+2XHRvgO1pTbFQ8wSoAlk3Y=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=XenzieuYYeTVMMpAjaHAjuZFugMIr0+YiRfU+4ydBnQlw8adV0lyXuq56utw51T3tMhZbWmoKSuIlXtCIB/ynekmlxIjZBSZ7owxKhJb4Z/Fdd5WgVD0c5syLnIfUbhprTG4RL5WcR79lprPOwDl6OMhmmttLTL48T3M0Mh1XjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl; spf=pass smtp.mailfrom=yandex.pl; dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b=pw5xmLfp; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.pl header.i=@yandex.pl header.b="pw5xmLfp"
Received: from mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:3cca:0:640:f0e1:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id 46245C0058
	for <netfilter@vger.kernel.org>; Mon, 23 Feb 2026 17:57:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id TvgI09NG0eA0-aq0T390M;
	Mon, 23 Feb 2026 17:57:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.pl; s=mail;
	t=1771858651; bh=ip5Bx4sIRuw7oCjwF2FI7dqsvVfJOjVSo0G+FccQzLk=;
	h=Subject:To:From:Date:Message-ID;
	b=pw5xmLfpQINv7b2hBHaSPi1lvtQFoyc2XbAhAMEicwVXvQW/LTzz5J8iOwbCc214v
	 MgzGZ0YEKezD6QcJ5Yepa956UHPbQCkDGr1t5Ef7gi+9m255qEJLh74cyyFqfJNemM
	 /j+Qp7s8n98WzF0MB3rixHSR2DQ+72GLnPK3tBPc=
Authentication-Results: mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.pl
Message-ID: <6dbbb6b3-da22-4a09-8de7-ec2dc60d179f@yandex.pl>
Date: Mon, 23 Feb 2026 15:57:28 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US-large
From: Michal Soltys <msoltyspl@yandex.pl>
To: netfilter@vger.kernel.org
Subject: [BUG] "ether type ip" forgotten/implied when listing rules for
 'netdev' family
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

While testing the behavior of early filtering in netdev / ingress, I 
noticed something that possibly looks like a bug.

Consider following and interface with one vlan, e.g.

ip add add 10.0.0.1/24 dev eno1
ip li add li eno1 name v250 type vlan id 250
ip add add 10.10.10.1/24 dev v250
ip li set eno1 up
ip li set v250 up


Now consider following simple nft setup:

nft add table netdev efil
nft add chain netdev efil edev { hook ingress type filter device eno1 
priority filter; }
nft add rule netdev efil edev ether type ip icmp type echo-request counter
nft add rule netdev efil edev ether type vlan icmp type echo-request counter
nft add rule netdev efil edev icmp type echo-request counter

These will be listed by nft ruleset list as such:
table netdev efil {
         chain edev {
                 type filter hook ingress device "eno1" priority filter; 
policy accept;
                 icmp type echo-request counter packets 0 bytes 0
                 ether type 8021q icmp type echo-request counter packets 
0 bytes 0
                 icmp type echo-request counter packets 0 bytes 0
         }
}

Note that the first rule omits the "ether type ip" as if it was 'ip' 
family instead of 'netdev'. So the 1st and the 3rd are listed the same - 
but they work differently.

The first rule will only count plain ip payload, the 2nd rule will count 
only vlan payload, the 3rd will count both. So after 1 ping to 
10.10.10.1 and 1 ping to 10.0.0.1, the effect would be:

table netdev efil {
         chain edev {
                 type filter hook ingress device "eno1" priority filter; 
policy accept;
                 icmp type echo-request counter packets 1 bytes 84
                 ether type 8021q icmp type echo-request counter packets 
1 bytes 84
                 icmp type echo-request counter packets 2 bytes 168
         }
}

Furthermore it seems it's impossible to return to such ruleset via:

- nft list ruleset >rules
- flush tables
- nft -f rules

As this time the 1st and the 3rd rule actually will be identical both 
visually and functionally, omitting 'ether type ip' check completely.
