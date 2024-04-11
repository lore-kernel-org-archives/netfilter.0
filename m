Received: from mail.satchell.net (smtp.satchell.net [76.209.1.165])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E311F2DF5
	for <netfilter@vger.kernel.org>; Thu, 11 Apr 2024 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=76.209.1.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712850140; cv=none; b=d7nzbMy7Qs6moBQQIDeAJLdmXJ0qzAj3axbg4MiJ7ufiWPElxG1zasRNN8qHfqzrDbQZfWG4cAE6+s2NA3jCkAgGs4gxz79WjCmg7TTmCd4y+BciMr4mTAOEYSJSDhJdvFHIHsHhZcllqbWzadcX26nixbkDD18TIcNvrSTZK84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712850140; c=relaxed/simple;
	bh=dMf1tMF/ZdPmQUwTwhOWouZOrP/5kJ4E2mUaIv147zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O8OANwu4z1s5HzOo+KGn0RLs9fuSDdCliQowulD3rkJzmHVH8EZ+rEM5lG4E6j1/PEdIgf+OYyVdcZj/KLyJPIq52/Y9iSW0+SKyhxrjTUXL+lsqNusr5sDXr1YbabqikA0J8JnoD9xVpGTdh0UXqbsqaYYhyMVnQtv1S9rAcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=satchell.net; spf=pass smtp.mailfrom=satchell.net; arc=none smtp.client-ip=76.209.1.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=satchell.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=satchell.net
Received: from [10.1.1.40] (unknown [10.1.1.40])
	by mail.satchell.net (Postfix) with ESMTP id 02F789FB19;
	Thu, 11 Apr 2024 08:37:10 -0700 (PDT)
Message-ID: <15494774-803f-4ff6-ba06-9bd917973b18@satchell.net>
Date: Thu, 11 Apr 2024 08:37:10 -0700
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: list@satchell.net
Subject: Re: Using iptables and ipset to DROP a list of 2 million addresses
To: Mason Kaufer <mason.kaufer@layeredsolutionsinc.com>,
 netfilter@vger.kernel.org
References: <CAEphJuhKcfOoMvATjubj7T31g32tMqpEKi=yE2OAnNf9768XyA@mail.gmail.com>
Content-Language: en-US
From: Stephen Satchell <list@satchell.net>
In-Reply-To: <CAEphJuhKcfOoMvATjubj7T31g32tMqpEKi=yE2OAnNf9768XyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/24 5:39 AM, Mason Kaufer wrote:
> Hi,
> I am currently trying to set up a firewall on an Ubuntu 22.04 machine
> that will block a list of 2 million plus ip addresses without slowing
> the network speed down tremendously. I have tried using ipset but I
> get an error that the hash size isn't large enough. I have tried
> manually setting the hash size but it only allows that option to be so
> large. Is there something I am doing wrong or is there a better way to
> achieve this? Any help with this would be much appreciated.

There could be another way, that would work for both inbound and 
outbound blocking.  Consolidate the list into net ranges, and add the 
ranges as BLACK HOLE routes in the routing table.

I'm less and less enamored with using IP lists in a firewall when the 
routing table is optimized to handle BIG lists of addresses, if you do 
the consolidation properly.

Also, be sure to have short-circuit rules for established connections in 
your firewall list, if you do decide to lard up an IP table list.  That 
will help the speed problem, by restricting the loading to new connections.

