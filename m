Received: from mx.0x1.digital (mx.0x1.digital [80.240.22.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05DD2C08BF
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.240.22.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758960788; cv=none; b=gPc9u3jtQ919OHbJu/+6ZR9F0py6c4VgKmx46gjPmxeFHKza9W5GiG/Z2iBWPFvQ5diXsHZHjzpxiXFfsAGF5/Xn3UO2HKnFp4gOF3pFcj380zsEKayOGpYFsOc1WkCfZtsiBOxmt5F1VuVX7UoDm1H1mu24Lkfn9mBTBhSlKpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758960788; c=relaxed/simple;
	bh=SkJ86r+REIAn9waIWNIVvnEobUiAbgsUkhJPpz9wyO8=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=XcMqAxI6dADgmMcbte29qSCCGKdAyrGEBI1spFfmqB4HwwUnwpO88In9Vnx4Zu0cZlPJEKenYdcyZxFYnWnnfk3yE+vzffA31lvmhhM7qmU9MPEjUkC6Oi+H+CVetjA4wSyKycEdUMQ9D+oriPm8A2Ig/vm2qlbfl9GX2AqWfDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0x1.digital; spf=pass smtp.mailfrom=0x1.digital; dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b=G5FCEE8V; dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b=G5FCEE8V; arc=none smtp.client-ip=80.240.22.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0x1.digital
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x1.digital
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b="G5FCEE8V";
	dkim=pass (2048-bit key) header.d=0x1.digital header.i=@0x1.digital header.b="G5FCEE8V"
Received: from localhost (mx.0x1.digital [127.0.0.1])
	by mx.0x1.digital (Postfix) with ESMTP id B2DB017BD07
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 10:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.0x1.digital B2DB017BD07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x1.digital;
	s=20220330; t=1758960408;
	bh=utXgEtD+Jy39xY6hQRNElBJDRfU4A4Ol1NyRCXc5Oq4=;
	h=Date:From:To:Subject:From;
	b=G5FCEE8VIPNOzqGNMb27eeL4si5+vpd2cjbzlI9LH0U9M8/ikG9l1agkXNlGSOYFq
	 8K0+EOx1LXJM1fed2G8exweTgybeFdZMod0lsV8my30egICXSvQ8kZXoz2QlQQoTiy
	 0DtDnkBANMHaMAkXXbTKXQUzU1EPAXuaRu9IDUTTd8hFDlfZTIXkBxOxslRUPlAYjK
	 +UHazY42e9mLGYGhHQVf7QdK7UIQ5R8A/5hBE4jiFenEsecgsj70Byr1XveksqqdPU
	 skwxIMPLOX63zfo8G/BR84LJ0owLBwsSd6xorJur8ekSkwoteH95/DLWgQvWQHcpeK
	 rIbGEnJV6bIjw==
X-Virus-Scanned: amavis at 0x1.digital
Received: from mx.0x1.digital ([127.0.0.1])
 by localhost (mx.0x1.digital [127.0.0.1]) (amavis, port 10026) with ESMTP
 id n4a9S37xHbdJ for <netfilter@vger.kernel.org>;
 Sat, 27 Sep 2025 10:06:48 +0200 (CEST)
Received: from CHAOS.local (84-115-220-193.cable.dynamic.surfer.at [84.115.220.193])
	by mx.0x1.digital (Postfix) with ESMTPSA id 6032517BD06
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 08:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.0x1.digital 6032517BD06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x1.digital;
	s=20220330; t=1758960408;
	bh=utXgEtD+Jy39xY6hQRNElBJDRfU4A4Ol1NyRCXc5Oq4=;
	h=Date:From:To:Subject:From;
	b=G5FCEE8VIPNOzqGNMb27eeL4si5+vpd2cjbzlI9LH0U9M8/ikG9l1agkXNlGSOYFq
	 8K0+EOx1LXJM1fed2G8exweTgybeFdZMod0lsV8my30egICXSvQ8kZXoz2QlQQoTiy
	 0DtDnkBANMHaMAkXXbTKXQUzU1EPAXuaRu9IDUTTd8hFDlfZTIXkBxOxslRUPlAYjK
	 +UHazY42e9mLGYGhHQVf7QdK7UIQ5R8A/5hBE4jiFenEsecgsj70Byr1XveksqqdPU
	 skwxIMPLOX63zfo8G/BR84LJ0owLBwsSd6xorJur8ekSkwoteH95/DLWgQvWQHcpeK
	 rIbGEnJV6bIjw==
Date: Sat, 27 Sep 2025 10:06:46 +0200
From: =?utf-8?Q?0x1_=7C_nftables?= <dvx4jwe2kewld@0x1.digital>
To: "=?utf-8?Q?netfilter=40vger.kernel.org?=" <netfilter@vger.kernel.org>
Message-ID: <C3DCDF0F-27E3-4325-968F-3061D768B800@getmailspring.com>
Subject: list elements of set
X-Mailer: Mailspring
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello everyone,

I would like to list all ipv4 elements of a named set. 

the set is named

mx_bans_cidr

the command i used:

sudo nft list set ip filter mx_bans_cidr

Error: No such file or directory
list set ip filter mx_bans_cidr


I followed the description from this page

https://wiki.nftables.org/wiki-nftables/index.php/Sets#Listing_named_sets


The query for element in a set is also not working.

I tried all kind of versions of the command, one that surprised me was:


sudo nft get element ip basetable filter mx_bans_cidr { *.*.*.* }

Error: syntax error, unexpected string, expecting '{' or '$'
get element ip basetable filter mx_bans_cidr { somefile-x.x.x.tar.gz
someotherfile-y.y.y.tar.gz }

Those are 2 files, that contain 4 dots in the filename, in the working
directory ?!


Thanks for any hint


