From: A L <mail@lechevalier.se>
Subject: Status of BPFilter?
Date: Sun, 20 Oct 2019 15:54:23 +0200
Message-ID: <3a0fc6f6-d66a-35aa-19d6-7456a3fe8f96@lechevalier.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lechevalier.se; s=20140924;
        h=content-transfer-encoding:content-type:mime-version:date:message-id:subject:
         from:to:from;
        bh=Y5jT+F7cjGV6ijooSQLakb0YdCQEZ8dDXEhZF4jl4iY=;
        b=LbRlCvaOr3c1MqfX/OxwMYyZ1l3pfd3E59zRSE0dHLSPNmS1QWYgfe/QF3s5MLCSrVTLdcwCd2e9G
         I1gVOqE1CHqdsqTTrFdIBjU6QzSCEgX9xf5FkKn9cs7umq99j+9pmt7YR+p9O6Z8SPWtdfHFuNXWVA
         5u4VBw/HHv5+H7Yc=
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear all,

I'm looking for up to date documentation on bpfilter in Kernel and what 
tools are needed to properly use it. I hope I have come to the right 
place :)

The most recent information seems to be this 2018 PDF from Facebook(1) 
where they talk about re-implementing a firewall in eBPF using the 
existing iptables (not nft/nf_tables?) kernel interface with the use of 
a user-space helper module. It seems they mean that the original 
iptables tools should work transparently.

Looking at the source code /usr/src/linux-5.3.7-gentoo/net/bpfilter/ we 
have both the 'bpfilter.ko' module and the user-mode-helper 
bpfilrter_umh as an ELF executable. There is a YouTube video(2) showing 
the use of the helper module that seemingly intercepts the standard 
iptables (legacy?) rules and converts them to BPF.

What is the status of bpfilter. What are its current capabilities and 
how can we make use of them? For example, is some specially patched 
iptables user tools required.

Original mailinglist entries with patches:
https://marc.info/?l=netfilter-devel&m=151878844403666&w=2
https://lwn.net/Articles/747551

Thanks,
~A


1) http://vger.kernel.org/lpc_net2018_talks/ebpf-firewall-LPC.pdf
2) https://www.youtube.com/watch?v=AfgwVya9Cog

