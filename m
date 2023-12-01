Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=at.encryp.ch header.i=@at.encryp.ch header.b="FFf9UxKo"
X-Greylist: delayed 1729 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 01 Dec 2023 06:12:34 PST
Received: from flopster.at.encryp.ch (flopster.at.encryp.ch [65.21.140.233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B397710DB
	for <netfilter@vger.kernel.org>; Fri,  1 Dec 2023 06:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=at.encryp.ch;
	s=flopster; t=1701439953;
	bh=uP46f2zvfsjKlOQkVxX5Dmeyv3KcmasgFoWjVnqEiMI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=FFf9UxKoZqfu+aOBf/Tx5g6CqQJZLA+pMFwDfZlomaEUPtDgv0a8fXXv42Iiv/Mnd
	 SFarqoqeWIUOme+0lPEzdnylDT7JibBjaHWLIG8i7yAWAjK5wFFhhiotKq34g7Q8J1
	 f6JLjKAzO9sy4OmRXFxMSVLaNdlShhfoxvOziOLc=
Message-ID: <fe1a8ff1-57f2-4e30-ba69-eb57041ddcc4@at.encryp.ch>
Date: Fri, 1 Dec 2023 14:12:30 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Unit dependency of network-pre.target in nftables.service
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org
References: <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
 <84d15779-675a-4c2d-a287-49dd39a9313f@thelounge.net>
 <7a610cb2-391f-4f34-99c1-6c1f38243dda@at.encryp.ch>
 <38c83f6f-1f82-4e17-8543-1073e8ade314@thelounge.net>
From: Serg <seentr@at.encryp.ch>
In-Reply-To: <38c83f6f-1f82-4e17-8543-1073e8ade314@thelounge.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/1/23 14:04, Reindl Harald wrote:
> keep your dirty fingers from files which are part of a package while the package manager keeps it's dirty fingers from /etc
> 

When systemctl edit nftables.service is used it does not modify original file, instead it creates override configuration.
