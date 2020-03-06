From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Re: Found extra tables in nft ruleset
Date: Fri, 6 Mar 2020 15:22:42 +0200
Message-ID: <06e0616d-1f87-5c2d-040b-4f9b58b9cd57@gmx.com>
References: <bd9702b2-0c75-96ba-24b8-b8ad05c50813@gmx.com>
 <20200306130800.GN979@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1583500963;
        bh=m6xCL8rrYxqFzPLrQoQ5w9bY4pS6NvbWuo1LPhpDh1o=;
        h=X-UI-Sender-Class:To:References:From:Subject:Date:In-Reply-To;
        b=BW7CU8GwuTeY4wqMsK/q0cQol/bAhOo1KiyPaphX8w/jW148LlQoVgXfwTR7Xczo2
         WO4YzmtQQVE2m62HazMavCM0EUF4PEAeRgvyFAQSW7DzVctulFoYNm6K53ahddjXlo
         xBK2cHGcfM02NFj41DHHYreRu7ElGgTE16SVLwRI=
In-Reply-To: <20200306130800.GN979@breakpoint.cc>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

[...]
> THey are not supposed to be there.
>
>> Is this an error on my part?  If so what?
>
> Run 'nft monitor' to figure out what adds them.

Thanks.

If I clear the ruleset and wait, while watching 'nft monitor' I get the
following.

# new generation 951 by process 4497 (nft)
add table ip filter
add chain ip filter INPUT { type filter hook input priority 0; policy
accept; }
add chain ip filter FORWARD { type filter hook forward priority 0;
policy accept; }
add chain ip filter OUTPUT { type filter hook output priority 0; policy
accept; }
# new generation 952 by process 4510 (iptables)
# new generation 953 by process 4510 (iptables)
add table ip6 filter
add chain ip6 filter INPUT { type filter hook input priority 0; policy
accept; }
add chain ip6 filter FORWARD { type filter hook forward priority 0;
policy accept; }
add chain ip6 filter OUTPUT { type filter hook output priority 0; policy
accept; }
# new generation 954 by process 4512 (ip6tables)
# new generation 955 by process 4512 (ip6tables)
# new generation 956 by process 4514 (iptables)
# new generation 957 by process 4514 (iptables)
# new generation 958 by process 4516 (ip6tables)
# new generation 959 by process 4516 (ip6tables)
... and so on ...

However, I can't seem to find anything obviously calling ip6tables, the
processes are quite short lived.  Then I search for ip6tables in a
script or (ugh) unit file, for example:

# grep -r ip6tables /lib/systemd/*
# grep -r ip6tables /etc/*

Both greps turn up nothing, but something is running and modifying
nftables frequently.  It's probably related to the distro so I will dig
into that, if the cause is not already known.

/Lars
