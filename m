From: John Brendler <brendlerjg@gmail.com>
Subject: ipset nomatch generating kernel error: "directory not empty"
Date: Sun, 17 Feb 2013 17:21:19 -0500
Message-ID: <20130217172119.73e427f5@typhoon.localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:x-mailer:mime-version
         :content-type:content-transfer-encoding;
        bh=820XByeXU6Sa1ZAKw7BswtGD19P+OCMrkTVv4oTvkLE=;
        b=XeJCfUOK95O7VUEEUs3KtTxOgv7mj1AIRdXFv6Mxhza0LBkcCJQY6jDZh/QMRe/vFS
         9L2LYKZyW4DKbx/DAXmQwY/mJSc8PRI0WmD0HyPOOB8aNq4YW/iZZy2DIIN+BItFUXX4
         JZLI+oONkavTvekEgqNLCSjUQ2gC0cAPnhYYmlGwH6Fcu92PLLhYCueTRv4iUoRYJQDC
         FzCcIpScqI/bMXhVCdD5eSe/Kl5NiqDb5ViefHCBEPj5oP5oWujPPewZw5F2z6X6Jet6
         YHNWHX6dvrh7hkyTlWPUg8iIquChQh/qVB7gHlBITVIWe46tA0L4IIyL79FJ/GXjejrw
         /NLg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

When using 'ipset test' against a 'nomatch' entry in a 'net:hash' set,
I get a kernel error of "Directory not empty".

This is using linux-3.7.5 with ipset-6.16.

A quick demonstration may be clearer than a verbose description. This
shows creation of a net:hash ipset which works fine, except that'ipset
test' against a 'nomatch' entry results in an error.

What am I doing wrong?
------------------------------------------------------------------------
~ # ipset create tester hash:net

~ # ipset add tester 192.168.0.0/24

~ # ipset add tester 192.168.128.0/23

~ # ipset list tester
Name: tester
Type: hash:net
Revision: 2
Header: family inet hashsize 1024 maxelem 65536 
Size in memory: 8572
References: 0
Members:
192.168.0.0/24
192.168.128.0/23

~ # ipset test tester 192.168.129.1
192.168.129.1 is in set tester.

~ # ipset add tester 192.168.129.1 nomatch

~ # ipset list tester
Name: tester
Type: hash:net
Revision: 2
Header: family inet hashsize 1024 maxelem 65536 
Size in memory: 8604
References: 0
Members:
192.168.129.1 nomatch 
192.168.0.0/24
192.168.128.0/23

~ # ipset test tester 192.168.129.1
ipset v6.16: Kernel error received: Directory not empty

~ # ipset test tester 192.168.129.2
192.168.129.2 is in set tester.

~ # ipset test tester 10.100.200.1
10.100.200.1 is NOT in set tester.

~ # ipset test tester 192.168.129.1
ipset v6.16: Kernel error received: Directory not empty

~ # ipset test tester 192.168.129.1
192.168.129.1 is NOT in set tester.

~ # ipset add tester 192.168.129.1/32 nomatch

~ # ipset test tester 192.168.129.1
ipset v6.16: Kernel error received: Directory not empty

-------------------------------------------------------------
