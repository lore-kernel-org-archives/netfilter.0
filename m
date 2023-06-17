From: Serg <seentr@at.encryp.ch>
Subject: Re: Modify packet without NAT
Date: Sat, 17 Jun 2023 11:51:37 +0300
Message-ID: <7b90de24-a2c9-a007-010d-ec79db65bbe0@at.encryp.ch>
References: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
        s=flopster; t=1686991898;
        bh=w47cdz6DHugjFmBOzp3ZPXUvupyfS2Azc+paPkrPodg=;
        h=Date:Subject:To:References:From:Cc:In-Reply-To;
        b=IqQaco0v6ogIbUxechvkYjIKo/gyO1rH+v/rp8aDzpnbmENUGQVvT3a2nKSQdWnD3
         8yNbI2xhkGuv5eFvEq0kA3TpJYBny5ztPDtpDfywp0e0JYctDSbYfrylqK0Vev5Q4v
         WhtTIDDPJv09dqfMqVyDrvNYz2HsiO2HC+/ottcs=
In-Reply-To: <GYTTaXkbSkEr3VAyArWUUy2ZOCgqBJ91AiJN2WBVdBUQrUJaHAUkn42u5EVDlPZXwlUJW49u1XMxGnJku_TPIRqLB4KXyBWUsEnw2LWef-k=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: public1020 <public1020@proton.me>

I am aware only about nftables based solution: 
https://wiki.nftables.org/wiki-nftables/index.php/Mangling_packet_headers

As far as I understand, your case uses "http_port" ipset with ports 
other than 80. In this scenario you will need to listen all required 
ports on the backend so nftables will just modify src/dst IP addresses 
accordingly. Otherwise it is impossible to do this conntrackless.

On 6/17/23 06:22, public1020 wrote:
> I have a simple nat configuration to forward certain access to a gateway:
> 
> iptables -t nat -A PREROUTING -p tcp -m set --match-set http_port dst,dst -j DNAT --to-destination XXX:80
> iptables -t nat -A POSTROUTING -j MASQUERADE
> 
> Can I do that without nat? Just trying to avoid the "conntrack table full" issue.
> Is there a non-stateful solution?
> 
