From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Select chain from set?
Date: Tue, 28 Apr 2009 11:21:11 +0200
Message-ID: <33be4bb30904280221x9156f26t43ddfff0f083925f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=0GO16MiTGJUZtct6v3U3DsxmzE3fBLvm6IiD2YTbdM8=;
        b=pTKj9C82csH7DxnCxOAwHt7NX491eR/tAZabD8eF0GiEFiR6bNKTbb5DvwP2evNlGI
         uxWGt5Md2IAfiCfL8wnzwZ/JMAb3vdrejD8g2nWpSA4kwjem1ms8ObeiT0YSHx3mRuXj
         LotJsvcUr0jlOnFcqHl/EhjJPBOgiBs8EwrC8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

is it possible to have iptables query a set of some sort to quickly
look up a chain to jump to for a specific packet?

For example the set would contain a mapping from ip-address ->
chain-name. Then the destination address is looked up in the set and
iptables would jump to the specified chain.

Is it possible, or how difficult would it be to implement something
like this? I'd imagine it would be implemented as a target, that would
have the ability to "redirect" to another target, which would be a
chain.


/Oskar
