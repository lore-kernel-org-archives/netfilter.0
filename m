Received: from tootai.net (mail1.tootai.net [213.239.227.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5C16775E
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 12:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.239.227.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706616812; cv=none; b=d7ZveorvheXcCh1pA6dR7+W/nDznsEd4o/ZpxbpvQ1cHr3jeumZykTt9Cb0AEwB8/DHIgerBl2ePV6HA/4nAO6OSj80k60YtqaTc/6FNLwKurQJ3NLw8418mzeSgdtas8V4DU4HfNE/QzARfh8zeVTzInZUkUKQp3IKhohZ9rRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706616812; c=relaxed/simple;
	bh=cbtxB47AA1SS/RiYaa850iPPekdDKfWDnUJwO4fbs/0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GgEQy0MTp4JN4N3Qqnc9t1NrtvDxNJCwuz+pu30M3ATlW1d8F6tjjAE2VU6a5OdhoT3bVN5PRRWspkdsF8W88ZY5aK5Zg+RSljQM0PYZeR6kVVnJ03KAjcGpWEL9+cs2lqm47BHdIZCMB8ccTRM1x7riBVAyOMyAUjDSGX2LeEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net; spf=pass smtp.mailfrom=tootai.net; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=r/mtwXDX; dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b=Gps84BaN; arc=none smtp.client-ip=213.239.227.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tootai.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tootai.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="r/mtwXDX";
	dkim=pass (1024-bit key) header.d=tootai.net header.i=@tootai.net header.b="Gps84BaN"
Received: from tootai.net (localhost [127.0.0.1])
	by mail1.tootai.net (Postfix) with ESMTP id D8FEB6081733
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 13:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706616805; bh=cbtxB47AA1SS/RiYaa850iPPekdDKfWDnUJwO4fbs/0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=r/mtwXDX9mbMUxUQ/eIpptnoD97aVMXMJuIEtIjtkyvNM1bOP2ASojkz4uwBx97X8
	 F5oZ0Ng4PLpSyAu/Z+nJ69iz392zHRFiM3hQh+wpzLAmOVcLbcH5QCcGHPCwkS8lmP
	 eWGB4Z7hSOJ3apb7dnvby3C9UJg8MUDQekNcPdoA=
X-Spam-Level: 
Received: from [IPV6:fd99:1234:beef:cafe::24] (unknown [IPv6:fd99:1234:beef:cafe::24])
	by mail1.tootai.net (Postfix) with ESMTPA id A3C8F60817DB
	for <netfilter@vger.kernel.org>; Tue, 30 Jan 2024 13:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
	t=1706616804; bh=cbtxB47AA1SS/RiYaa850iPPekdDKfWDnUJwO4fbs/0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Gps84BaNNkUxC66YyN1I5wl7UxsI9b5yiY7+IH1947utVPUcZa1xmQF2R9Qw3b2wl
	 /1iP30j837jMDiV0t8xKFF8Ly04VrnnfZ0G5T4wDzp6meGsUbUsmSkWXp6X3T8ox+b
	 eEdK2kB8fw4qYSB25TGbgGbRSgvb0Yn+JFEH2w90=
Message-ID: <1824e291-7196-4d4c-a180-8a99a5b2dc98@tootai.net>
Date: Tue, 30 Jan 2024 13:13:24 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Combine ipv4 and ipv6 in a set
Content-Language: fr-FR
To: Netfilter list <netfilter@vger.kernel.org>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
From: Daniel <tech@tootai.net>
In-Reply-To: <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP


Le 30/01/2024 à 11:39, Kerin Millar a écrit :
> On Tue, 30 Jan 2024, at 10:17 AM, Daniel wrote:
>> Hi,
>>
>> nft 1.06 Debian12. Is it possible in a set to combine ipv4 and ipv6 ? If
>> not, does it exist another method to do this ?
> Combining is impossible. However, the value of an ipv6_addr element is permitted to be an IPv4-mapped IPv6 address.

As simple it is, thanks.
