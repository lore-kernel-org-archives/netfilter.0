Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C060E3FBA4
	for <netfilter@vger.kernel.org>; Sun,  5 May 2024 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714937174; cv=none; b=UI2GRZMLMYt2MekIICC3nrOKvW19gHTezX8w1IXP+86c2HrbEH5zmgrpVZp1U52eqb45qArl9Ldr2RAGHAwpSU/hkOdhji7lM1Hu7MNd4vHD1ocFhelCFZ4yQXG+G4yGRxG9gBI1odnWd6+GT1B+b7Zd4sfrRgVYAkob+TnkqyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714937174; c=relaxed/simple;
	bh=6n+uufhB3BNkW3iStmney5wOigXxaHejVywOnw7PHkI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=BGFZMkn+cPVqjGEWVHHQWdXwjoopQreRp/wyeID5j9ZJE5PzxRt/p7MIThlN7rHnFOvy7VBTS0vV3XQj8NjGBEguxiUJ2Ib03Yvr0hYHpDQKkhVlQnjnayDthPkXk8Xr/pACNlU2Fb51vwfEeF7heUeZUj0YGiaxuddTN/6EJy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=B0A9Llh/; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="B0A9Llh/"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4VXZJt3Sbxz9vQB
	for <netfilter@vger.kernel.org>; Sun,  5 May 2024 19:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1714937166; bh=6n+uufhB3BNkW3iStmney5wOigXxaHejVywOnw7PHkI=;
	h=Date:From:To:Subject:Reply-To:From;
	b=B0A9Llh/h9nSNbDF0kYDE6iYuqITcxIWfh3PTESwnXuduyf0W1T73KOie8SeH4c+6
	 2JKFt13FZQcFFg2mjnoYbCce25HH5OUa+P374nWSML6KopDMiCE8JqSi+a8Abm+bKy
	 7xzawIqFQSJ/uY2nwl+kKTjE2jpl8YyPhBbNufkw=
X-Riseup-User-ID: 3B4B6909F1B028BAA5502B41B1F97957681D51624FDA6A5D5861B8750B025A3E
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VXZJd6JdtzFwmW
	for <netfilter@vger.kernel.org>; Sun,  5 May 2024 19:25:53 +0000 (UTC)
Date: Sun, 5 May 2024 19:25:31 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Sets nesting/reference? Complex concatenations in vmaps?
Message-ID: <20240505192531.5e4ed8a8@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I am trying to use one set inside another. However, none of my two
attempts work. Simplified example:

# cat test 
#!/usr/sbin/nft -f

table ip6 t {
        define ranges = {
                2001:db8:85::/60,
                2001:dd8:23::/48,
		# ...
        }

        set ONE {
                type ipv6_addr
                flags interval
                auto-merge
                counter packets 0 bytes 0
                elements = { $ranges }
        }

        set TWO {
                type icmpv6_type . icmpv6_code . ipv6_addr . ipv6_addr
                flags interval
                auto-merge
                counter packets 0 bytes 0
                elements = {
                        1 . 2 . ::/0 . @ONE,
                        3 . 4 . ::/0 . $ranges
			# ...
                }
        }
}

# nft -c -f test 
test:22:19-19: Error: syntax error, unexpected @
                        1 . 2 . ::/0 . @ONE,
                                       ^
test:23:4-4: Error: syntax error, unexpected number
                        3 . 4 . ::/0 . $ranges
                        ^
test:26:1-1: Error: syntax error, unexpected '}'
}
^

# nft -v
nftables v1.0.6 (Lester Gooch #5)


What is the correct way to do this?


XY: Ideally, I would also like to have similarly structured vmaps,
including also 'ct state' as part of the concatenations in a complex
vmap, instead of a set, e.g. (pseudo code):

iifgroup . icmpv6_type . icmpv6_code . ip6_saddr . ip6_daddr . ct_state : verdict

What is the syntax for that?
