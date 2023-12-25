Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED49515A8
	for <netfilter@vger.kernel.org>; Mon, 25 Dec 2023 06:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="agT0Pvyo"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3bba50cd318so871353b6e.0
        for <netfilter@vger.kernel.org>; Sun, 24 Dec 2023 22:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703487245; x=1704092045; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GmPevXCN0yucz2vPFJuIA2dvIqrrYhRonJMwgs5fPoE=;
        b=agT0Pvyo1o30sSvk7+6va1YG4V2eY0uyQBmYEzq4Uwvic43WRFQ4EsOu6Gtuf6O2Bt
         UCUF/E0TPKoXdE15q0Drmvo3MYtlvkLfb5g0djvi7dtEDdNA3MQNS5RlZwcpZ9R4DXDm
         zQZVVZKtybiTBbNqVnkwolkQp6YZtacDQQZpJrHaZt355jhrCMfbKNBt0WFjhpDC7Nav
         sdkU3Vkyld0xZwero5elcwd9F4jSskBnL9/sGKKroHpZTWOgctbclkMiRxTUVEEmPacr
         Dvf9lBvEgzvZVH9AYfhO03OcrvL8Loavx/ob5M9YX7buTnfF+5AsBDZIZoQDRPOKPbK+
         MfVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703487245; x=1704092045;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GmPevXCN0yucz2vPFJuIA2dvIqrrYhRonJMwgs5fPoE=;
        b=X0QwZrg8ai8IejkQIYrXBlSJBgQIefHLlkOHlr9LLZlM6bXTQ8V58X1TxMFGZPtKf2
         CHS8v8oHAgkiIMHjdeUZzeA87J7a4Td6Z6wi5BXWj77zEWOrWYcIa16HdzOIRmIYtRHV
         HnwugS3iwlUgKSjFdwn9b2K49+xwWkal1FioK5d82FNgNOhrgxAdnVkcB0+L72U5e2zz
         fGk140VilXmb9SvFY/pSjb3pTiSXjYW2kmgRhE1rC8mekjpAZ/JDr9asSsoIUvER02wC
         +/8cHfp/EzBVgChwYuyrMrn+0yPvay7P+NCk9mMicJkEtOtJPJsm3IPlhbVNUheOgTh+
         lHZw==
X-Gm-Message-State: AOJu0YyBHKZdMXjiRpq3TlanwGOSeXp1n2pcmKgprBZcKlThJHTdsWWa
	s870tknBKl2g+X2AXLn/YFKedFilp92AsZ35WXxZXCKVwIw=
X-Google-Smtp-Source: AGHT+IHfw4zq2IIWasm/sWga7qJJDIgZro8p5malkid8DvOnEvyN+b3vP9x28T0fF1ny531e0w43sex4wKG33x6diy8=
X-Received: by 2002:a05:6808:218e:b0:3b9:e7cf:e643 with SMTP id
 be14-20020a056808218e00b003b9e7cfe643mr6952323oib.86.1703487244741; Sun, 24
 Dec 2023 22:54:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: P K <pkopensrc@gmail.com>
Date: Mon, 25 Dec 2023 12:23:54 +0530
Message-ID: <CAL0j0DFwyteatZzbi6DtJwpc0q6A-GP6o1gydz4KuC7uh=ZYNg@mail.gmail.com>
Subject: Kprobe for nf_nat is broken in Latest Debian 6.1.66-1
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

In recent debian kernel 6.1.66-1 kprobe to nf_nat_ipv4_manip_pkt or
any nf_nat function is not working. It was working fine on 6.1.55-1
kfunc is working fine.
Any suggestions on how to fix this?

Below are logs:

Not working :

/ # bpftrace --info
System
  OS: Linux 6.1.0-15-cloud-amd64 #1 SMP PREEMPT_DYNAMIC Debian
6.1.66-1 (2023-12-09)
  Arch: x86_64

Build
  version: v0.17.1
  LLVM: 16.0.3
  unsafe uprobe: no
  bfd: yes
  libdw (DWARF support): yes

