From: Giuseppe Roberti <jnod@jnod.org>
Subject: Conntrack UDP timeout callback
Date: Wed, 17 Dec 2008 18:23:23 +0100
Message-ID: <4949358B.6070903@jnod.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
i have noticed that timeout of udp conntrack rule is fired only when no
data from both endpoint arrive within some time; i want that timeout is
triggered when one of both endpoint send nothing.
Is it possible to set this option for some conntrack ?

Thank you.

-- 
Giuseppe Roberti
<jnod@jnod.org>
