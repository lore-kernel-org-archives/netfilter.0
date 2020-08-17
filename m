From: Grant C <grant@gc9.org>
Subject: error using variable for network device name in 'hook ingress device
 $external_interface'
Date: Sun, 16 Aug 2020 17:23:38 -0700
Message-ID: <f05dedbd-3c4c-e31c-80ec-0383e7da1518@gc9.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gc9.org; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=0ngW5TW2EZbzmA6hifMP4y0lP5Tzjr/I6hBCBvcntck=;
        b=E6F8rY6L1a7CaA5/K56/FytcNBPloCEi9tm6pHUvK60PpyqrMKFSl2V4X6hWor4t8Q
         ZxJzeOZ6q5XZOuAjWIWSwpKuQsedx/s0ZEbcdZfM7CzwLp/7lhd274qhiUgCBb1Ll166
         chmG38k0WYrBwnqV4U4Dei2p8fFz8Wl8LFlIbxZMYEuo7ak0F9grQgxLb//zz7q8kCmZ
         XvJUkCjohMLfaFWMCI3j3cjuI9l4y3OZd7+dsMmWgF+uOPqgsJqaqkrpF9QqjotpIeli
         lvQLopoORdR5pwB2P6HSRlhc1Pelo6HKXbliaxDP33y2qHU59mQgwGBvIMy/tesfZzvK
         W90g==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Is there special syntax required to use a variable name instead of 
hard-coding the interface name in a declaration like the following?

chain blackhole {
   type filter hook ingress device $external_interface priority -500; 
policy accept

Error: syntax error, unexpected '$', expecting string or quoted string 
or string with a trailing asterisk
                 type filter hook ingress device $external_interface 
priority -500; policy accept

using the interface name directly instead of the variable works.

Trying the new syntax that allows using a list, 'ingress devices = { }' 
also fails when using a variable either inside an anonymous list, or as 
the name of a named list.


I am using nftables 9.3 from Debian Buster backports.



