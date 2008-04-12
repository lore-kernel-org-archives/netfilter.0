From: "Peter Boughton" <boughtonp@gmail.com>
Subject: simple connection bridging
Date: Sat, 12 Apr 2008 22:39:14 +0100
Message-ID: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=j2vDy6eMcxfw2bpwX4HsJNLNoKnaxbOBk7SSuV1TPCg=;
        b=VUit1r99nJdDwkztr9ch8KefJJTvrggAGsesIChR24VZZ1kW8H6hMbJYtK6RTZCQtPHGDRJu1Z9H6FqMdxbjW+KLDJfpX34Mlk29SI1DLR0d9dZLtgFb3/3zdcMjaTtZ51fr60+W6+hlKTHlU/zC9FpGtDxnABu8f5eY3SHjXOE=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.

I have a Linux machine sitting between two WinXP machines, and I'm
trying to figure out how to use iptables to allow the two WinXP
machines to communicate with each other as if directly connected (a
bridge?) whilst still allowing both machines to access the Linux one
directly.

ie:
1 = Linux ( eth3 192.168.1.1 , eth0 192.168.0.1 )
2 = WinXP notebook ( 192.168.1.2 )
3 = WinXP desktop ( 192.168.0.3 )

So both 2 and 3 can currently connect to 1, but 2 cannot connect to 3,
nor vica versa.


Is anyone here able to provide a simple example of how to do this?


Thanks,

Peter
