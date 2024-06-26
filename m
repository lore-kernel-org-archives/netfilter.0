Received: from cam.del.bg (cam.del.bg [193.254.29.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334B5184123
	for <netfilter@vger.kernel.org>; Wed, 26 Jun 2024 14:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.254.29.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410674; cv=none; b=n0wSclIbNboh0wH6zN8TeMzjTDLHFBmkFRAwfiGHY1Py6+7W/lalzUOdH8RRogm07EnWrGk7p+PYy9WElcvpO42QReuNsv4gqvoqoEnUfW3Y6mkE5oT4yp96kDHHZDhht+JhDvdxuVrpvg5+2i0gM767DKee2aGrYpfvV/137h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410674; c=relaxed/simple;
	bh=0z/ci+qXLnqxVpqMaGyff+khlsruqK2HK3K9L2FF3lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mAWsBuM0U+Y4kL4zjRF4zznREpHcThsOQWhqJ14siuBu4AktDdQC3EL3vXogICinEoX45iwCxVR0A4DtIFyJoLr5jW/yFTP5XiBLAkldXnvoASQOA3slEQVNBTsdfuKlu7pFHgoDFkpIpKm+jift2Op1DZBMK1JFWWKrhPSJw4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg; spf=pass smtp.mailfrom=del.bg; dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b=L0gx47AO; arc=none smtp.client-ip=193.254.29.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=del.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b="L0gx47AO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=del.bg;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b4mjxFiBkNjogn0YFcPduqnVyb9+BxW/hQOpYUJLkGo=; b=L0gx47AOIv/nRFRBiniwspEdpW
	d4ZEyv44nSYGmZlhv+FhDoYWvJViilfXqHi9XGwSsrOP0dTcDXMyema8gCinNOR0vsVwgttRvnMCf
	YEgh7O4W6oIZ4KHeADOeJxm7o0DF0KzDjFt/Ygohz8cL6/8Y3EcLVfTgRp84BOEgvSzxROg420JOl
	3rm3fZAiMzlKuEPXhQaxHX5AZW4p7O/c+FG/PW5zJmQbjLtv4o8send8FD/eP24crY3VYDKyinQ04
	/HwcmHKmQaqKo5R0i1rVnFDh/IN6wJwBtbb7bMk9XoT/zo9aiXCFfNTdwaWwCnzzG3zqXFlVdYZhe
	3hdE+csA==;
Received: from mail.del.bg ([193.254.29.12]:42276)
	by cam.del.bg with esmtp (Exim 4.89)
	(envelope-from <tm@del.bg>)
	id 1sMSoi-0002KH-Ek
	for netfilter@vger.kernel.org; Wed, 26 Jun 2024 16:36:08 +0300
Received: (qmail 15729 invoked from network); 26 Jun 2024 13:36:08 -0000
Received: from unknown (HELO ?192.168.168.26?) (tm@del.bg@185.58.21.156)
  by mail.del.bg with DES-CBC3-SHA encrypted SMTP; 26 Jun 2024 13:36:08 -0000
Message-ID: <5d77f8fe-af85-4f63-a919-3c3be153a224@del.bg>
Date: Wed, 26 Jun 2024 16:36:07 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: nft not logging some layer 2 frames?
To: netfilter@vger.kernel.org
References: <20240524155729.4fd15210@localhost>
 <70c9f5d0-b6be-4ab2-b154-d9d334ebb19d@del.bg>
 <20240527171718.7db995bf@localhost>
 <371a8e68-4a89-41e3-880a-14e0a6371fdc@del.bg>
 <20240528150131.3ced9e3a@localhost> <ZmiWl7L5dA2HgYVL@calendula>
Content-Language: en-US
From: Teodor Milkov <tm@del.bg>
In-Reply-To: <ZmiWl7L5dA2HgYVL@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11.06.24 г. 21:25 ч., Pablo Neira Ayuso wrote:
> On Tue, May 28, 2024 at 03:01:31PM -0000, William N. wrote:
>> Following the example given here:
>>
>> https://www.freecodecamp.org/news/how-to-use-scapy-python-networking/
>>
>> I did sendp(frame) while watching 'journalctl -f'. It showed me:
>>
>> kernel: DEBUG: IN=eth0 OUT= MAC=ff:ff:ff:ff:ff:ff:00:11:22:33:44:55:90:00
>>
>> Unless I am completely mistaken, this L2 frame was sent and logged.
> For the record:
>
>          ... log prefix "test: " flags ether
>
> shows:
>
>          test: IN=eth0 OUT= MACSRC=90:dd:b4:12:ea:f0 MACDST=ff:ff:ff:ff:ff:ff MACPROTO=8899
>
I tried the simple nft ruleset shared by William in a previous message:

table netdev xxx {
         chain ingress {
                 type filter hook ingress device "eth-inet0" priority filter

                 ether type arp counter accept
                 ether type ip counter accept
                 vlan type arp counter accept
                 vlan type ip counter accept

                 counter limit rate 1/second log prefix "TEST: " flags ether
         }
}

The "arp" and "ip" rules I've added are there to suppress logging of 
non-relevant traffic.

Here's what traffic I'm seeing with tcpdump:

09:20:13.204053 0c:c4:7a:xx:yy:zz > ff:ff:ff:ff:ff:ff, ethertype AoE 
(0x88a2), length 60: AoE length 46, Ver 1, Flags: [none]

09:20:14.746200 b8:83:03:xx:yy:zz > 01:00:0c:cc:cc:cd, 802.3, length 50: 
LLC, dsap SNAP (0xaa) Individual, ssap SNAP (0xaa) Command, ctrl 0x03: 
oui Cisco (0x00000c), pid PVST (0x010b), length 42: STP 802.1w, Rapid 
STP, Flags [Proposal, Learn, Forward, Agreement], bridge-id 
8008.b8:83:03:39:89:00.800c, length 42

09:20:15.161805 b8:83:03:xx:yy:zz > 01:80:c2:00:00:0e, ethertype LLDP 
(0x88cc), length 279: LLDP, length 265: rackswitch-1-r6-v8

None of this is logged by nft.

Logging in general works, because if I remove some of the preceding 
rules e.g. "vlan type arp counter accept", then I'm seeing this:

Jun 26 09:25:15 coldspare1-us kernel: [2594462.618777] TEST: 
IN=eth-inet0 OUT= MACSRC=90:e2:ba:xx:yy:zz MACDST=ff:ff:ff:ff:ff:ff 
VPROTO=8100 VID=4 MACPROTO=0806 ARP HTYPE=1 PTYPE=0x0800 OPCODE=1 
MACSRC=90:e2:ba:xx:yy:zz IPSRC=aa.bb.197.2 MACDST=ff:ff:ff:ff:ff:ff 
IPDST=aa.bb.197.201

Could you confirm if a specific kernel or nft version is required for 
this? Also, should certain Ethernet driver features or offloading 
settings be disabled to accommodate these logging rules?

My kernel is "5.10.0-29-amd64 #1 SMP Debian 5.10.216-1 (2024-05-03)", 
nft v0.9.8 and ixgbe Ethernet driver.

