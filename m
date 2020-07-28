From: harald@a-little-linux-box.at
Subject: usings sets as input to sets
Date: Tue, 28 Jul 2020 11:27:24 +0200 (CEST)
Message-ID: <20200728092724.677EC40A2A@i-am.a-little-linux-box.at>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a-little-linux-box.at;
        s=dkim; t=1595928444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WK4H6mZL37/XQkk+lxTQJFJHur16Tw2uBDsIXtydhXM=;
        b=hDAPJopG8FUEtK0PpEAEC/Zz7DQwpJeWQev+sC+42MWws1cNc8qZUtCXn55/D9IoYxVy1L
        cqkMHDQNOe4MWf6XNlOz96x9+wLzk1zxkCexXNMpgTTue/rWojLb8/xlGrfIbv0Tk6pQk7
        p3Zb1jvmDvIujj6Dpcvd8JY8WmlgHZjOG4Gtw/mJLipEDE5iSZnk5kssWdhZAoI+wF39+9
        Acw9T3VPfFrZZx3uq1Ij0dr+rw4vjZ81RWtX3ZY9slwiUUEy0RgWaYPbhS8jfTiB31u5RT
        0bXzvzfcXtiyqOXB9Att6Nc8p0FdEm7ZU87WcBV78z6/jbDT1nuV1YmwFnxztbEl8m5WwF
        TtU3OTMCwNdCijb6zaCldQMvlhZ2DqIZI8BxJwVyMSZFlGEsOUkpJf6TsEA2IEAAMzz7oL
        e41rms61tst3Zb2h4//8SAflUmiLOXKPrxriILz 
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have the following nftables script:

define guarded_ports =3D {ssh}

table inet portknock {
        set port2 {
                type inet_service
                flags timeout
                timeout 60m
        }

        set port3 {
                type inet_service
                flags timeout
                timeout 60s
        }

        set clients {
                type ipv4_addr
                flags timeout
        }

        set candidates {
                type ipv4_addr . inet_service
                flags timeout
        }

        chain input {
                type filter hook input priority -10; policy accept;

                iifname "lo" return

                tcp dport 12345 add @candidates {ip saddr . @port2 timeout =
10s}
                tcp dport @port2 ip saddr . tcp dport @candidates add @cand=
idates {ip saddr . @port3 timeout 10s}
                tcp dport @port3 ip saddr . tcp dport @candidates add @clie=
nts {ip saddr timeout 10s}

                tcp dport $guarded_ports ip  saddr @clients accept
                tcp dport $guarded_ports ct state established,related accep=
t

                tcp dport $guarded_ports reject with tcp reset

        }
}

When trying to apply it it throws the following error with nftables v0.9.6 =
(Capital Idea #2):

/tmp/rules:31:48-52: Error: syntax error, unexpected string, expecting ll o=
r nh or th
                tcp dport 12345 add @candidates {ip saddr . @port2 timeout =
10s}
                                                             ^^^^^
/tmp/rules:32:82-86: Error: syntax error, unexpected string, expecting ll o=
r nh or th
                tcp dport @port2 ip saddr . tcp dport @candidates add @cand=
idates {ip saddr . @port3 timeout 10s}
                                                                           =
                    ^^^^^

So my question is is this even supposed to work or not? If not then maybe s=
omebody could tell me why and if it is supposed to work why doesn't it?

Kind regards
Harald Jenny
