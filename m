From: Yang Zhang <yanghatespam@gmail.com>
Subject: Process filtering
Date: Mon, 14 Sep 2009 12:38:26 -0700
Message-ID: <9066fa250909141238o6a81ef53s90b3f79e76ed4a7b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=E0tv7xzEPjO1c9gOIL9vVL+xvTF07yL3adn560Us+ZY=;
        b=L2TSQ69pWhRgehljXzrszv8KuD4CEwwHcH6aiFy2GBaTsl12yJKPRHCMypSsBjlzwr
         BN/42jO2+5Fg1Rpx+egv1bfMeoltPZMJc9zdRVkkViqwopdcuQ33iI9JcW11H8T2Z7KZ
         YW5NZdCgsZDY/4dXTKeKoS9YuOA2LLtu+c6yA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, is it possible to filter (local origin/destination) packets on
process or application? My understanding is that iptables doesn't do
this, but are there any other system facilities in Linux that make
this possible? Thanks in advance.
-- 
Yang Zhang
http://www.mit.edu/~y_z/
