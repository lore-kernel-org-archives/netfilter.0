From: Daniel Drake <dsd@laptop.org>
Subject: filtering based on MAC address prefix
Date: Fri, 15 Jan 2010 13:44:36 -0600
Message-ID: <818423da1001151144m5d7b698dh2c7ed2a108a0489c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=60BcFNwu4tc4S7ks9rbM2vRWjIeokbLfK5L5UOrV5hg=;
        b=iAEDtqeEnq4s+qlCetmLCv4Jg7nQLmHILrFg8xQbQx6CP/4tBaGL05DYW9BgLrvUPJ
         5wbbEF68h6/9vViMxPpa19BsIBM4YjwrGEw9iBWFuK1yFnJxb3Wp3KxD/2Yz1Xrzuw0t
         giF4DTz/c2+wrNv68UV3qhYWN1tCX5PBNnTHE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm interested in setting up iptables filtering rules based on the OUI
(i.e. first 3 bytes) of the source MAC address. Is this possible?

I see that there is a "mac" match extension but it only seems to
operate with full 6-byte addresses. I also looked at the u32 extension
but that only seems to operate on the TCP header, not on the ethernet
header.

Any ideas/suggestions?

Thanks,
Daniel
