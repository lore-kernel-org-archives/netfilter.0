Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298B1C290
	for <netfilter@vger.kernel.org>; Mon,  5 Feb 2024 12:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707136529; cv=pass; b=oTYKc55JFFeGKk34Wz/TrNlhUOBzrBuSE9jS9PJw9rmvurc8cOeJGIN2qo7J/L8IO2P9rQg/Ao+f+8U0lOdpeIwbiFpnhlTgnHLOB+7nkGxW26asNbmYxzMCtjPKwnpMr74wnmyjrXb9RdcSmtn0YmA+KGTr2v5cecqX1R+nJFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707136529; c=relaxed/simple;
	bh=yn3VevYC18V6ORmELU6GOG7EyGT3uBK3dm6bK4VqHgE=;
	h=Date:From:To:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MoWpdYQXV8yznAAqoUXNpQXkicWfBCiAk9Tb4tpI7uE4QMsSVLcOzGBuKXGA9BsXCeurK0Oar93vpj2cNmMn6NDEWqy0TlLvT9jWPb9fk2Gx1kEG7/v6A1ZYXppBGTA8Imd5c2VNX+aLYG9Lw40L5R7mnbQPdSjPBRRmke64WQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=TrfRaAvW; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="TrfRaAvW"
Received: from mail.home (82-181-196-180.bb.dnainternet.fi [82.181.196.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: timo.lindfors)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4TT5SQ04nkz49Q4P
	for <netfilter@vger.kernel.org>; Mon,  5 Feb 2024 14:35:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1707136518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q9DejiK2VmkxxUHh6HGM4AQKPxu4/BXCRs6eEa5slDI=;
	b=TrfRaAvWXei3YdrJ9XDfXKJ2CQtDyqcPb2oomXuEacabd5uP+UFIdfgH+KIDdzyGY91vAj
	cxZV65vhsQ+RKqhHRfWNFYtLyZTvlGfKpVyCEdSlaA6VTqKjwR1yfSwY7LEUFjSQTSeU8S
	1ZKkhYVbVz+CzLXfi5R2e8H0x62DkYEyksxZDWZAT49t0CEAalfhzA3U5CAYJA4ODTwXMH
	2Mti0EiM8T12fruiq8ZANTJC7qC4ZjacmWl1l1SMJzHkNrJgoFF0hpP6D2fYU+qKEt4HMS
	vM28YxR0NeGvaa/HiYZXFU8lUDErVuG/tI2PvyKDuMruXARRD7JrReYN1El4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1707136518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q9DejiK2VmkxxUHh6HGM4AQKPxu4/BXCRs6eEa5slDI=;
	b=pnCpJMND+7J2OYoMbdqL2cDi3hIv02R0A32pWmsdzFMI/qGYZ6Vke0pTPIqUkqt4z1z/z7
	c9SKLQQvx7tQ5imNXRySf5mXqhz1nM/WMLM9eaXNK2ufbqxFUtViUB+WhPD6/5hrgafPF9
	0Y6MdnZbLsjUMn2YkYnvvQ/gNI2KhnR4pO6n615QO2ZaKAXrZH2dCmKJJu/8hJjNcjd64u
	NBtBbuKQd3NLj5wjTRZ7DXK//fyP/x13qb7sPaIHzn45RKwjytnW5CDJxWneLOFHKGSpkA
	GqXTVp9YPXH1Q8x63aYKxo+4wxlFM8d/m6Z+i5onY8Ax54mmLMTbBwCtRPZPSg==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1707136518; a=rsa-sha256;
	cv=none;
	b=q2gGfXzVOobRsKpasPGSg74N2ODzlEGalUp8BVtBhoGzNycxRfJldYHXv4ZiX6R4GnFhGF
	ExRYx9NaZQ8xRK51d93esDqGLB3LVuxV1q+/7z5eU9J2c+FY2F1U0c3AzY45slxqRCY9dM
	zin3cq205DLHw1JL2VV0yzhzUtzdDlnbEwAqvGD39QnchG3tO4EM/+eEz6mwzuS4oIzhCk
	VlFK3ps/xy5U2uy8ho5odf+pms39oAlyPRYrYrtR8GIO1OMdzqiRXrFbQ3pX6CHfLpoXCf
	ZOX1ggFIIlGSuiGYXtZSxnPhOMsWLaOevP+ZtN/eHQkzGf16d2YAnJptDlc5Ew==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=timo.lindfors smtp.mailfrom=timo.lindfors@iki.fi
Received: from localhost ([127.0.0.1])
	by mail.home with esmtp (Exim 4.89)
	(envelope-from <timo.lindfors@iki.fi>)
	id 1rWyBx-0001il-Jv
	for netfilter@vger.kernel.org; Mon, 05 Feb 2024 14:35:17 +0200
Date: Mon, 5 Feb 2024 14:35:17 +0200 (EET)
From: Timo Lindfors <timo.lindfors@iki.fi>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Analyzing firewall rules programmatically
In-Reply-To: <20240203114527.GA20263@breakpoint.cc>
Message-ID: <alpine.DEB.2.20.2402051429360.6588@mail.home>
References: <alpine.DEB.2.20.2401302150460.27550@mail.home> <20240201203448.a7b1957192995e4553be546c@plushkava.net> <alpine.DEB.2.20.2402022057110.2274@mail.home> <20240203114527.GA20263@breakpoint.cc>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed



On Sat, 3 Feb 2024, Florian Westphal wrote:
> Text is rather unstable, I would not rely on it.
>
> json ought to be stable, netlink is stable (its the api after all).

Thanks. I implemented my first prototype on the JSON output, and only for 
netfilter for now. You can give it a ruleset, desired verdict and extra
constraints and it will find a packet that achieves the desired verdict if 
it exists.

Here are some examples:

nftables_analysis$ for i in test_data/*.nft; do echo "#### $i"; cat $i; ./find_satisfying_packet.py --json-ruleset $i.json -c tcp.dport==1234; done

#### test_data/complex1.nft
#!/usr/sbin/nft -f

table inet my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
 	meta nfproto ipv6 tcp sport 53 meta length == 200 iif > 0 ip6 saddr fe80::fca5:f7ff:febc:97a4 tcp dport 1234 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=-1
ip.saddr=-1
ip6.daddr=0
ip6.saddr=338288524927261089672224126588925286308
meta.iif=1
meta.l4proto=6
meta.length=200
meta.nfproto=10
tcp.dport=1234
tcp.sport=53
udp.dport=-1
udp.sport=-1
#### test_data/complex2.nft
#!/usr/sbin/nft -f

table inet my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
 	meta nfproto ipv6 tcp dport 1234 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=-1
ip.saddr=-1
ip6.daddr=0
ip6.saddr=0
meta.iif=0
meta.l4proto=6
meta.length=0
meta.nfproto=10
tcp.dport=1234
tcp.sport=0
udp.dport=-1
udp.sport=-1
#### test_data/source_iface.nft
#!/usr/sbin/nft -f

table inet my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
         iif enp0s31f6 tcp dport 1234 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=0
ip.saddr=0
ip6.daddr=-1
ip6.saddr=-1
meta.iif=0
meta.l4proto=6
meta.length=0
meta.nfproto=2
tcp.dport=1234
tcp.sport=0
udp.dport=-1
udp.sport=-1
#### test_data/source_ip2.nft
#!/usr/sbin/nft -f

table inet my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
 	tcp dport 1234 jump helper
 	tcp dport 1234 accept
     }
     chain helper {
         ip saddr 10.61.7.4 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=0
ip.saddr=171771652
ip6.daddr=-1
ip6.saddr=-1
meta.iif=0
meta.l4proto=6
meta.length=0
meta.nfproto=2
tcp.dport=1234
tcp.sport=0
udp.dport=-1
udp.sport=-1
#### test_data/source_ip.nft
#!/usr/sbin/nft -f

table inet my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
         tcp dport 1234 ip saddr 10.61.7.4 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=0
ip.saddr=171771652
ip6.daddr=-1
ip6.saddr=-1
meta.iif=0
meta.l4proto=6
meta.length=0
meta.nfproto=2
tcp.dport=1234
tcp.sport=0
udp.dport=-1
udp.sport=-1
#### test_data/source_port_ipv6.nft
#!/usr/sbin/nft -f

table ip my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
 	tcp dport 1234 drop
     }
}

table ip6 my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
         tcp dport 1234 tcp sport 53 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=-1
ip.saddr=-1
ip6.daddr=0
ip6.saddr=0
meta.iif=0
meta.l4proto=6
meta.length=0
meta.nfproto=10
tcp.dport=1234
tcp.sport=53
udp.dport=-1
udp.sport=-1
#### test_data/source_port.nft
#!/usr/sbin/nft -f

table inet my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
         tcp dport 1234 tcp sport 53 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=0
ip.saddr=0
ip6.daddr=-1
ip6.saddr=-1
meta.iif=0
meta.l4proto=6
meta.length=0
meta.nfproto=2
tcp.dport=1234
tcp.sport=53
udp.dport=-1
udp.sport=-1
#### test_data/source_port_range.nft
#!/usr/sbin/nft -f

table inet my_filter {
     chain input {
         type filter hook input priority 0; policy accept;
 	tcp sport {50-55} tcp dport 1234 accept
 	tcp dport 1234 drop
     }
}
Satified
ip.daddr=0
ip.saddr=0
ip6.daddr=-1
ip6.saddr=-1
meta.iif=0
meta.l4proto=6
meta.length=0
meta.nfproto=2
tcp.dport=1234
tcp.sport=50
udp.dport=-1
udp.sport=-1


I put the code to https://github.com/lindi2/nftables_analysis

(MIT license, do whatever you want but I would appreciate bug fixes so 
that I can make it more reliable and maybe implement iptables support 
later as well)

-Timo

