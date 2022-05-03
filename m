From: Linux Scoop <linuxscoop@gmail.com>
Subject: cannot allow outbound ping traffic
Date: Tue, 3 May 2022 09:59:00 -0400
Message-ID: <CAE-E4dTvSS6oG9aE5wWnhhQRmD1sqd2+CFYxRcCpKX9Ev64Duw@mail.gmail.com>
References: <CAE-E4dSkxc9d4sCWAs6dC=NjH3x6NuEKxyv9O9N4fG0hSncydQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=L+k4X54jw1nY6iSGX6/a0nrJO+82fbfqz6/wSZtyprE=;
        b=Wx4jEdYOguxdf6s1pimiC67EU/mT12a/t81N/CB8DObqdVU7688h/HIsvwgnk/OFKJ
         Dk/3iunKuJpyAcCVnskHGaxfXv1gVG4guXkFjKLqQLukWHEZ0TNttJEB3m1Cof+rHe2F
         cStC8By0s2t8kOzkwGnaQsay2WMJcRClnW2khb7qDoGf8IjkWHa9fQSgwo0VW1ghf6Ao
         +SgtvqA2ZEHcPi3uw8vz/FbeR27MsTS/+SfYg42ixl8/IVw/0PbjPRQ51UpygrG7FoBr
         55e+Yk6OlCPyPN264aaDo6rUJq2DNgIjn6yAfnzQNMmOqUOb+XUMRUjiXh03vK7jIt5C
         F3rw==
In-Reply-To: <CAE-E4dSkxc9d4sCWAs6dC=NjH3x6NuEKxyv9O9N4fG0hSncydQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello netfilter community,


I am running into a problem where I cannot ping other hosts if I have
nftables service turned on.

I have the following rule for outgoing traffic (basically allows all
outgoing traffic)



        chain OUTBOUND {

                type filter hook output priority 0; policy accept;

        }



But I cannot ping any inside or outside IPs, eg.



[root@lxdvfs1a nftables]# ping -vv 172.29.28.1

ping: socket: Permission denied, attempting raw socket...

PING 172.29.28.1 (172.29.28.1) 56(84) bytes of data.

153 packets transmitted, 0 received, 100% packet loss, time 151999ms



If I turn off nftables service, I can ping any IPs normally.

[root@lxdvfs1a nftables]# ping 172.29.28.1

PING 172.29.28.1 (172.29.28.1) 56(84) bytes of data.

64 bytes from 172.29.28.1: icmp_seq=1 ttl=64 time=1.64 ms

64 bytes from 172.29.28.1: icmp_seq=2 ttl=64 time=0.446 ms

64 bytes from 172.29.28.1: icmp_seq=3 ttl=64 time=0.488 ms



I also tried adding the following to explicitly allow outgoing ping,
but it did not work either.



icmp type echo-request ct state new,established accept



Any insight/help would be appreciated.



Thanks,

Lihua Wang

Sysadmin at CUNY Graduate Center
