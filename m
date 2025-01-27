Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638A3198A37
	for <netfilter@vger.kernel.org>; Mon, 27 Jan 2025 20:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738010255; cv=none; b=jLyrwk3F4X+rRctIM6ut6QLNi11G6FTb/qRzZdihtvlgRjt15P2PCGKCZiNTEqh+Z45wm9LD2M1rdhO7CyDdJVhCpy6IHssQz5O6wN8A3oTnjEqqYJytQrXQf3Jn3bZ+sC0hon+3gP3K9Id/W/CYRzJG85IPDJcDHa8RDgRL+BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738010255; c=relaxed/simple;
	bh=+Wtzb/XQK7jEwKGlCp5q7OamPcIHen189re6c3tAMhE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GaqsSRQPKa3yxjvJXsQU0BDB3T72OHtDesrUewHWq9n27QL6965oZ7qjvjJ+WCiyOia5N2KtD1NtHfNiJp3g0wqcBqkknHV+2GmJ1W9gs7+JvEGogopO39xGytUwPNxUh8J2Pe41FsiFwULHw5F8Yh5MJzyVxhf4uA3rwuhvNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=WNhaOE9t; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="WNhaOE9t"
Received: by shakotay.alphanet.ch (Postfix, from userid 1000)
	id CA7A71241B17; Mon, 27 Jan 2025 21:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1738010249; bh=+Wtzb/XQK7jEwKGlCp5q7OamPcIHen189re6c3tAMhE=;
	h=Date:From:To:Subject:From;
	b=WNhaOE9tx0gWd0L60FWSsAkxGhSogfYLtH3F52S9FSSdqwPGbJUIIx6lEK+L51A/u
	 nQIJVbt+RNj6M/jFsSin7UNAmuY+A4pjzlRGtQJK9IKswmseAAXxcdrDu2DpQvb/3Y
	 jjfih0cYm6jUKGTAFTuqEpC5D+mV2xMiIXPchjAB8ZZuulbPE3TrGQAv5tyUnZlZDs
	 UXrNBelXJo2VQivE0RMUJu8w0jlT7t+kOQYBvKTdsAyUgg6jJvnOhIEbsj/uCHCLN5
	 VYS9dr8GKs8SxEZUdXzRUDAFSxQb5zYNAZLBAPWvIX3GF+pkYi5u45o1ydTpUOVm2G
	 zi068tbKVPvAA==
Date: Mon, 27 Jan 2025 21:37:29 +0100
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: netfilter@vger.kernel.org
Subject: Generic map, also with L4 protocol
Message-ID: <Z5fuieMugg4fcNKR@alphanet.ch>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

for dynamic DNAT, I use:

   map multihoming_ext {
      type ipv4_addr . inet_service : ipv4_addr . inet_service
      elements = {
         46.140.72.218 . 8080  : 192.168.202.10 . 80,
         193.72.186.130 . 8080 : 192.168.202.10 . 80
      }
   }

   chain multihoming_prerouting {
      type nat hook prerouting priority -100; policy accept;

      dnat ip addr . port to ip daddr . tcp dport map @multihoming_ext
   }

This seems to DNAT correctly as wanted:

   46.140.72.218:8080 is DNATted to 192.168.202.10:80
and
   193.72.186.130:8080 is DATted to 192.168.202.10:80

To make it even more generic and dynamic, I would like to have also the
protocol in the map, something like:

   map multihoming_ext {
      type ipv4_addr . inet_proto . inet_service : ipv4_addr . inet_service
      elements = {
         46.140.72.218 . tcp . 8080  : 192.168.202.10 . 80,
         193.72.186.130 . tcp . 8080 : 192.168.202.10 . 80
      }
   }

However I have no idea how to modify the DNAT line itself to
get the L4 protocol from the map correctly.

Do you have any idea?

Thank you.
