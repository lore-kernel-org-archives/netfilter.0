From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 ISP's network
Date: Wed, 15 Oct 2008 22:32:08 +0200
Message-ID: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=cCqTvNE5ZmUNWCiW8eq3iRm3XPenHQMBMzfWyn3ZENs=;
        b=Mh1kJNsMErZ0EzFlf4Kdy9mK3weU9eUq0eEFr9BNvyyAezpvv8zLtbDZFENdR8k1rN
         AKFM4jxovWv2qVMJHN1q+zq29YkXUjsjzAJ7aboKzdUG2w1L3D2sUzyZLSYtEq8y+gvo
         oFVQ1DznWFbml4VxfJWrO4uEWloOr5ur0+Ies=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I have an question network/iptables related. In my home network I am
planning to deploy ipv6 addressig, not because I do not ip addresses,
but only as training how to set up
all that. I read some manuals/books and less or more it is not so big
problem. On my home firewall/router I have Debian GNU/Linux with
iptables as firewall tool and it works fantastic :)
I am wondering does someone has experinece with translation from ipv6
---> ipv4, I mean I am going to set up my home computers to use IPv6
but still I have to push my iptables rules ( I know iptable supports
ipv6 ) and
my gateway to packages from ipv6 network prepare for ipv4 network ( my
ISP provider )
Any suggestio is welcome and thank you in advance.

Kind regards ,

Elvir Kuric
