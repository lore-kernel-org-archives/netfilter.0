Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7888A3EA69
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712770409; cv=none; b=iX1IhK9B5ULIm8TLkCjiZxlFkzL10RTHqKePvLi8/mgi17SgIL4tQZduhzAJeDCxB3GiBYPXwMxmYTpuHcUYiJylPx79lIPDKfNesKxljY8d2buSC8LphHx+plYrdfwz4Y3OymMWw35Kz1Nxevexz59hP9/Hvl1wyxqL8TH0mqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712770409; c=relaxed/simple;
	bh=vCSDkiEDCoI17B5Ah7V1KYt/+PPNY6XZz/ORmgrLdwg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=ou6WfzRgOv5umoNy98IFwW/5PEBCp4IyiPB8uFBmOgOupdYQztg6kGDLF+Emq9fInFk4A5UwptuJk9OQdumqzKE3Y7lUC6Q0gk8C9LKVQIuVu3E/El7XeG+WfkHTMZZP7TFSAOzK7x3Yi3iHNeYEFqlK38ZFBXSsTzhwSBGOT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ZFxWfG5n; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ZFxWfG5n"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VF8nZ2g3tzDqVw
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 17:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1712769842; bh=vCSDkiEDCoI17B5Ah7V1KYt/+PPNY6XZz/ORmgrLdwg=;
	h=Date:From:To:Subject:Reply-To:From;
	b=ZFxWfG5n9tBSz2B+u2mAqbH2xiUmk9xEBcFaIAOYQvXl1WrjvF/0uluKwwiqq4riC
	 kgSGLTxv/ZOr+UFaA3W9eQ+rWD0Q5ubm+3xsJ7NCk6EYtBcazD3c9e1BrW0z/KxA5Y
	 gYDA7CxtwzlmK83jnWtZ/p4UXBHIlCVwDw0pn0j4=
X-Riseup-User-ID: 36AE7048AE1A32D94690394AEC851EAFF09B2CFD3E57D3D8C10ABCCA8B710325
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VF8nX218dzFpxf
	for <netfilter@vger.kernel.org>; Wed, 10 Apr 2024 17:23:59 +0000 (UTC)
Date: Wed, 10 Apr 2024 17:23:43 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: connlimit from wiki.nftables.org not working
Message-ID: <20240410172343.1f7f5ee2@localhost>
Reply-To: netfilter@riseup.net
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I am trying this (in Fedora 38 and Debian 12):

https://wiki.nftables.org/wiki-nftables/index.php/Meters#Doing_connlimit_with_nft

and I am getting this:

./connlimit-example:14:16-62: Error: Could not process rule: No such file or directory
		ct state new add @my_connlimit { ip saddr ct count over 20 } counter drop
		             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Why?
