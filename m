Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiBjqFHl"
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF414B7
	for <netfilter@vger.kernel.org>; Tue, 12 Dec 2023 12:14:22 -0800 (PST)
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-59148c1ad35so181982eaf.2
        for <netfilter@vger.kernel.org>; Tue, 12 Dec 2023 12:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702412062; x=1703016862; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xGrzBxAjqVIPcu9tQRPmZ8E17qbFI7dTdLcgtc70p9I=;
        b=SiBjqFHl1MY2jbqdoJ8S+u3zT4W8w7ir0TRzA6MVT7q+LR6gRStcRwOhRRwlkYdIbv
         U4ivIdngQjeoWVKjfCV6rwBKDaVEdYA3au/HJAVJ1OiQGeYoyQ9PPRhEhlhokgTgtRu7
         OaIUViFlurPKKI8xeyu6SHdQUL7Loeex/wemeCmkzW799ow/yvQIPEvVzE9kAO4myJmo
         YWxof6CrVAozMo8t1YWsD+eST+WTfe4B2RdllPqdqwOuISyqID33B3YKyuCKXnHx+58j
         280BzzdQakjhza+R9ZMnihppQSC48U+v/i3+P6ZEB6hy+QEkOU+IYh950oLLR8XvJd/9
         doHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702412062; x=1703016862;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGrzBxAjqVIPcu9tQRPmZ8E17qbFI7dTdLcgtc70p9I=;
        b=NfTj6o0NfOTty9/IaFcFnXK5e72vunB29jZAaemsb71d/YWtvpfeiHeg9enMMrLUfO
         JrQHArFtPEkLnCE5Mk3P1GrbxvSn1B84+ZxMzI6xm0i7XrLazrVqXdXFh/gE7R5lzTM0
         3itgmC1WM6JGb0x9Wr5DiBtPeYIUbLuM8+AmpwFlw7/14GYehPdcCiyUTir6SndMZtex
         wh+zJpPIxNlbpsdgRBunRBHAkLO1Ot0Ktl3dkRGRgQMbSm/15yt2x4xpcXoG5fp5Jalm
         X8icUYbhp7hne4abuoCFhy8vBAhlPAgV38k9sv0JdeuxE8TIq9dPSjiTSQ2AHlXEQjHG
         0ZsA==
X-Gm-Message-State: AOJu0YynHR7PAmPM2FE8W4yoVsZUdSfCkBxCVTymXtTV/NItoxHmijcJ
	4ADo8cxVy8iHUW7DEV7Avzt7fm37dPQO1dL1Lx9DRSgn28k=
X-Google-Smtp-Source: AGHT+IHqtbfzD/7xHFwQVRm8YWS8AuNJD14uC/35nmvo1dE7un6JX4f6olK++9oItibT8g7HE7IJnl09h+crKW4ZjNI=
X-Received: by 2002:a05:6871:292:b0:1fb:75c:4007 with SMTP id
 i18-20020a056871029200b001fb075c4007mr8079637oae.103.1702412062077; Tue, 12
 Dec 2023 12:14:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: You Yu Lu <zxc70208@gmail.com>
Date: Tue, 12 Dec 2023 21:13:46 +0100
Message-ID: <CAA=+Qij3_FY==-OtG-qoY8b9ZwGyXYCt9Gt+LDn8xPO2caf9og@mail.gmail.com>
Subject: tcpdump output changes after restarting nftable
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello netfilter community,

On my system, I have an ethernet network eth0 and a bridge eth0_bridge
and several vlan interfaces(vlan.x) assigned to eth0.

OS: Ubuntu 22.04.1 LTS
kernel: 5.15.0-43
tcpdump: 4.99.1
nftable: 1.0.2-1ubuntu2

The problem that I am facing is that the behavior of tcpdump on eth0
is inconsistent before and after I restart the nftables.service. This
is the rule that I have to redirect the destination of the vlan tagged
packets coming from VLAN interfaces.

iifname vlan.1 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port1
iifname vlan.2 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port2
iifname vlan.3 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port3
iifname vlan.4 ip protocol udp ip daddr set $dst_ip udp dport set $dst_port4

After a reboot, the ruleset is applied properly when I run the nft list
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
Does this behavior make sense? Or is tcpdump not the right tool to
verify the nftable rule
in this case?

Best regards,
You-Yu Lu
