Received: from mta-p8.oit.umn.edu (mta-p8.oit.umn.edu [134.84.196.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A066518FC8C
	for <netfilter@vger.kernel.org>; Wed,  6 Nov 2024 17:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.84.196.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730915543; cv=none; b=KzelhBkkOjqFl37YgKRRQWYbNsV6BfUurPfQo1r0Wu57zQg8BXxsWI0XAvV5/oxSh0ctYIl+eyXn3XhEJymtAwSm9wsjqEQR3Qdz3o9SppaDPs9cMUddg+P35w18JeyuwyWQKojwYNJs2ooJgFqyi+rkFGkGis4mjBgDb5GlfbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730915543; c=relaxed/simple;
	bh=K2Kfo2wylM7riAvwoNMINuKjFqKXB9d2drRb0ZNaU1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcg1inYZhbV1XxYmenuzWt4gIFRPmoYoalxntygVGuznT8U9GuJymzXv7qIa4tB7cNV13YfylpnU8aZa/scX065pZ+1+cahfBgk12dRxmCqGSSfvRVbN1N58WEpM3DKpRrQITzOUc9y0pBYh19Su5rDuAt5pcXnwmmQdB2EGTDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu; spf=pass smtp.mailfrom=d.umn.edu; dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b=R88yWj16; arc=none smtp.client-ip=134.84.196.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b="R88yWj16"
Received: from localhost (unknown [127.0.0.1])
	by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4XkCJv4mZxz9wlnw
	for <netfilter@vger.kernel.org>; Wed,  6 Nov 2024 17:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9B_rXfeV0J3q for <netfilter@vger.kernel.org>;
 Wed,  6 Nov 2024 11:45:03 -0600 (CST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4XkCJv2BCqz9wlns
	for <netfilter@vger.kernel.org>; Wed,  6 Nov 2024 11:45:03 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4XkCJv2BCqz9wlns
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4XkCJv2BCqz9wlns
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5ca0ea6c3deso702983a12.2
        for <netfilter@vger.kernel.org>; Wed, 06 Nov 2024 09:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1730915102; x=1731519902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbblU5OirE98qeIsLSuV2sbts6z9ytm6KAtWwCNln34=;
        b=R88yWj16j6DOOG0IzGBbh04Uo86HZt3w0jtd3ZKiR4EqdbiG9hsRW0pc4aEN8c3JWs
         z6pL9D1VepPt9lSy1ngIn5bK4/7uoS0XWc+vTfETJ79LwtG1m/pBCgCUOjOjdUsJ78J1
         vLhTUafQo3qpdQDVPQFjOqYgxOwvaeSGOSm1O7HIoh8uxJAxfx1XoVO+MUkhSHtYvIcV
         fz47JlnGAp5HaO9+5fZGuSFhME2sA7+TJBR+NM0+KEcvCPgBmX1X9sYxkkLbHQggT89P
         x6dNf4RmbJwQnG4+T6PZeDSl0tw7AnExL7cBZASARN7DlruFfbVlxxOsYbagG7D/gFgs
         mFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730915102; x=1731519902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbblU5OirE98qeIsLSuV2sbts6z9ytm6KAtWwCNln34=;
        b=hnEo/q8FZBn99f6/wfk7lHVIrPHLxArluHZLjIiGHtYyNx8rgu3HITmMBU8rDJZYLj
         PG47VaAT2vtNEnvgcO/ReFkvlH54iyGJyKG5Np2I0OSMCDw4wsZHWAe4Sq58lmoYeNYK
         cb+fT8aZ3Jw4Hqt+YKtGQiJAFh82dXQQYJZV9D7zifVfzag1AoSAi4ONKV1/YmiIbE7V
         1Oc0MFJxx5dIPcJhW2luWkpjxgjdsFWXuJj36j1W9ku2tnTuFOxn9Hk47B4w6sr9FD7Y
         qv9EqgP25MMe24RQCXRDKOLU5KBgR12IJ/IozgDkRMy5pZ97s7woH+LCOM9PXrtjrJAw
         sndw==
X-Gm-Message-State: AOJu0Yy0vzBUQz7YhTtBxj+63NqIyfhTXhh//Dd9ulOnqZjUiXPZlLzB
	GcP6xqbXS/gQoVWY1gRQeQWx6x17iRZPYIqHpQMFeKseM9RVK/AGWF8OF6Two6t6qNYN9CMHFDL
	1sErsUqJe53hj30PO3LiNXnskXPiwKU/pj+HggK8xeEcrckQNBfF+W658H4nr1YXSiDVdLHrrSm
	jY8nrTKXTQaHCcHKnuoXRcTKWZRcC6zYzvhpZA1fCFsdHRDoJo
X-Received: by 2002:a17:906:ef0e:b0:a80:a3a8:9867 with SMTP id a640c23a62f3a-a9ed3b64280mr15319066b.9.1730915101512;
        Wed, 06 Nov 2024 09:45:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxBBhPgaHqwn5bDVZQpyL0CRzs6h4EF5+atBYY+TQN0AQua/ITr35HdWDwgyFHWhRODRRB1YNZnrVYlKM/A0Q=
X-Received: by 2002:a17:906:ef0e:b0:a80:a3a8:9867 with SMTP id
 a640c23a62f3a-a9ed3b64280mr15317966b.9.1730915101044; Wed, 06 Nov 2024
 09:45:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOLfK3VUyrxBzd4sfk9Fhb8RnmQ8TAbszh0j2TD1a24WE-h74g@mail.gmail.com>
 <771EECBD-1B8C-46F9-8429-B1118380F7A2@slavino.sk>
In-Reply-To: <771EECBD-1B8C-46F9-8429-B1118380F7A2@slavino.sk>
From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Date: Wed, 6 Nov 2024 11:44:50 -0600
Message-ID: <CAOLfK3UWDAOAww10O2NxFBPgLa+Rr92=Lw+qFb1fxDOhD_6Dgg@mail.gmail.com>
Subject: Re: connection tracking and kernel dropping packets
To: Slavko <linux@slavino.sk>
Cc: netfilter <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Greetings...

On Tue, Oct 29, 2024 at 10:48=E2=80=AFAM Slavko <linux@slavino.sk> wrote:
>
> D=C5=88a 29. okt=C3=B3bra 2024 15:11:34 UTC pou=C5=BE=C3=ADvate=C4=BE Mat=
t Zagrabelny <mzagrabe@d.umn.edu> nap=C3=ADsal:
>
> >...but it is still dropping packets due to the CT.
>
> You have first to inspect what is filling your conntrack table:
>
>     conntrack -L

I've waited a week to let the TCP streams in the conntrack table time
out. I'm still seeing the kernel drop packets:

# tail -f /var/log/kern.log
Nov  6 11:29:02 netadm kernel: [48773744.961053] nf_conntrack: table
full, dropping packet.

...and confirmed with /proc:

# cat /proc/sys/net/ipv4/netfilter/ip_conntrack_count
65536

...but there aren't that many flows in the conntrack table, and none
in the expect table.

# conntrack -L > /dev/null
conntrack v1.2.1 (conntrack-tools): 22 flow entries have been shown.

# conntrack -L expect
conntrack v1.2.1 (conntrack-tools): 0 expectations have been shown.

Any idea where to find what is still causing the kernel to drop packets?

I still need to handle the INVALID state, but here is my current rule-set:

# Generated by iptables-save v1.4.14 on Wed Nov  6 11:40:00 2024
*raw
:PREROUTING ACCEPT [559078817:46637850935]
:OUTPUT ACCEPT [539455981:114717831525]
[311121010:22258566347] -A PREROUTING -p udp -m udp --dport 53 -j CT --notr=
ack
[82158007:15791189816] -A PREROUTING -p udp -m udp --sport 53 -j CT --notra=
ck
[160638557:7854716900] -A PREROUTING -p tcp -m tcp --dport 53 -j CT --notra=
ck
[55174:13694242] -A PREROUTING -p tcp -m tcp --sport 53 -j CT --notrack
[82898530:7187312985] -A OUTPUT -p udp -m udp --dport 53 -j CT --notrack
[310815684:92319143568] -A OUTPUT -p udp -m udp --sport 53 -j CT --notrack
[81356:4991618] -A OUTPUT -p tcp -m tcp --dport 53 -j CT --notrack
[134221259:13321766219] -A OUTPUT -p tcp -m tcp --sport 53 -j CT --notrack
COMMIT
# Completed on Wed Nov  6 11:40:00 2024
# Generated by iptables-save v1.4.14 on Wed Nov  6 11:40:00 2024
*nat
:PREROUTING ACCEPT [2196269:120347484]
:INPUT ACCEPT [1191964:55756667]
:OUTPUT ACCEPT [43401:4029238]
:POSTROUTING ACCEPT [43401:4029238]
COMMIT
# Completed on Wed Nov  6 11:40:00 2024
# Generated by iptables-save v1.4.14 on Wed Nov  6 11:40:00 2024
*mangle
:PREROUTING ACCEPT [559078013:46637808723]
:INPUT ACCEPT [559078013:46637808723]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [539456018:114717838594]
:POSTROUTING ACCEPT [539456018:114717838594]
COMMIT
# Completed on Wed Nov  6 11:40:00 2024
# Generated by iptables-save v1.4.14 on Wed Nov  6 11:40:00 2024
*filter
:INPUT DROP [1028561:66625259]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [539455943:114717822181]
[555959622:46411126809] -A INPUT -m conntrack --ctstate
RELATED,ESTABLISHED,UNTRACKED -j ACCEPT
[158:11928] -A INPUT -i lo -j ACCEPT
[0:0] -A INPUT -s 10.101.0.0/16 -p icmp -j ACCEPT
[1283248:91447747] -A INPUT -s 10.212.0.0/16 -p icmp -j ACCEPT
[0:0] -A INPUT -s 10.84.0.0/16 -p icmp -j ACCEPT
[23101:2217696] -A INPUT -s 10.57.0.0/16 -p icmp -j ACCEPT
[0:0] -A INPUT -s 10.94.0.0/16 -p icmp -j ACCEPT
[0:0] -A INPUT -s 127.0.0.0/8 -p icmp -j ACCEPT
[767154:60545933] -A INPUT -s 10.0.0.0/8 -p icmp -j ACCEPT
[0:0] -A INPUT -s 172.16.0.0/12 -p icmp -j ACCEPT
[12243:5597503] -A INPUT -s 192.168.0.0/16 -p icmp -j ACCEPT
[0:0] -A INPUT -s 100.64.0.0/10 -p icmp -j ACCEPT
[3:243] -A INPUT -p udp -m udp --dport 53 -j ACCEPT
[0:0] -A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
[0:0] -A INPUT -s 10.212.109.49/32 -p tcp -m tcp --dport 8139 -j ACCEPT
[3888:233280] -A INPUT -s 10.212.0.0/17 -p tcp -m tcp --dport 22 -j ACCEPT
[0:0] -A INPUT -s 10.212.128.0/18 -p tcp -m tcp --dport 22 -j ACCEPT
[0:0] -A INPUT -s 10.212.192.0/19 -p tcp -m tcp --dport 22 -j ACCEPT
[0:0] -A INPUT -s 127.0.0.0/8 -p tcp -m tcp --dport 22 -j ACCEPT
[0:0] -A INPUT -s 10.0.0.0/8 -p tcp -m tcp --dport 22 -j ACCEPT
[0:0] -A INPUT -s 172.16.0.0/12 -p tcp -m tcp --dport 22 -j ACCEPT
[8:416] -A INPUT -s 192.168.0.0/16 -p tcp -m tcp --dport 22 -j ACCEPT
[0:0] -A INPUT -s 100.72.0.0/15 -p tcp -m tcp --dport 22 -j ACCEPT
[0:0] -A INPUT -s 10.94.202.160/27 -p icmp -j ACCEPT
COMMIT
# Completed on Wed Nov  6 11:40:00 2024

Thanks for any help!

-m
