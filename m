Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299260DC1
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 10:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706610276; cv=none; b=NHpM+4bVkFCymLshfqNV/axl7+1cpDv2CNdg51kfiRW9j7PiA5M7KCqkKijpYBgqcdiofFdqjWpFwavdfQOqFFtMedygEzqlOUNeKTUFqZe48n0OUCu2mseW9X1raz8tS42bw3h8aD2b2Oq/YJFTBb6+8z/0CsAVzES+wAJijsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706610276; c=relaxed/simple;
	bh=qkXur5gZ2tO0GECfxsR/BZQwHCVUQwH65QPJ0KpxVgM=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=iPcvLbCY9WstSF7QCuhqAHf9pVQ/FcSuDLoGKE9XaeyXCtMviy7Ep2HMx2yPleyp7/YmmTW12kzF0Z37ifFqNXlW4cnSEf5VnPiaKmeE5wioAKEGB0ABXsY4zJcqNWXdWgulBHw40VH68coqxEISf8veqeytaxK33Ddr3aNjs/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=r2A/s8g4; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=r2A/s8g4; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="r2A/s8g4";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="r2A/s8g4"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id 68B116081737
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 11:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706609873; bh=qkXur5gZ2tO0GECfxsR/BZQwHCVUQwH65QPJ0KpxVgM=;
	h=Date:To:From:Subject:From;
	b=r2A/s8g4oAdX2loc2r7dPvPzw+nDBZFwGEAEBBNGd08zLEyKxewm7C3CIfW6oinnc
	 Doz9VKjhD/QvWqxGmP+g4KeSYGWDDAdac2jyl/3vd5MrSnKqcmOp4mPUlelNLns9Vj
	 H72zcJk3y6eISlUsA4MDuslRu161kIevOcASzvWI=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id 2CB406081730
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 11:17:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706609873; bh=qkXur5gZ2tO0GECfxsR/BZQwHCVUQwH65QPJ0KpxVgM=;
	h=Date:To:From:Subject:From;
	b=r2A/s8g4oAdX2loc2r7dPvPzw+nDBZFwGEAEBBNGd08zLEyKxewm7C3CIfW6oinnc
	 Doz9VKjhD/QvWqxGmP+g4KeSYGWDDAdac2jyl/3vd5MrSnKqcmOp4mPUlelNLns9Vj
	 H72zcJk3y6eISlUsA4MDuslRu161kIevOcASzvWI=
Message-ID: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
Date: Tue, 30 Jan 2024 11:17:52 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr-FR
To: Netfilter list <netfilter@vger.kernel.org>
From: Daniel <tech@tootai.net>
Subject: Combine ipv4 and ipv6 in a set
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP

Hi,

nft 1.06 Debian12. Is it possible in a set to combine ipv4 and ipv6 ? If 
not, does it exist another method to do this ?

-- 
Daniel
