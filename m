From: Daniel <tech@tootai.net>
Subject: Re: nftables cgroup accounting problem
Date: Mon, 5 Oct 2020 09:53:41 +0200
Message-ID: <5fb80e78-32f1-70e4-cc73-76dc2c4ddb3b@tootai.net>
References: <20201005081612.Horde.YsdRRhtDnYTfTD85w2p4wRt@webmail.inetadmin.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1601884422; bh=gFHi2Hzf5SdLHVmzpMRM3uRczeCaetYcEHV/e419YTU=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=bWu5NbufKIfgOoRhKMDNySGLkZZeoEziuAf/gbgMTuvD5EA8XhZXk5eX4FPzyf3rs
         n0y5PvARIKNf3wEOPOb8n8z7fDqXNkzsUcxN2nthAo7dun8BmTvI7Ojn37gijmZTeJ
         lUKA4hpONnZ5leRWQ2PZiDBcSuaOxZSr6dclHKE8=
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
        t=1601884422; bh=gFHi2Hzf5SdLHVmzpMRM3uRczeCaetYcEHV/e419YTU=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=bWu5NbufKIfgOoRhKMDNySGLkZZeoEziuAf/gbgMTuvD5EA8XhZXk5eX4FPzyf3rs
         n0y5PvARIKNf3wEOPOb8n8z7fDqXNkzsUcxN2nthAo7dun8BmTvI7Ojn37gijmZTeJ
         lUKA4hpONnZ5leRWQ2PZiDBcSuaOxZSr6dclHKE8=
In-Reply-To: <20201005081612.Horde.YsdRRhtDnYTfTD85w2p4wRt@webmail.inetadmin.eu>
Content-Language: fr-FR
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hello

Le 05/10/2020 à 08:16, azurit@pobox.sk a écrit :
> Anyone?
>
>> [...]
>> iptables: No space left on device.
Perhaps this ...

[...]

-- 
Daniel
