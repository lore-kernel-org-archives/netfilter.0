Received: from mail.someserver.de (mail.someserver.de [116.202.193.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94491AE87A
	for <netfilter@vger.kernel.org>; Wed, 31 Jul 2024 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.193.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429666; cv=none; b=ina5RaAqGRg9kuOjlXg9aLKQUy3lFXaAX1FclllHgkV2rsv33mBfZ5o/JCPAjBPkeax+fr0wIBXCYKmpnx7cYGKGZQCD8jY+42SB58iod0xm40/SxgguKGeGwexfxm2B6RkRjL5eIJXuG7gZMPWYEYQGkRiZ/f0bXEtipOUGUIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429666; c=relaxed/simple;
	bh=IFeIGpl4njgJ83KX+6vS7F17BmQo6XqXYRbT+P8v/Tk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=IdbXE8SS8xbg8tFm0HHxQdydAVtkN+4ZzcpATXRshxeH3IqsPZiNGNjKSlW6dSsHpMN7SAABGe6SsK4RXgxts2uerB1lIIVT2nA23geMCJ6eC7NSvwEDMiWs8iGqBcgK886is+JskNA7cthOVSuiNQwJDLciQJ7/+KmejvA+mHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nerdkeller.org; spf=pass smtp.mailfrom=nerdkeller.org; arc=none smtp.client-ip=116.202.193.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nerdkeller.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nerdkeller.org
Received: from [192.168.108.197] (dynamic-176-006-130-046.176.6.pool.telefonica.de [176.6.130.46])
	by mail.someserver.de (Postfix) with ESMTPSA id 97EF8A2123
	for <netfilter@vger.kernel.org>; Wed, 31 Jul 2024 14:41:01 +0200 (CEST)
Message-ID: <5dd7c429-94f8-40b6-be32-9de999d3bbdf@nerdkeller.org>
Date: Wed, 31 Jul 2024 14:41:00 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US, de-DE
From: Arne Zachlod <arne@nerdkeller.org>
Subject: libnftables way of deleting a rule
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm porting a program (written in C) that currently uses iptables to 
nftables, trying to not change a lot of the internal concept of said 
program.
The program currently uses execute() calls and calls iptables directly 
via these. I wanted to at least use libnftables, and everything seems to 
works quite well, I just have a problem with deleting rules.
I read through the code of libnftables, but I couldn't find a way to get 
the handle of a rule I added. In iptables, this is no problem, you just 
give the rule again to delete it. In libnftables though I need the 
handle. Currently, I'm looking into libnftables-json, but I would prefer 
not to use it just to get the handles. Is there a better way of deleting 
a rule than parsing the JSON for them? Maybe even with libnftables directly?

Best Regards,
Arne
