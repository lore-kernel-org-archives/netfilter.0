Received: from gorki.wkraft.org (gorki.wkraft.org [78.47.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D094C15ADAA
	for <netfilter@vger.kernel.org>; Wed, 29 May 2024 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.47.65.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716997612; cv=none; b=XcMT442/rOrME8M3soCl1QCWHHJ9OPeht/zB/YXxjw3qQWVZROja2kTNlOL/b2CHDjvad2TPNktuQQsGTsEdlYiSD2n9DqRv2Gqixc5ep8ZYJhuJxraYCaZDhYIkKOX349KeeHrfmd99Cltot67Am/xzYyvSESAv0FNIu5Pfw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716997612; c=relaxed/simple;
	bh=2TGh4u6YULPoStsNaKPEa3+zqulpjNf+Yj/MQSqnqlo=;
	h=Date:From:Message-ID:To:Subject:MIME-Version:Content-Type; b=WsidxPBtsLjMyBCARTFS697R8/55ab1J4Egro9pTiKn2ZFVSdBUKHL82QupifwYMSdHxH9hcgmZNjve9N2QOIqV0vaBIWSiRhSeH8VvC47haHGnGjzXSmleMAp873ysVLBrIefUn8BagdjtLXCJrUuUro9xs5W5U7gO9N1q2UEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wkraft.org; spf=pass smtp.mailfrom=wkraft.org; dkim=pass (2048-bit key) header.d=wkraft.org header.i=@wkraft.org header.b=NXlMRVHh; arc=none smtp.client-ip=78.47.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wkraft.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wkraft.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkraft.org header.i=@wkraft.org header.b="NXlMRVHh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wkraft.org;
	 s=42; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:To:
	Message-ID:From:Date; bh=mAhWghlxdn2muO55DLDOnSLHCinH05mwJOtdjtbkrYI=; b=NXlM
	RVHhbyXIkGU6sRVtITmBNVPPIhcyHoCNQTMPfHFnPAuKW/KucbJF5d3PwBGLWXHTeR4m5Xoo6Ez29
	cXYorz1pe+gTiRkQqjmTXhynXBdKiFvz5ntKm/JOuMIsmrjZp07Q198YZ1XOdmRj+FD2urQ41luLM
	m+CkmEm7+zO2vDxAAi+9xrDZ4JWFNCBbv5qmiiIxp0riFhZIekZgUSCsHH2lc+VvUygaZlAPudqgs
	3k7y+MEiuGs7O/Mg4KZJoZdX77DD6fvi8CF8cGMNv4mNtk1u3NDZkFedBA4LrU+DzxGQ/CcMyngaH
	w+e55T/jnVMuTbRVfci7tr0n2Dy2DQ==;
Received: from home.wkraft.org ([87.138.209.50] helo=wmk-workstation.wkraft.org)
	by gorki.wkraft.org with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
	(Exim 4.93)
	(envelope-from <netfilter-user@wkraft.org>)
	id 1sCLVd-0007no-4z
	for netfilter@vger.kernel.org; Wed, 29 May 2024 17:46:37 +0200
Date: Wed, 29 May 2024 17:46:30 +0200
From: Wolfgang <netfilter-user@wkraft.org>
Message-ID: <14110673198.20240529174630@WKraft.org>
To: netfilter@vger.kernel.org
Subject: Problems understanding nftables part 2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello all,

I have asked already some questions about nftables.  While diving deeper into it, there
are arising more questions.


In my last test I have hooked rules into the 5 inet hook filter destinations
( prerouting, input, output,postrouting, forward), to watch how packets are flowing to
my rules. Now I extended that, to see packets also flowing through nat destinations,
but I have seen no packets.

1)  It looks like, that it needs at least one configured nat-rule, which gets triggered
    to see packets flowing through the kernel. It looks like, that without such an initial
    trigger, trace is either
    a) not showing packets
    b) packet flow through nat is enabled only, after a first nat rule matched
       When I have a matching rule like in example 1, I see packets not only in prerouting,
       but also in input, output and postrouting, even when the chain contains no nat
       specific rule. But: For tcp this seems to be valid only for packets with SYN-Flag set,
       others are not showing up.
    c) As soon, as I had such a trigger-packet I see however all udp-traffic from the system,
       I have not seen, before the tcp rule triggered.
    So I have the question, if there are other options to get trace through nat-hooks enabled
    without having an initial trigger?
    Unfortunately the "dnat" option, does not allow to add a "meta nftrace set 1" behind this
    specific line, so i must trace in a more general way.
2) Prerouting, postrouting and route allow for for symbolic priorities, that seems to be broken
   for
   a) input  and
   b) output
   where I need to know the corresponding value. What is the reason behind this inconsistent
   behaviour?

I would be glad, receiving answers and/or tips for further actions, I could try?

Here my tracing configuration:

>table ip nat {
>        chain prerouting_nat{
>                type nat hook prerouting priority dstnat ; policy accept;
>## 1)
>                ip saddr AA.BB.CC.DD tcp dport 443 dnat ip to BB.CC.DD.EE
>                meta nftrace set 1
>        }
>
>        chain postrouting_nat {
>                type nat hook postrouting priority srcnat ; policy accept;
>                meta nftrace set 1
>        }
>
>        chain input_nat {
>## 2a)
># broken:       type nat hook input priority srcnat ; policy accept;
>                type nat hook input priority  100 ; policy accept;
>                meta nftrace set 1
>        }
>
>        chain output_nat {
>## 2b)
># broken:       type nat hook output priority dstnat ; policy accept;
>                type nat hook output priority -100; policy accept;
>                meta nftrace set 1
>        }
>
>        chain output_route{
>                type nat hook output priority mangle ; policy accept;
>                meta nftrace set 1
>        }
>}



Regards

  Wolfgang

