From: Zachary Eadie <zeadie@hostgator.com>
Subject: ipt_iplimit.so
Date: Fri, 25 Apr 2008 15:12:49 -0500
Message-ID: <48123B41.1060901@hostgator.com>
Reply-To: zeadie@hostgator.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to establish a hard limit per ip without doing state 
checking, just for development.  I did a Google search for an old module 
in the ippersonality plugin found on koders.com, I was wondering, is 
there a more current module, or patch, or will this still even work, or 
is there something not too dissimilar from it to where we can set a hard 
limit for the maximum concurrent connections per-ip without using the -m 
limit/recent module, or would anyone just recommend the syn-limit?

Here are the links for reference:
http://www.koders.com/c/fid7BBD5FF5365A02D2561437989CBCD88C5C65C0B3.aspx
http://www.koders.com/c/fidC587D36BBA65E9C1A59D097A153CB42360D81CFB.aspx

Any help would be greatly appreciated, thanks!

-- 
Zachary A. Eadie
Level I Linux Admin
HostGator LLC


