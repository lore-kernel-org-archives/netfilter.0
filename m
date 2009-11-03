From: "JR" <jdnromao@gmail.com>
Subject: HTTP Access Blocked After iptables Update
Date: Tue, 3 Nov 2009 20:23:13 +0100
Message-ID: <9A16A4503EA74DCAAF2C8A53A0DBF60F@RomoPC>
Reply-To: "JR" <jdnromao@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:reply-to:from:to
         :subject:date:organization:mime-version:content-type
         :content-transfer-encoding:x-priority:x-msmail-priority:importance
         :x-mailer:x-mimeole;
        bh=DSc8zdpSn+Pa3h8hMjflGFYpnD3o5oPW+Cul5KzJSkg=;
        b=cimz5bLTgdQOFOn7OeBf+vZA/cjIUa5N3kvPSj/vW85PH36OaEmyMJYLg2tTgNMdYF
         QsFFLtdycKGQl8vU234j1BVGm7vnEb9APZ0+A5LZ558R3sFrB8KjZJcIIWrp8GoDxYHX
         +s3rDJ15gt6KVetOJOROqkO/dNcKhqcC7VygA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

Hello!

Today I updated various things in my production server, one of them was 
iptables (via yum)

I'm running CentOS 5.

1) After the update I was not able to access any site hosted on my server.

2) I try to stop iptables and than I gain access again.

3) Than I've started iptables and no access again.

4) I rebooted my server.

5) After the reboot I verify if iptables was active, it was and all my sites 
were accesible.

6) I've restarted iptables.

7) All sites went down again.

8) Rebooted my server and sites were accessible.

9) iptables was also running

Basically the problem is, if I restart iptables, I have to reboot my server 
because my sites become offline.

So, what can be the problem here? Any ideas?

Help is highly appreciated!!!!

Many thanks in advance.

