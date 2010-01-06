From: Anthony Ewell <amewell@verizon.net>
Subject: what should I use for "unassigned" ports?
Date: Wed, 06 Jan 2010 10:12:07 -0800
Message-ID: <4B44D277.3000801@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All,

A long time ago, I used

      unassgn=1024:65535

for my unassigned ports.  As in

      --sport $unassgn

Having taken a more recent look at "/etc/services", I
am finding zillions of service ports above 1024.

With that in mind, is there a better starting port
for my "unassigned" ports?

Many thanks,
-T


-- 
-------------------------
I Fish.  Therefore, I am.
-------------------------
