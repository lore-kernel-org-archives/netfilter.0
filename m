From: Daniel <tech@tootai.net>
Subject: Re: Need help
Date: Tue, 26 Oct 2021 09:14:07 +0200
Message-ID: <147618b6-d98f-9413-61e1-e3e9b488344d@tootai.net>
References: <dc004311d37bb7332b649c4973b0cbed@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1635232448; bh=K4/qBe0TUQzq9fZkDm6VBlcHkdSosITflB8DrPxoFC8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=azceVCT5akF7dXZOkKPHMqTE+TESfUDl6VDDAa4/X16QOqNqBoO7B3J7bhbrSN5Dy
         Atd5voSeJPTn9xGTLSAEvu+F+cg8s9iBZy0sd4nmAQRQxdotZYacvchOR3Csjf4iRK
         cdf/mPM9VNyJXZqmxw4wZs13p5wev5kekVqQMQXY=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1635232447; bh=K4/qBe0TUQzq9fZkDm6VBlcHkdSosITflB8DrPxoFC8=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=pILlyKFc3viVSO5ieDzKIj4QdEcc0V1rgGtMOGwN2FTwHqsQu83vbjSbFee03Krhn
         pFPxhQtm2m/YVvRA+fV8QX3GrS8yQTddmDoCt3XEk38jJf2O7oaAI9GrqLKmh8sK/A
         8/nrx5eb818B/Y41aJ2K89ohgHemnq4/L8K2f7vc=
In-Reply-To: <dc004311d37bb7332b649c4973b0cbed@mail.gmail.com>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hello Brad

Le 26/10/2021 à 06:53, Brad Knorr a écrit :
> I am new to nft commands.  I wish to use the map feature for port
> forwarding.  What I want to achieve is the following
>
> Sftp  incoming  to port 2222 on the public IP to be port forwarded to
> private IP on port 22.  So what I found in the docs is this.
>
> % nft add map nat foo { type inet_service : ipv4_addr . inet_service \; }
>
> % nft add element nat foo { \
>      1100 : 192.168.1.2 . 5061, \
>      1101 : 192.168.1.3 . 5061, \
>      1400 : 192.168.1.4 . 5061 \
> }
> % nft add rule nat pre ip protocol tcp dnat ip addr . port to tcp dport
> map @foo
>
>
> So when I issue the first command I get the following error:
> Error: unqualified mapping data type specified in map definition
>
> When I issue the command:  nft add map nat foo { type inet_service :
> ipv4_addr \; }
>
> It works just fine.  I am at a loss as to why this is happening.  The
> reason I need the mapping is I need to add and remove port forwarding
> rules easily with a simple command.
>
> Any help would be greatly appreciated.
> Brad

% nft add map nat foo { type inet_service : ipv4_addr \; flags interval \; } should do the job

-- 
Daniel
