From: Olaf Zaplinski <olaf@zaplinski.de>
Subject: Re: lots of ACKs for DPT=1433
Date: Mon, 08 Aug 2016 10:16:03 +0200
Message-ID: <bf5e106359174bc234805b6d5539d136@mail.zaplinski.de>
References: <d5bbb8f26b17a1d6cf8044864b7aa587@mail.zaplinski.de>
 <5342a37e-1534-59bd-16ac-dc4df108fea7@sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zaplinski.de;
	s=20150415; t=1470644163;
	bh=IGlEHnpmnl+cif4Gi8aJUGgUcLDc9uddhKed+pMa6Qw=;
	h=To:Subject:Date:From:In-Reply-To:References;
	b=AuhTMiHEuQFNEL5UJXixkMn7hewv9lr/g2Xqcedr4yHBiep7UrqWbdFX9Hko6ztEv
	 rN1vyWcVFXLQpkenwqgN7dSfQUX/bNuy33BAUJF0O7XfmR8pxPruyS2kPNh7tu8GRh
	 eesPNC5npKC5QhYm8c0HyyUmIGJ5zzY2RBVllO1hWDwFJ+HQiLN4xJbs1102oaEX3R
	 DnfKisBhp9BE8DY5fpLY5LMO++iSzrNV98f21QqlhxvsP0JryMFKGoTKpacKYPWIjC
	 tvKGsUSq6yp8VvhSbGVoYvT8wjrBHKMDQuAl2NkuFDxEWEa1+4rAi8oG911EFFiz0G
	 6dEtIltxPMe+A==
In-Reply-To: <5342a37e-1534-59bd-16ac-dc4df108fea7@sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Am 2016-08-07 17:29, schrieb Rob Sterenborg (Lists):
> On 04-08-16 12:46, Olaf Zaplinski wrote:
>> Hi,
>> 
>> I see lots of ACKs for DPT=1433 in my logs. Anyone else?
>> 
>> Any idea what is the reason for this?
>> 
>> Olaf
> 
> A lot of scans for a vulnerable MSSQL server.

That would be true if that were SYN requests. But 90% of these requests 
or so are ACK requests.

Olaf
