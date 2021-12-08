From: Vladimir Nikishkin <lockywolf@gmail.com>
Subject: Re: Matching metainformation cgroup fails on input, works on output.
Date: Wed, 08 Dec 2021 22:17:41 +0800
Message-ID: <8735n32nax.fsf@laptop.lockywolf.net>
References: <874k7j31no.fsf@laptop.lockywolf.net>
 <CANf9dFMcpnqO-at25EKfxad7fX=yT9s0A7EDBgac1doL3fGxpg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version;
        bh=AjxTTyzOC4+ACXT7gJx+kYnlSC8TBxM8V7QyLkKm9TA=;
        b=jWmz/ISJNCYsYiQu7YK51S6AfXfpS+axsMY2La/oIHeRmz2lfRer1knTHj37a01dVV
         vdyPRK8tUls/v5nVUftZ8ITx8aBoq6vUthJvc7mme4oWglTnEICFNN6zxRu4Qn8806Xe
         uYL2HRHbWgZtgZF9x6KJ+6QJ39cN8dexPKkfVuDyA7Jt7UdZRrj7RP1RNWWola13kBXh
         N9wGDeo8nCwe40YPhEX+B2OvS4/dVGWnb56di/bAYkKxrRXMOKp1t/8ksZ3D1mlcm45F
         MFDMaHri+AIP+0OXu9AFf19SI/CufYJT/EKA+9JbHWJ8vRroJOMIsNeAYpNx5UsKr9BN
         dtyg==
In-reply-to: <CANf9dFMcpnqO-at25EKfxad7fX=yT9s0A7EDBgac1doL3fGxpg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: netfilter@vger.kernel.org

I have just tested it (again) by flushing the old ruleset and using the
following ruleset:

```
table ip filter {
	counter test-icmp-output {
		packets 3 bytes 252
	}

	counter test-icmp-input {
		packets 0 bytes 0
	}

	chain INPUT {
		type filter hook input priority filter; policy accept;
		meta cgroup != 4096 ip saddr 8.8.8.8 ip protocol icmp counter name "test-icmp-input"
	}

	chain OUTPUT {
		type filter hook output priority filter; policy accept;
		meta cgroup != 4096 ip daddr 8.8.8.8 ip protocol icmp counter name "test-icmp-output"
	}
}
```

As previously, the cgroup 0x001000 does not exist. The three outbound
packets are the three ping packets, and they were successfully replied
to.

Martin Gignac <martin.gignac@gmail.com> writes:

> What is the complete output of 'nft list ruleset'?
>
> Is it possible you have an earlier INPUT rule that matches and allows
> packets that match connection-tracking "established" state, such as:
>
>         chain INPUT {
>                 type filter hook input priority filter; policy drop;
>                 ct state established,related counter packets 391638047
> bytes 93651768866 accept
>                 ct state invalid drop
>                 [...]
>
> -Martin
>
>
> On Wed, Dec 8, 2021 at 4:39 AM Vladimir Nikishkin <lockywolf@gmail.com> wrote:
>>
>> Hello, everyone.
>>
>> I have a weird problem!
>>
>> This is my nft code:
>>
>> ```
>> nft add counter filter test-icmp-output
>> nft add counter filter test-icmp-input
>> nft add rule filter OUTPUT meta cgroup != 0x001000 ip daddr 8.8.8.8 ip protocol icmp counter name test-icmp-output
>> nft add rule filter INPUT  meta cgroup != 0x001000 ip saddr 8.8.8.8 ip protocol icmp counter name test-icmp-input
>> ```
>>
>> Pinging 8.8.8.8 works. The packets are visible on tcpdump too.
>> The cgroup id 0x001000 does not exist, so every packet should match.
>>
>> Still, the output counter counts the expected number of packets, the
>> second stays 0.
>>
>> What am I doing wrong?
>>
>> --
>> Your sincerely,
>> Vladimir Nikishkin (MiEr, lockywolf)
>> (Laptop)


-- 
Your sincerely,
Vladimir Nikishkin (MiEr, lockywolf)
(Laptop)
