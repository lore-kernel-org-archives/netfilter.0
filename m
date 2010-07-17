From: Thomas Elsgaard <thomas.elsgaard@gmail.com>
Subject: How to do PAT based on source IP adress and port ?
Date: Sat, 17 Jul 2010 19:30:27 -0200
Message-ID: <AANLkTikEVBlk2beBQ0ZUg308udyaZ-_yWOQpvhRlZ6J7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=kPLO8q37vJkXER+rWl9Xwq6E7LTKSkkw44RgkWYhhxY=;
        b=ZtQGr0AMXupYgjAlrdTLrgl+g9l2W9510bwoo7sS9f1B2U3T7D5/S5+TQeZ5OqV0sA
         BTRHttrwrx2B8FUzQ1DdY5d7AF/mgu28ZOGV5Q70z5cX7TxpMSxaFL3BvR4/0eK64lSN
         IZ1OyMEMsg0WNtHUIvd+FFaV4obZ76FIq19Qs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

I am wondering how i can get iptables to do a PAT based on source IP address?

Traffic from 10.5.1.0/24 towards UDP port 69 should be mapped to port
20000 instead of port 69
Traffic from 10.5.2.0/24 towards UDP port 69 should be mapped to port
20001 instead of port 69

Is this possible with iptables?

Thomas
