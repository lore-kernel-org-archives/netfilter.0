From: Andrew Beverley <andy@andybev.com>
Subject: RE: iptables - external IP address on internal interface?
Date: Tue, 12 Apr 2011 20:26:01 +0100
Message-ID: <1302636361.4938.9.camel@andybev-desktop>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local>
	 <1302544375.1551.11.camel@andybev>
	 <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1302636361; bh=MP9WrwIWmKV5+VbtzriJfU47TpFp4ZE49yQWp
	TEJXdg=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=n1pxAMb2
	uNRs+3secgpEqcqZ82keaV4TmkvxTXpi6yp6ACWbB1xQm5xYl5V+NVTlh4T6+JUi+bD
	Ido7370vN9NZW+2H9NQICWlWB/Hm08F1zpOOVK0rEOMmfMAnBedOgOxShlHIFyZ5T/K
	BIq2T+BpKP7FaLdIs1RRJYId+nE8c=
In-Reply-To: <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tony Rogers <Tony.Rogers@erudine.com>
Cc: netfilter@vger.kernel.org


> > Can you post the iptables rules that you are using, in particular the
> > NAT part? What IP address range are you using on the internal network?
> 
> As requested - output of "iptables -nL"
> 

Having scanned the list of rules (which were pretty difficult to read
due to line wrapping) I cannot see any SNAT/MASQUERADE targets? If so, I
would have thought that the behaviour you are seeing is to be expected.

Andy


