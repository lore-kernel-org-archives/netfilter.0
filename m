From: Sergio Belkin <sebelk@gmail.com>
Subject: Failing to apply tc filter
Date: Wed, 23 Oct 2013 06:36:49 -0200
Message-ID: <CABZC=5w_nmdJ3zhhOqTiXUA8dTuyvzq_z3o012nvaZyFfKV79w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=Ce3xZheHlUZwvhxADmOPCcthkemQexP9l0yPFoTJdcI=;
        b=RLmfSxiU8hNbhoQdFiVh4R5lYVgaDlFWbrto+B1LCMdNkFoDJij2ifd9terRKLlXWV
         +A2aA7zDdDMOCCmTwd5DxhVY4ftrj/Smmvh4wyva2Kr7ULZB+S2Vd+anxuG/KmkQvobd
         nJF7QECLZOKx7ygqzUXOEpe6QaoofNFeZu5lJ4JA0P20kvKUfYY46wtwbeQvM6oQ2nE0
         kiruUbjRBf8qEy7U9gJ2qv0WroMGZTfxBnn4smkH3V/6EcNZxAzJ+IP99jlO+F7sC+6v
         +gYbP4lQvCIVdDkOFY5Fyms+LuAOCCUzy/5uPa/7GP+SM+DVdVhhiBBKUbHjNpWgr0jX
         48Sg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, I've run the example at ifb both con Centos and on Fedora with no success

tc filter add dev eth0 parent 1: protocol ip prio 10 u32  match ip src
192.168.200.200/32 flowid 1:2  action police rate 10kbit burst 90k
drop  action mirred egress mirror dev ifb0
Illegal "action"
bad action parsing
parse_action: bad value (12:police)!
Illegal "action"

Is it about a known bug? Any ideas?

Thanks in advance!!

-- 
--
Sergio Belkin  http://www.sergiobelkin.com
Watch More TV http://sebelk.blogspot.com
LPIC-2 Certified - http://www.lpi.org
