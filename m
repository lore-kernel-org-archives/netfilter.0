Received: from smtp0-kfki.kfki.hu (smtp0-kfki.kfki.hu [148.6.0.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A4C3D56F
	for <netfilter@vger.kernel.org>; Sat, 13 Apr 2024 14:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.6.0.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713017254; cv=none; b=u5PrldsDRrdyTWsqGnVJK7uvegJB6zJexa2aRIhbmou0vuo0bY6ihfHX7hM0pFMCoqB8O/T5j/rECwtBb2l2axVIv8DktF0+UKMqRbjU+qSCzSDQ1gAISt8615bq/AHkdkGWTuVzH2XqXIFk3LHLosA9z2ki3WF7Norlww2COUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713017254; c=relaxed/simple;
	bh=J1yvSwRBt9WvL61kC5csVLeZtRDCjOX/HiE3ukXkikY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f66OJCBTj0g8XwEhMQCI8hd9kUxWF3Q3ryiJEi/PwoTIZ7XjmUBMAJyrUr3KbdGe0I9YT0r7ZGmXkNVCAqwKTNLLa6V8hnTkn6+yMpzdeZYeOz5MwvQKWmJSloj46O89It8zzENtzPbqXrXBlx/YdHT+HWRjA5NYYVaOh+E3mPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=148.6.0.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: from localhost (localhost [127.0.0.1])
	by smtp0.kfki.hu (Postfix) with ESMTP id 9CBDF674012E;
	Sat, 13 Apr 2024 16:01:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smtp0.kfki.hu
Received: from smtp0.kfki.hu ([127.0.0.1])
	by localhost (smtp0.kfki.hu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP; Sat, 13 Apr 2024 16:01:10 +0200 (CEST)
Received: from mentat.rmki.kfki.hu (host-94-248-219-63.kabelnet.hu [94.248.219.63])
	(Authenticated sender: kadlecsik.jozsef@wigner.hu)
	by smtp0.kfki.hu (Postfix) with ESMTPSA id 90CFD6740120;
	Sat, 13 Apr 2024 16:01:09 +0200 (CEST)
Received: by mentat.rmki.kfki.hu (Postfix, from userid 1000)
	id 1BE651D4; Sat, 13 Apr 2024 16:01:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mentat.rmki.kfki.hu (Postfix) with ESMTP id 19809464;
	Sat, 13 Apr 2024 16:01:09 +0200 (CEST)
Date: Sat, 13 Apr 2024 16:01:09 +0200 (CEST)
From: Jozsef Kadlecsik <kadlec@netfilter.org>
To: Le Chevalier <mail@lechevalier.se>
cc: Mason Kaufer <mason.kaufer@layeredsolutionsinc.com>, 
    netfilter@vger.kernel.org
Subject: Re: Using iptables and ipset to DROP a list of 2 million addresses
In-Reply-To: <08c870f4-eab8-46a2-bb09-afe8e49435fe@lechevalier.se>
Message-ID: <11841a5b-5ced-091f-e69f-0e7ac74eb734@netfilter.org>
References: <CAEphJuhKcfOoMvATjubj7T31g32tMqpEKi=yE2OAnNf9768XyA@mail.gmail.com> <08c870f4-eab8-46a2-bb09-afe8e49435fe@lechevalier.se>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-deepspam: 20ham 12%

On Thu, 11 Apr 2024, Le Chevalier wrote:

> On 2024-04-11 14:39, Mason Kaufer wrote:
> > I am currently trying to set up a firewall on an Ubuntu 22.04 machine 
> > that will block a list of 2 million plus ip addresses without slowing 
> > the network speed down tremendously. I have tried using ipset but I 
> > get an error that the hash size isn't large enough. I have tried 
> > manually setting the hash size but it only allows that option to be so 
> > large. Is there something I am doing wrong or is there a better way to 
> > achieve this? Any help with this would be much appreciated.

There's no upper limit in the hash size (except that the number must fit 
into u32). On my laptop:

# ipset n test hash:ip hashsize 10000000 maxelem 10000000
# ipset l
Name: test
Type: hash:ip
Revision: 5
Header: family inet hashsize 16777216 maxelem 10000000 bucketsize 12 initval 0xc61d4797
Size in memory: 393392
References: 0
Number of entries: 0
Members:

Please note, you must tune both hashsize and maxelem parameters in order 
to be able to store the given number of entries.

Best regards,
Jozsef
-- 
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
