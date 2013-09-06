From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: ip6tables no target CT
Date: Fri, 6 Sep 2013 20:18:22 +1000
Message-ID: <CAMD-=VK6oTYC==N2+EJPRYxgkovtwrU0hunMJ8eWdh-7fzCzMA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=owKBGmxcmo7ia+ru6xeWpCb0hyg1wdvu622YifZzOSw=;
        b=gj2GiOWivMuBEVJIP1jFT15VmwOj9Liq3U7kmktfSqiBgw3c5Ydz5UxpqCPydGSDyx
         9JWq/KX5WfiQ9Jjk9DYdlja4Z/TsrQLjSgxrza7iE10AJj8x2HkNRWaAV+iPVG9qKUZ1
         1XfTnDhhObR+8lwN1278Q93UR2TIldrDw66/GVqbR/JhDCqqLh9nWR9+2UGZFDlsxNyv
         iLy48joLTF6OHwMALzDW07fRAj6ZPP54X25cGAal5l0rLV9Yk6vSUSM9DVT94kcE3MS6
         w7S6rgclCnyLnywbSO29FLGUTvVMRYkj7dUUZKwdwSVb1NfiIqnb59A/afRdEuRlhs8o
         7IgA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter user mailing list <netfilter@vger.kernel.org>

HI,
 I still have this issue, I checked the kernel build, and everything
under ipv6 except ipv6nat is enabled, yet the CT target fails.

This same rule on ipv4 works
  iptables 1.4.20 on kernel 3.10.10

ip6tables -v -A PREROUTING -t raw -m multiport -p tcp --dports
6667,8888,16667 -j CT --helper irc

CT  tcp opt    in * out *  ::/0  -> ::/0   multiport dports
6667,8888,16667 CT helper irc
ip6tables: No chain/target/match by that name.

incase it was multi upsetting it, also tried

ip6tables -v -A PREROUTING -t raw -p tcp --dport 6667 -j CT --helper irc
CT  tcp opt    in * out *  ::/0  -> ::/0   tcp dpt:6667 CT helper irc
ip6tables: No chain/target/match by that name.

any suggestions?
