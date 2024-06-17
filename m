Received: from premium.cp1-nvme.srvhr.com.br (premium.cp1-nvme.srvhr.com.br [50.114.62.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3C31552F6
	for <netfilter@vger.kernel.org>; Mon, 17 Jun 2024 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.114.62.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634372; cv=none; b=VglIdElkPG3nADFoMo2quz/2AA29nZ+QjJ1OHXXe5vkMHyheylmW5Ac3P6jvaDTzTv1EG1+CkuJlIatefJHCh6yqfjhyY2pnP2WvCbm2qybpCYRb2e9P8Ol1u0vb/itrhWmrb1QibsTw2gthweAPwSBDlJ9iUCmJt5tG7wY9nn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634372; c=relaxed/simple;
	bh=REQwEmLtb50m1h4f6QyzWPhGJ+Uw1LvmiM8/du7aQNM=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=Jw20Ps0++LgDvaLm15zpDFt0j9B5QCR+SGoLtR4oCgPQT6OwuaQPj3shKsUKS5TP0Y8AAyn2c3SnVL6G1gVesdAVwH1g5oEuFognKfV9FbbvqOqDB25n8FBcQo90dpcwKVmoVxnN/eNET3ZX2cZGyCOZU4rRSU5Pb0qfE5LpyKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=contatoglobal.com.br; spf=pass smtp.mailfrom=contatoglobal.com.br; dkim=pass (2048-bit key) header.d=contatoglobal.com.br header.i=@contatoglobal.com.br header.b=WOzVnEgP; arc=none smtp.client-ip=50.114.62.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=contatoglobal.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contatoglobal.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=contatoglobal.com.br header.i=@contatoglobal.com.br header.b="WOzVnEgP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=contatoglobal.com.br; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZfdnEiFHA6lfXZpysIX7ZrsrRCEtlrLkeDYWZYV7+Vk=; b=WOzVnEgPT7FYdDXS7Q7jkqZKgd
	YZf2niwVKfoWnwkUKFGxz2AURs0SLS1tlYQH76VoDRLWscOLuI8WNrjwZA2I8RxfDplMUbp31+pWL
	mHBo67ZKsIfDR/qsXhj+gZchN0+PBxbEJZ1XfIzEeSUydTtWkVH5K1LelpYAvYa+dmN5hJESTJYVs
	F0s1ApGG/NWKmTWuXuE/LSfS+txfRLkaXtYJbDt0wV1nlrY8wNQFYd3wZKUUs9YfHb5ClLpl2rw8r
	HU22bqJJ5880ChEaTJq+tHdt9rB/aWE19ff2lHgzVpZm7sHOi8ARuKqNSnHmgk+eVTdhOqNPRGfo9
	tGBB20ag==;
Received: from [127.0.0.1] (port=36594 helo=cp1-nvme.srvhr.com.br)
	by cp1-nvme.srvhr.com.br with esmtpa (Exim 4.97.1)
	(envelope-from <pauloric@contatoglobal.com.br>)
	id 1sJDBX-00000000OX6-0wRR
	for netfilter@vger.kernel.org;
	Mon, 17 Jun 2024 11:18:14 -0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 17 Jun 2024 11:18:14 -0300
From: Paulo Ricardo Bruck <pauloric@contatoglobal.com.br>
To: netfilter@vger.kernel.org
Subject: bidge not working. Missing rules?
User-Agent: Roundcube Webmail/1.6.6
Message-ID: <14b584a2bbe39c4769491670d58b47e6@contatoglobal.com.br>
X-Sender: pauloric@contatoglobal.com.br
Organization: =?UTF-8?Q?Contato_Global_Presta=C3=A7=C3=A3o_de_Sevi=C3=A7o?=
 =?UTF-8?Q?s?=
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp1-nvme.srvhr.com.br
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - contatoglobal.com.br
X-Get-Message-Sender-Via: cp1-nvme.srvhr.com.br: authenticated_id: pauloric@contatoglobal.com.br
X-Authenticated-Sender: cp1-nvme.srvhr.com.br: pauloric@contatoglobal.com.br
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Hi

I have been using firewall rules since ipchais.. Thank guys for all 
excelent work.

Never used ebtables and now that I am using netfilter I think that I 
must be using bridge rules in this case...

What I'm facing now and I would like a help.

Host + virtual machine using Incus and a bridge interface .

host wan 192.168.1.2
virtual machine ( bridge with wan above): 192.168.1.3

All I want is to redirect one port to host and rest to a virtual machine

redirect is easy and is working...80)
add rule inet nat PREROUTING iifname "wan1" ip protocol tcp tcp dport 22 
dnat ip to 192.168.1.2

Problem is redirect the rest to virtual machine. 8(
net.ipv4.ip_forward = 1

Figure at 
https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks is 
very helpfull 80)

I create addicionaly all tables and chains to bridge:
add table bridge filter
add chain bridge filter POSTROUTING { type filter hook postrouting 
priority 0;  policy accept; }
add chain bridge filter FORWARD { type filter hook forward priority 0;  
policy accept; }
add chain bridge filter OUTPUT { type filter hook output priority 0;  
policy accept; }
add chain bridge filter INPUT { type filter hook input priority 0;  
policy accept; }
add chain bridge filter PREROUTING { type filter hook prerouting 
priority 0;  policy accept; }

Is there a page or an example  using netfiletr + bridge?
An example of Prerouting an Postrouting bridge? ( Not sure if its 
case....)

best regards
