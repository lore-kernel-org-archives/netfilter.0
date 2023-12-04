Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4Sts4Lc"
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCD1134
	for <netfilter@vger.kernel.org>; Mon,  4 Dec 2023 05:55:19 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6d8ba6c9b4bso976465a34.3
        for <netfilter@vger.kernel.org>; Mon, 04 Dec 2023 05:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701698118; x=1702302918; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5I02/wqi2mJtvE2CPFB9gNPedPRpy/U3DtW98Hoic2k=;
        b=W4Sts4LcZjXs1TaGyLYxKprutk394Wf1eA6Tmzx62XS6zZWnnLJDu37RBQyzZ+URPa
         oypdRILC0D2kjJ/CudgSoJ0P212M2C4QLFnV/Q80X02Ja7HZjzLLrXBzdvVAjWHl7f59
         qZdxomfRHLKfsy357V6wcOlp3ua6sKG46NmLl1XcW5Cjqeae4g1aYKREZJc8tjTZmrW3
         ROySEa25wjo3ab2ziXvGsET33pU4KeStuD9HIyCi6TNC/o3yy4jJRIKtzmesIZKf8VqD
         4vRzOut5MipPPYmjD4WIZjEnaZ6gPjq/rX9cG6Xq8GrFKJFkQdoi9fcpYaD2E1eNo8d0
         P/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698118; x=1702302918;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5I02/wqi2mJtvE2CPFB9gNPedPRpy/U3DtW98Hoic2k=;
        b=Eb5NH3KV1e8QOoyC7RUuyFJdVM6NP0akURtLRvAuDWlG3g1C3WWHYIpB3/JKTCr33g
         5Rh5OUX+Qoxr6pNeZHbDz4puteQ/OT89mYqXruOZU0gmu0Bmzhozpl92MHMITHoFOeVz
         ytu9+DhX6mWgI86V/BzCChrF2q3khMb2W3sghYtQHl4LdIWPpXMhNA6qTgD9ByhzMQI6
         GKubrTi/VFAkpgX3hUbZu5mCQFHNwfYAQ8n7ci5v+P8/IQ0Z6cXOWr3f87OAb44I1Jgr
         nJOTokQKP5gxqmzspgoJMFuWQdz9+oi7d+XglQ8QLXRWYj+LcnAuMvA8wZimqgx3yYwi
         KLDA==
X-Gm-Message-State: AOJu0YwWReNZhur4LuOuPFOCvppVT/ePipq1oRHS3sxoxlvJG1gR7bql
	Yp4C4q1TOmPrWUOqL9B0Wovv8bXp5fBvHsZmgtNfKxMDG1kYTA==
X-Google-Smtp-Source: AGHT+IGK9pW6p6mL5V/08/SaG9RiCn6PmiG++2Tw/JII9bE+ENMU6Q6LBgvyOmYTgunfdIp62CLvgRgi+nZIiL/JcJA=
X-Received: by 2002:a05:6830:1d51:b0:6d9:a1c5:7d7 with SMTP id
 p17-20020a0568301d5100b006d9a1c507d7mr1384004oth.57.1701698118031; Mon, 04
 Dec 2023 05:55:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
In-Reply-To: <CAA=+QiiS_FZnaGNjx7kGYqJgkMTE48z7nHn1VREcV4PoD3GyZQ@mail.gmail.com>
From: You Yu Lu <zxc70208@gmail.com>
Date: Mon, 4 Dec 2023 14:54:42 +0100
Message-ID: <CAA=+QigdCVDHgmDq8G+4U+SjYOGPQ8TrBXAcD8UXYxgJ4Dqtiw@mail.gmail.com>
Subject: Re: Unit dependency of network-pre.target in nftables.service
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you very much for all the answers. Now I understand the reason
for the dependency in the nftables unit file.
Maybe I should explain my question or my problem properly.

On my system, I have an ethernet network eth0 and a bridge eth0_bridge
and several vlan interfaces(vlan.x) assigned to eth0.
The problem that I am facing is that the behavior of tcpdump on eth0
is inconsistent before and after I restart the nftables.service. This
is the rule that I have to redirect the destination of the vlan tagged
packets coming from VLAN interfaces.
iifname vlan.1 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port1
iifname vlan.2 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port2
iifname vlan.3 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port3
iifname vlan.4 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port4

After a reboot, the ruleset is applied properly when I ran nft list
ruleset and tcpdump(tcpdump -nei eth0) captures the raw UDP packets
that are not redirected.
vlan 1, x.x.x.x.12345 > x.x.x.x.54321: UDP
vlan 2, x.x.x.x.12345 > x.x.x.x.54321: UDP
vlan 3, x.x.x.x.12345 > x.x.x.x.54321: UDP
vlan 4, x.x.x.x.12345 > x.x.x.x.54321: UDP
However, after I restart the nftables.service manually(basically flush
and reload the rules), the output of exactly the same tcpdump command
on eth0 looks different. It seems like tcpdump is getting the
redirected packets with $dst_ip, $dst_port, but it looks random and
does not match the 1-1 correspondence in the nft rules.
vlan 1, x.x.x.x.12345 > $dst_ip.$dst_port3: UDP
vlan 2, x.x.x.x.12345 > $dst_ip.$dst_port3: UDP
vlan 3, x.x.x.x.12345 > $dst_ip.$dst_port1: UDP
vlan 4, x.x.x.x.12345 > $dst_ipx.$dst_port1: UDP
vlan 1, x.x.x.x.12345 > $dst_ip.$dst_port1: UDP
vlan 2, x.x.x.x.12345 > $dst_ip.$dst_port4: UDP
vlan 3, x.x.x.x.12345 > $dst_ip.$dst_port4: UDP
vlan 4, x.x.x.x.12345 > $dst_ipx.$dst_port2: UDP
On the other hand, if I listen to eth0_bridge, the tcpdump output is
consistent before and after nftables.service and I am getting the
correct 1-1 match according to the nft ruleset.

Does this behavior make sense? Or is tcpdump not the right tool to use
in this case?

Best regards,
You-Yu Lu


On Fri, 1 Dec 2023 at 12:50, You Yu Lu <zxc70208@gmail.com> wrote:
>
> Hello netfilter community,
>
> I have a question regarding the dependency of nftables.service.
> OS version: Ubuntu 22.04.1 LTS
> nftable package version: 1.0.2-1ubuntu2
>
> In the default nftables.service unit file, it has a default dependency
> that it needs to be started before network-pre.target at boot. Based
> on my understanding, nftable rule are loaded before the network
> interfaces are configured.
> # /lib/systemd/system/nftables.service
> [Unit]
> Description=nftables
> Documentation=man:nft(8) http://wiki.nftables.org
> Wants=network-pre.target
> Before=network-pre.target shutdown.target
> Conflicts=shutdown.target
> DefaultDependencies=no
>
> What is the reason to start nftable service before networkd configured
> by default?
> Is this the intended behavior for nftable? Or is it fine to modify the
> service unit file and change the dependency to fit different use
> cases?
>
> Thank you in advance.
>
> Best regards,
> You-Yu Lu