Kernel helpers
  probe_read: yes
  probe_read_str: yes
  probe_read_user: yes
  probe_read_user_str: yes
  probe_read_kernel: yes
  probe_read_kernel_str: yes
  get_current_cgroup_id: yes
  send_signal: yes
  override_return: no
  get_boot_ns: yes
  dpath: yes
  skboutput: no

Kernel features
  Instruction limit: 1000000
  Loop support: yes
  btf: yes
  map batch: yes
  uprobe refcount (depends on Build:bcc bpf_attach_uprobe refcount): yes

Map types
  hash: yes
  percpu hash: yes
  array: yes
  percpu array: yes
  stack_trace: yes
  perf_event_array: yes

Probe types
  kprobe: yes
  tracepoint: yes
  perf_event: yes
  kfunc: yes
  iter:task: yes
  iter:task_file: yes
  kprobe_multi: no
  raw_tp_special: yes

/ #

$ sudo bpftrace -l | grep "manip"
kfunc:nf_nat:l4proto_manip_pkt
kfunc:nf_nat:nf_nat_ipv4_manip_pkt
kfunc:nf_nat:nf_nat_ipv6_manip_pkt
kfunc:nf_nat:nf_nat_manip_pkt
kprobe:l4proto_manip_pkt
kprobe:nf_nat_ipv4_manip_pkt
kprobe:nf_nat_ipv6_manip_pkt
kprobe:nf_nat_manip_pkt


/ # bpftrace -e 'kprobe:nf_nat_ipv4_manip_pkt { printf("func called\n"); }'
Attaching 1 probe...
cannot attach kprobe, probe entry may not exist
ERROR: Error attaching probe: 'kprobe:nf_nat_ipv4_manip_pkt'


/ # bpftrace -e 'kfunc:nf_nat:nf_nat_ipv4_manip_pkt { printf("func
called\n"); }'
Attaching 1 probe...

func called
func called
func called
func called
func called
func called
func called
func called
func called
func called
func called
func called
^C

/ #


Working:
/ # bpftrace --info
System
  OS: Linux 6.1.0-13-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.1.55-1 (2023-09-29)
  Arch: x86_64

Build
  version: v0.17.1
  LLVM: 16.0.3
  unsafe uprobe: no
  bfd: yes
  libdw (DWARF support): yes

Kernel helpers
  probe_read: yes
  probe_read_str: yes
  probe_read_user: yes
  probe_read_user_str: yes
  probe_read_kernel: yes
  probe_read_kernel_str: yes
  get_current_cgroup_id: yes
  send_signal: yes
  override_return: no
  get_boot_ns: yes
  dpath: yes
  skboutput: no

Kernel features
  Instruction limit: 1000000
  Loop support: yes
  btf: yes
  map batch: yes
  uprobe refcount (depends on Build:bcc bpf_attach_uprobe refcount): yes

Map types
  hash: yes
  percpu hash: yes
  array: yes
  percpu array: yes
  stack_trace: yes
  perf_event_array: yes

Probe types
  kprobe: yes
  tracepoint: yes
  perf_event: yes
  kfunc: yes
  iter:task: yes
  iter:task_file: yes
  kprobe_multi: no
  raw_tp_special: yes


/ # bpftrace -l | grep "manip"
kprobe:l4proto_manip_pkt
kprobe:nf_nat_ipv4_manip_pkt
kprobe:nf_nat_ipv6_manip_pkt
kprobe:nf_nat_manip_pkt
/ #


/ # bpftrace --version
bpftrace v0.17.1
/ # bpftrace -e 'kprobe:nf_nat_ipv4_manip_pkt { printf("func called\n"); }'
Attaching 1 probe...
func called
func called
func called
func called
func called
func called
func called
func called
^C

/ # bpftrace -e 'kfunc:nf_nat:nf_nat_ipv4_manip_pkt { printf("func
called\n"); }'
Attaching 1 probe...
func called
func called
func called
func called
func called
func called
func called
func called
func called

^C
/ #
