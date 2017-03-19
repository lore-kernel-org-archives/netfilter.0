From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk accepted! Droplet: DDoS countermeasures powered by
 BPF + XDP
Date: Sun, 19 Mar 2017 09:49:40 -0400
Message-ID: <29545711-ad05-f3f7-0a69-2d329ac70c41@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=6Ge0IMlnX1RtBVj/cXwnzW8ZGOolEN4bq0IpES6P+tA=;
        b=k/p+6EnftFK2eNgOrfXZ2QT9xb0d0KWRIzO7YWpaK2sHn3N+0H2SUuKFIiyMY7bsKR
         wBBPdmiEYZzpMsdEEjhiCCEkRaI4fuA0cqI8Gw2lZlbLZz2KN60MBwSWdtP42YCHqDPB
         7Mbnda1RnySfSOUTHdn0FsIo25fkJCh3BPj+eriDdQ8+v8I+sjFj6FFItjYmjF92RyEt
         Naoi/7wYs0tL28h5zDMHQa1IM/XkiV/MZrsuQElOUH8qClywmzCqHgXFX1kZqSnFLqQq
         K9ZcpabrqykJ6jnJdDt85nGwIjQrJAclUubXLIpiBPZeOHvwaMf4d2/1SNXdy0g7Hlld
         Js+A==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, netfilter-devel@vger.kernel.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org, linux-wireless@vger.kernel.org, Heri Muhero <hmuhero@gmail.com>

I am going to keep netfilter and wireless lists on for now unless I hear
more objections. We will be doing about one a day from now until about
the time of the conference.

The tech committee would like to announce a new accepted talk.

Huapeng Zhou, Doug Porter, Ryan Tierney and Nikita Shirokov
are going to give a talk on Droplet which is used at Facebook
to plug in DDoS countermeasures.

More details:
----
Droplet is a generic framework to implement bpf policers to drop
packets at the earliest stage in the networking stack, preferably at
line rate. It's born for anti-DDoS and is the preferred infrastructure
at Facebook to plug in DDoS countermeasures. This talk presents the
overall architecture of Droplet and discusses a few issues in
developing and rolling out the software.

At a high level, Droplet takes bpf policer code written in restricted C
syntax, compiles it at runtime and hooks it into the kernel. The
framework abstracts out interactions between user space and kernel
space so the end user only needs to write policer code. It could chain
bpf programs together so we get multiple active DDoS countermeasures at
the same time. The policer code is shipped as configuration, which
enables fast response time when under active attacks.
--------

cheers,
jamal
