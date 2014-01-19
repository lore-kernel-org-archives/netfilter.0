From: Nick Edwards <nick.z.edwards@gmail.com>
Subject: rate limits
Date: Sun, 19 Jan 2014 12:43:56 +1000
Message-ID: <CAMD-=VLUemcvn4GG6cP9SEyMP4O605s=ZK2-OGDUN=hYd2g9vQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=D3NBVPq7Dsx6sKhT+iBEm0ktkM7bNtJ6EwMwT2kPTJ8=;
        b=QedLS5BuHpzXMuuA8vjkTm1PjWnm7WOKD6Ndg6kMENZRPLFd/T+s3mv/Gkwqn9mBeg
         NswQORFdjZoLhwTi64kYeqA6iMcBPHAVTmqw5E35NdTlypKtHR07eopovuQTl498SS45
         v5h7EFF18gDWTHq6ZdX7+hfqkAqKR+SQAFv4vEoRv0zQjeYEJt48GlltNm8DReyXZ+js
         dJGf73K0ihoHuYGbqZtR6o48BY2iX8/B2pvudxCgECz6l4qdTvKeWqqDxiE14A+0a3r8
         LZAAFLQg8B2s+XPiC1k1+y8gjE0gOLcnMTeILn2Dwt2ntfdfeVB1KZZKgq0/NyPdaVQ4
         bmeA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter user mailing list <netfilter@vger.kernel.org>

Hi,
We have some rate limits on port 80 only, they work as intended
(almost) and we are happy with the outcome (almost)

So now, the " almost"'s

We obviously do not want to limit our lan, but our lan is affected..
I'm sure its an out of order rule, but here goes :->

/usr/sbin/iptables -F
/usr/sbin/ip6tables -F

/usr/sbin/iptables -X
/usr/sbin/ip6tables -X

/usr/sbin/iptables -P INPUT ACCEPT
/usr/sbin/iptables -P OUTPUT ACCEPT
/usr/sbin/iptables -P FORWARD DROP

/usr/sbin/ip6tables -P INPUT ACCEPT
/usr/sbin/ip6tables -P OUTPUT ACCEPT
/usr/sbin/ip6tables -P FORWARD DROP

/usr/sbin/iptables -A INPUT -i lo -j ACCEPT
/usr/sbin/ip6tables -A INPUT -i lo -j ACCEPT
/usr/sbin/ip6tables -A INPUT -s fe80::/10 -j ACCEPT
/usr/sbin/ip6tables -A INPUT -d ff00::/8 -j ACCEPT

/usr/sbin/iptables -A INPUT -s 199.x.x.x/22 -j ACCEPT
/usr/sbin/iptables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
/usr/sbin/ip6tables -A INPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

..some other rules for other ports...

/usr/sbin/iptables -I INPUT -p tcp --dport 80 -m state --state NEW -m
recent --set
/usr/sbin/iptables -I INPUT -p tcp --dport 80 -m state --state NEW -m
recent --update --seconds 5 --hitcount 2 -j DROP
/usr/sbin/iptables -A INPUT -p tcp --dport 80 -j ACCEPT

/usr/sbin/iptables -A INPUT -p tcp --dport 1:1023 -j DROP

We obviously dont want our 199.x.x.x/22  limited but it is, I thought
being before this rule, it would be immune, also, if we use localhost,
it too is limited, I guess its because we use -I which inserts at top
of rules, but if we used -A in the two recent rule lines we found it
didnt always work at all?

any suggestions?
Thanks
Nik
