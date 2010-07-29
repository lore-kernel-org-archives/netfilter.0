From: "Elmar Stellnberger" <estellnb@gmail.com>
Subject: block network access for certain users/groups
Date: Thu, 29 Jul 2010 21:09:05 +0200
Message-ID: <op.vgmctfy22qajpl@imac.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:content-type:date:to:subject
         :mime-version:content-transfer-encoding:from:organization:message-id
         :user-agent;
        bh=DrGW/rcXe4mK5EmmQtoMW7zDzvVIlBCCqLpvsFc5je8=;
        b=Z94t2MRdBW6KxnC6ppgPBPLM8YVYosLMT6kpjT2mhZXUM98AZj7M++mrBMfBIdXa59
         YWU6aUSzBs7pq3RE5tKapj0aAPOBhSclpKrTYE2JZ5hHoSq2cLvQqyrif/yNyPYdo2iz
         cCEbYZWwKpHXg9AG6wVkhNtvmEgfMYBylOSGA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org



I need to block network access for certain users/groups, fully:

iptables -A mychain -m owner --gid-owner blockedusergroup -j DROP

...drops ping packages in the output chain but lets my user happily  
connect to localhost:631 or any other http address. In deed the rule above  
is therefore pretty useless.

I need to block ALL incoming and outgoing packages for a certain  
user/group.
At the moment there is only insufficient blocking for outgoing packages  
available.

What will I have to do to implement network access restrictions on a per  
user/group basis?
Logging such packages is already possible. Why is blocking them not?
Can anyone help me?

Elmar Stellnberger
