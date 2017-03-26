From: Nick Howitt <nick@howitts.co.uk>
Subject: Problem with ipset and --in-interface
Date: Sun, 26 Mar 2017 09:06:19 +0100
Message-ID: <237f8db1-1a60-c97f-f965-8ed363860731@howitts.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mailserver.howitts.co.uk 7A404409E691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howitts.co.uk;
        s=201703; t=1490515580;
        bh=iMDMYMpV6vt/vfMQGaK8zjpn8xilRzE3X21DMVRV/zU=;
        h=To:From:Subject:Date:From;
        b=6uewaDRaFt8VKInaGyqlW66jo2yguaFFvHDlstdRxh1f89zeTvGXF01HbumU8EjLY
         bsPtHWEQxs2ZOxRPqtQ9WhFodJ1NkW6zp7Mlyex6BRju6rjg98PGM63BwFwEHFAYJm
         BbByb5ZBDMOT67Eb+knPU1NLVqhmIsAn325ntTPAbbOeWvxznEU1oxlW9/LOh7GqWg
         9hKeQIKB71Umknzf4iLaqsqOtn38z7y8YioENxwE7Hfc7fEFJ6ev6lp7H7jAmrx1iM
         d2aHK8boOfsO3aYj92kIOTmxDpNp6idPmDZzERICEyp0a88wim7QCFALpul+/0hube
         fz+lnby28Q0kw==
DKIM-Filter: OpenDKIM Filter v2.10.3 mailserver.howitts.co.uk 8BFCF409E692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howitts.co.uk;
        s=201703; t=1490515579;
        bh=iMDMYMpV6vt/vfMQGaK8zjpn8xilRzE3X21DMVRV/zU=;
        h=To:From:Subject:Date:From;
        b=dnLwDgcj568X4f19Vj6sOXy46ICwRY595xC3ONFMQbJEcmKfy5GB8epfKEBy0/KmK
         ECUMdq5oiXxF5x2c65aIuNeScbfhHRBR30GL1i4wUkn3zw3d9hMBjqEPaXzDcKATe2
         ISS0HuU7REDvhwX0PzHC5aO11Pwp0cwOX4H4yp3Gz4mhzn9z25kfl8/uxBa4Ct039l
         y5V6ba7qdn235enDPhSPP3JCCedqf14lhBv9ZM6mRGOz4u/fBeqU7dQZ7b4w27NQOW
         LLY3HPHD2sCLEzAUZ3D3oBeWw92xVvuLrYFCyrWVn9dy0IhPiYnlZ2Qw3Ssdyg7fUy
         uFD7tplXsDueQ==
DKIM-Filter: OpenDKIM Filter v2.10.3 mailserver.howitts.co.uk 68399409E691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howitts.co.uk;
        s=201703; t=1490515579;
        bh=iMDMYMpV6vt/vfMQGaK8zjpn8xilRzE3X21DMVRV/zU=;
        h=To:From:Subject:Date:From;
        b=dnLwDgcj568X4f19Vj6sOXy46ICwRY595xC3ONFMQbJEcmKfy5GB8epfKEBy0/KmK
         ECUMdq5oiXxF5x2c65aIuNeScbfhHRBR30GL1i4wUkn3zw3d9hMBjqEPaXzDcKATe2
         ISS0HuU7REDvhwX0PzHC5aO11Pwp0cwOX4H4yp3Gz4mhzn9z25kfl8/uxBa4Ct039l
         y5V6ba7qdn235enDPhSPP3JCCedqf14lhBv9ZM6mRGOz4u/fBeqU7dQZ7b4w27NQOW
         LLY3HPHD2sCLEzAUZ3D3oBeWw92xVvuLrYFCyrWVn9dy0IhPiYnlZ2Qw3Ssdyg7fUy
         uFD7tplXsDueQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I'm new to the list so please forgive.

I have the following rule in my iptables:

iptables -w -I INPUT -i enp2S0 -m set --match-set country-list src -p 
tcp -m multiport ! --dports 25,80,443 -m state --state NEW -j DROP

but I've noticed it is not blocking. I tried checking using GRC's 
Shields Up test scanning port 993. If instead, I do:

iptables -w -I INPUT -m set --match-set country-list src -p tcp -m 
multiport ! --dports 25,80,443 -m state --state NEW -j DROP.

It works. The problem seems to be the come when I use the -i selector. 
Do you know what I'm doing wrong?

I am using ClearOS7.3 (a CentOS7.3 derrivative) with 
ipset-6.19-6.el7.x86_64 and iptables-1.4.21-17.v7.x86_64.

TIA,
Nick
