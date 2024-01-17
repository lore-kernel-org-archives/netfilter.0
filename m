Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7317200B7
	for <netfilter@vger.kernel.org>; Wed, 17 Jan 2024 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497984; cv=none; b=i1RgzvU6wAXwPBUxbkqN0Pk0l1hSt/S4AuBi9gaR5KOxngBRv/Z1wC3//fJ3sENpEdTsHY+qP2P46ypz73wyO6j99ZEq3w/M4vG6LxmFKHMLxGzJU8rqIC+xCEkiF0h4ZVN1B48HWD7BA7/J3GM4VX1pXYR71EHtF86o5upt89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497984; c=relaxed/simple;
	bh=bDGbCP4CzUivQkaHEqZVejX+MmltklR+Ob088S1lA5Q=;
	h=DKIM-Signature:DKIM-Signature:Original-Subject:Author:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Content-Language:From:
	 Subject:Content-Type:Content-Transfer-Encoding; b=uEMegJnOSsrvhMVyttn4aSi3bOy2nVmRkQRzv1gXIf749B8eQxL15ggSElJ5j2MavL+G5xokbUGf4LGu2UEDhBVOgZoGi4SkER3nxbMhKgiyorg20JwfuR52PqaJ0oj/0gkBocr7DIATe18CmLeeO3UxeNmLzL5VcNXs7yTsZaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b=7/6BVCoO; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=AKMutEuV; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=tana.it header.i=@tana.it header.b="7/6BVCoO";
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="AKMutEuV"
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tana.it;
	s=epsilon; t=1705497667;
	bh=/3E7uuGbp4pOmvWgFC1iy3MKvwA9zP1G23jcLySR7es=;
	h=Author:Date:To:From:Subject;
	b=7/6BVCoOnXBmJ0GrOrBNDze5Kf8de0GZZr9r/lGaNLywHK6N0B7u7/88u0IurUSMc
	 jYTudrt2RIgVm0ZfWQDDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1705497667; bh=/3E7uuGbp4pOmvWgFC1iy3MKvwA9zP1G23jcLySR7es=;
	h=Date:To:From:Subject;
	b=AKMutEuV65gziLG5W31lw09S/lgR3iHjXlzbjROVDogCucRerQd6ASmsB/9S4H3aX
	 q4Lvfg6HVgnxzJi83oyrkDDMmwJWSSfb8vRyVYSZZxokYG+wXj14qXExs2gujJP7/z
	 BtIcWNxDRY/vwmYNNxgJEX6Suwg79kb6oYUrA7nbKTe1jW/ZGnLUyEIbmK0Gc
Original-Subject: Debugging libmnl client
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.120] (pcale.tana [172.25.197.120])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC0DF.0000000065A7D443.000079BF; Wed, 17 Jan 2024 14:21:07 +0100
Message-ID: <50854203-77c6-4145-8d87-8b493ac492a5@tana.it>
Date: Wed, 17 Jan 2024 14:21:07 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US, it-IT
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
Subject: Debugging libmnl client
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

are libmnl debug symbols available?

mnl_cb_run() returns -1 without calling the cb().  I found a file using debuginfod-find, and did so in gdb:

(gdb) add-symbol-file /home/ale/.cache/debuginfod_client/c27acdf07e5746f0a6c74055e6b21dbe700e054d/debuginfo
add symbol table from file "/home/ale/.cache/debuginfod_client/c27acdf07e5746f0a6c74055e6b21dbe700e054d/debuginfo"
(y or n) y
Reading symbols from /home/ale/.cache/debuginfod_client/c27acdf07e5746f0a6c74055e6b21dbe700e054d/debuginfo...
(gdb) break mnl_cb_run
Breakpoint 1 at 0x2860
(gdb) run
Starting program: /my/client
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

Breakpoint 1.2, 0x00007ffff7cb9860 in mnl_cb_run () from /usr/lib/x86_64-linux-gnu/libmnl.so.0
(gdb) n
Single stepping until exit from function mnl_cb_run,
which has no line number information.


So it's not a good debug symbol file, is it?

What am I missing?


TIA for any hint
Ale
-- 



