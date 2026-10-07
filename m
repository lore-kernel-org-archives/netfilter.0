Received: from sender-op-o18.zoho.eu (sender-op-o18.zoho.eu [136.143.169.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6FD4E3232
	for <netfilter@vger.kernel.org>; Wed,  7 Oct 2026 19:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791401151; cv=pass; b=o9X8DodbHX7BGyrjStwcUXwwlEwWidQpJk8o3+eg6YXxIUBZ/hl/ouIk8+u7q5JeUSnQmkm+1ED+K9KIz7pQyiYpVy8Fl4wnEt2VxrIt4iI/jNIsRGj3Q/f7qf+Nktg8Se7nOboBTOMHcbah7o6yYs7H4JIxO9gHZsBHStjzft8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791401151; c=relaxed/simple;
	bh=IHhh1rGw7MccZ010bDd1bUnfKS8O54joWnJGRX09uSw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=eKvu9464wQt7pEaquDVLW3B91DLgddv3TtkIj/m7qvzMpDGXfnkyUSaM4lRiopsV8ul+Ch84Ejl27jnOa7aJOD7dAgtSHDJ5tuKkxWHG6F9tlno8D4Cd1ZSmhDDedHic5gx6JOnnIDe88/jXdkZF2dsNHJ6ROK4AoJ88Fw/7rMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=circuwave.com; spf=pass smtp.mailfrom=circuwave.com; dkim=pass (2048-bit key) header.d=circuwave.com header.i=adrien.chiff@circuwave.com header.b=I70w4da7; arc=pass smtp.client-ip=136.143.169.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=circuwave.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=circuwave.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=circuwave.com header.i=adrien.chiff@circuwave.com header.b="I70w4da7"
ARC-Seal: i=1; a=rsa-sha256; t=1791401146; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=PZqibBcHvexhjj6lJ8iiP+5ohO/iAEJCKxK0uIAG9vXYE70yzi2ZKBHN8BBXb6X2JWYlqIb0qwMjoNsSw9JjhuayJoxbxMqiqZFcHnRGMUTffXm4SkZEDqUW1vnVPUd3OQ37+rehvIgJoofQOevI9UE3dxLZ3RNQIVfACmK4Xc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1791401146; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=CoJTssDSlROtv3hTuZr1Bb+JTEwoRy+cjroMLVafmVE=; 
	b=aWe9J92mfrgUuctQczuO/bcmsm5aZp8exCA1U7bJHgmFRPtMoVH8Iu1aAxOhGWWiLJ5MAheE+q5PFEoU30k0mr6gVfRcvcKmY6kVtLO/3eLHciEsOTYVanRWuM3Q81sZaGDIs0M1Hq9ToqbSWamLcrAuLiRpg50yOx4SRWY+TLk=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=circuwave.com;
	spf=pass  smtp.mailfrom=adrien.chiff@circuwave.com;
	dmarc=pass header.from=<adrien.chiff@circuwave.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791401146;
	s=circuwave; d=circuwave.com; i=adrien.chiff@circuwave.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:From:From:Subject:Subject:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=CoJTssDSlROtv3hTuZr1Bb+JTEwoRy+cjroMLVafmVE=;
	b=I70w4da7B2JYWA1EqBz0Plq9o50j5uMjJWQ2BL2HHqKPhGO/jhbev2j/a0GEKu/8
	74WaOzvqL/jOlv0Cf7RxrXlD6nQZDoR21mUMdqyPvmTTEmQMCLK5xw86NZkwIOSPrla
	IKUYn03WPfJYYerHaT1NH7M7JLYmvtwbTk7pPDWTOYh0NfVQhu863+PqjYNxAXW9f3r
	oM4ec4KfY6j8pqHdO+RQdBkCw4lkkkskAujt+VMlQRzITbSP/VyJA/MvEURJFFcXUVM
	ctDqfoyPC30RCeB23nQZPOLP+hHiIkaj1jSogMkRzstrQxU3gF9rqobZZFqKPH/e1yP
	PjC+CQzEyQ==
Received: by smtp.zoho.eu with SMTPS id 1791401145428852.7332692272778;
	Wed, 7 Oct 2026 21:25:45 +0200 (CEST)
Message-ID: <ee44436b-0c28-41ae-a193-1e6676a612a2@circuwave.com>
Date: Wed, 7 Oct 2026 21:25:44 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: netfilter@vger.kernel.org
From: Adrien <adrien.chiff@circuwave.com>
Subject: Nftables wiki improvement suggestions
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi,

I wanted to suggest the following improvements for the nftables wiki :


- Clarify the rule processing order in a chain. For instance, FreeBSD 
docs explicitly mention how pf rules are matched ("last match wins", 
excepted for "quick" rules). I know the wiki already talks about 
processing order. But if we look in detail, it doesn't tell us very well 
about the detailed processing (including how the rules are evaluated in 
a chain). And if it already does - with all due respect - it is hard to 
see it from a newbie point of view.


- Anything that could make this wiki more "attractive" to people willing 
to benefit from such a strong framework, that could give so much 
opportunities.


Thank you for your time and your consideration.

Adrien,

Proudly French


