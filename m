From: Richard Horton <arimus.uk@googlemail.com>
Subject: Re: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 16:26:31 +0100
Message-ID: <56378e320906240826w146d9f1cnd443a5997137e281@mail.gmail.com>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>
	 <200906241320.13779.christoph.paasch@gmail.com>
	 <1872.192.168.1.3.1245842645.squirrel@webmail.decimal.pt>
	 <200906241347.41841.christoph.paasch@gmail.com>
	 <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=jugC/mRdOoFNBw/Zw9/HjY1hucQRAcpd/BcALu9hqfs=;
        b=wD5tqagLswNFjrowfRcZ0ZLcTpYBmtFd/hJHBZ+ESNIzU41RLnjYckh8iDrwx9PPFX
         QHjo5pQ1yZDxtEnRdWFf0V/Bkzrk0e13yvOM/HkMFDXSJBDmGOrZOaYoq1waQDepUEI/
         wRmDZ1rxfLDqQml0PO+iuKFCQCIb8qRTSeH4k=
In-Reply-To: <2108.192.168.1.3.1245856012.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> no luck:
>
> I think it's always better to first allow, and drop in the end, no?
>
> iptables -t filter -A FORWARD -p tcp --dport 22 -j ACCEPT
> iptables -t filter -A FORWARD -m state --state NEW -p tcp --dport 22 -j
> ACCEPT
> or
> iptables -t filter -A FORWARD -o eth1 -m state --state NEW -p tcp --dport
> 22 -j ACCEPT
> iptables -t filter -A FORWARD -j DROP
>

You are always advised to make the default rule (Ie policy) drop with
any firewall then only explicitly allow traffic you wish allow:

(I am assuming here you want to allow connections *to* port 22 on the
external network from your internal network, for my example the
internal network has an ip address of 192.168.0.0/24)
iptables -t filter -F FORWARD  # Clear out what exists already
iptables -t filter -P FORWARD -j drop # Set default to drop
iptables -t filter -A FORWARD -s 192.168.0.0/24 -d ! 192.168.0.0/24 -p
tcp --dport 22 -j ACCEPT


--
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
