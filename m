Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22410205E00
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713640815; cv=none; b=Es66oS2dPA33lwyiv3Vhzt5lnjxRoRB/hY5Dr8PNOutiigVBjkq5KMJqO4Kr2/pHLdwwtrzpythwhhLXyy/q/abxVaTuOiSkJaY20KqV4e3C8M6QHEvQQR38QefPjn6q17cdxdJHyrQtKsnnVj9KSBflH9QlYpAEy6VDxuAGGSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713640815; c=relaxed/simple;
	bh=7nalUC2GTYCZEsxAOTrfke1nJXDadkaQnISWQWicSRg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:
	 Subject:Content-Type; b=ubxZge7WgGwFRi5Xs8rGTP6xy2ArIpnOmfeBW0eCPUYw9x5wd5BsxEehbK69tfLU5HDdwXgkR6DjsP+JXR43wjHlganvxE9+BT+6HqtKmRqMjhBPYbGkwRdrigKvPsrwXW3ed9ecqXDD1OiEz/ZADlcNhPTcwHsQd15+Mja38nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=ARCpWwnh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=esWII7YA; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="ARCpWwnh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="esWII7YA"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3872B11400F6
	for <netfilter@vger.kernel.org>; Sat, 20 Apr 2024 15:20:13 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute4.internal (MEProxy); Sat, 20 Apr 2024 15:20:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1713640813; x=1713727213; bh=Gk9pem+hyL
	P8o7oJLz08JSna96pxWFFyfkQJ/4/+MGo=; b=ARCpWwnhY+igia7b5V6Qkad+o0
	Rd7xnWP9Mm/ZDCNlLnb8M6AlTP3QfsCiLfUl0mg5WPgmAFOEc78IVQjXOG6MTY0Q
	2V5NlQI0PGFTgquawZoJHDzSsQKlCvrOW/Sy+yLxfqY+d+3IJkIXvzDrbsarLc86
	sRH/NMxtV0uJXlvqw+C8r4/Phij4CkRzxKRKE0sVK0nFSnjco+Ea+J8vSuc6qgxo
	Jth8/FDWBLfdhYIHY29tId5RDFqA7ASNAFGaTUCxqL3v0IgnbzJOKXwg0MVDbOi3
	CmBOave+368O8eH/OOytzEqeEfhn8PkiFyedVMclFUmppDElACMShdWcoHOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713640813; x=1713727213; bh=Gk9pem+hyLP8o7oJLz08JSna96px
	WFFyfkQJ/4/+MGo=; b=esWII7YAeN+3w12BCPrKaVY8WnmqdbckvT63VhqQtI8Y
	PU1ppBjNoyQ0gG2WihAsynNVyrogmCDkaec265A5GTyYqBGHmtOlUape7Rbpmq91
	Oh9MQBdOWFHvR5Y+DJg1CDUY5zj2lLP/sM/2l7RggGk+4U+oHT7LR7CW88E7SMWm
	sfR3MYT0QLF0yaPJbFamTu9wzmDCgrX8w/h7pnaj/HtYUmYwBjYCG2KScNm8mdns
	q/j01fsB9xdB6aDnfLlhmnjzHhh/69gh1+F1do3GJ/Keo53GXj1myboEVZhSplZn
	IReBPAb6j8d5UmZ5k5fwCvfzuDzfAFMZv5ByPQGAew==
X-ME-Sender: <xms:bBUkZgIwHQWUVdc-jCdIfTCu-26cwVXAThYtdro22Lb2kSF10HsaBQ>
    <xme:bBUkZgJZXazOrtyVl8-n-6mRRcO0ia-pkwgdjB2kUcnJbrcnqWQMZ14cNHJG-aLpH
    9HJ6aCEFOvFF-wL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgedgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdfmvghrihhnucfoihhllhgrrhdfuceokhhfmhesphhl
    uhhshhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepvddvuddukeeugfetvefgue
    eikedtheegheffjeelveeftefghfejvdelhfelieetnecuffhomhgrihhnpehmrghrtgdr
    ihhnfhhonecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:bBUkZgsK7wJJMb8zST0HgFaU1IkdZuV-_rdwrS3jkk6vyiqCT9vwxA>
    <xmx:bBUkZtaU1BOrJZEJkxnMqsptx97XwiMxXDSjvYwIck3ZNrLMULCY3w>
    <xmx:bBUkZnZnx3QYJfluWDWLR9B4jZgM7oSopNrxWSXnchCW2SIkViL7Og>
    <xmx:bBUkZpCtiRXHatrY3xR4DAxsESUH3AidkKgSmZj5uMT7ecrdhs5kRA>
    <xmx:bRUkZoA98Uj_amRc0MV4EWYUaUn_BEaBxZP7szFaV256GUjEgxwg15Aa>
Feedback-ID: i2431475f:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CAAF21700093; Sat, 20 Apr 2024 15:20:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-379-gabd37849b7-fm-20240408.001-gabd37849
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <1ab9ca17-6f2a-4ffa-88d6-f82def718359@app.fastmail.com>
In-Reply-To: <20240420085111.5473c9b8@localhost>
References: <20240416174748.5612bd27@localhost>
 <20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
 <20240419105542.74aaac89@localhost>
 <3732a410-afc7-4b42-85b1-6952ece01db4@app.fastmail.com>
 <20240420085111.5473c9b8@localhost>
Date: Sat, 20 Apr 2024 20:19:52 +0100
From: "Kerin Millar" <kfm@plushkava.net>
To: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Content-Type: text/plain

On Sat, 20 Apr 2024, at 9:51 AM, William N. wrote:
> Kerin,
>
> First, thank you very much for your attention, again.
>
> On Sat, 20 Apr 2024 03:36:00 +0100 Kerin Millar wrote:
>
>> (This might have been better off as a new thread)
>
> I thought about that but I assumed it is closely related, i.e. similar.
> Obviously, I was wrong. So, I have replied to your current post in a
> separate thread (with further questions):
>
> https://marc.info/?l=netfilter&m=171360276907019&w=2
>
>> Given the number of bugs I just discovered in the course of
>> experimenting with all this, maybe it is just as well.
>
> Could you link to the bug reports please?

As you wish, though I haven't filed them yet.

-- 
Kerin Millar
