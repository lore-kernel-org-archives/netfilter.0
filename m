From: Tytus Rogalewski <tytanick@gmail.com>
Subject: iptables slows tproxy SQUID with DNAT or REDIRECT
Date: Sat, 5 Jun 2010 21:37:38 +0200
Message-ID: <AANLkTiluaE-A4cstREWV7r57RyCGPjHEmkCe0EhhQOXa@mail.gmail.com>
References: <AANLkTimTq_Bf-hJ7DmRT8bo7zwDKo2rfm8zhGvMckJz7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=0MLTkGSmt5J1RLm+DP8F2I+jtXLtJ2BMbSCibPkdUTA=;
        b=CAMeIpHXLQYzgYzzm6X5oQj5WEpHztyS0Uh3d7xI2iT9+M/br6fWy8gt3cHWO/2BNE
         LLF+xlpgUMVryf5RLHCDL4ATq+6rSNoUg6yR8dvlKUhTp1K+7wk+Dp9gkIukkjRo1P4N
         Ou42XU4QMbnG4dMFrxUnmU06BskOebxmRKZr8=
In-Reply-To: <AANLkTimTq_Bf-hJ7DmRT8bo7zwDKo2rfm8zhGvMckJz7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

hello guys
i am having very strange problem with my SQUID and iptables.
It is for sure NOT A SQUID ISSUE (i've tested 6 different versions of
squid, 2.7.x , 3.0.x and 3.1.x - and =A0other people dont have this
issue)
In all versions there was one problem. When i use TRANSPARENCY mode
(so i redirect 80 port in iptables via DNAT or REDIRECT)
=A0 =A0 =A0 iptables -t nat -A PREROUTING -p tcp -s 192.168.0.2 ! -d
192.168.0.0/24 --dport 80 -j REDIRECT --to-port 8123 # Tytanick
=A0 =A0 =A0 iptables -t nat -A PREROUTING -p tcp -s 192.168.0.2 ! -d
192.168.0.0/24 --dport 80 -j DNAT --to 192.168.0.1:8123 # Tytanick
i am having problem that pages load SLOWLY - exacly few images load ver=
y slowly.
In all cases, my browser cache and squid cache was cleaned.
Just watch a movie that i made and you will see my problem clearly !

You can download zipped html and swf(movie) file from rapidshare: (you
can choose different resolutions)
http://rapidshare.com/files/395636925/iptables_squid_slow_1600.rar
http://rapidshare.com/files/395636761/iptables_squid_slow_1440.rar
http://rapidshare.com/files/395634867/iptables_squid_slow_1024.rar
http://rapidshare.com/files/395632385/iptables_squid_slow_800.rar

OR if you cant download from rapidshare, here are direct links to my
server (with SLOW UPLOAD 50 KB/s - so you will need to wait few mins
:P)
http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_1600.h=
tml
http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_1440.h=
tml
http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_1024.h=
tml
http://sky-link.net/temp/squid/squid_problem/iptables_squid_slow_800.ht=
ml

my kernel version: linux-2.6.34
iptables: 1.4.3.2
Linux Gentoo
3GHZ core2duo
4GB RAM


--
Z pozdrowieniami
Tytus Rogalewski
mail: tytanick{monkey}gmail.com
www.sky-link.net
gg: 210533
skype: tytanick
