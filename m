From: Giuseppe Roberti <jnod@jnod.org>
Subject: Conntrack UDP timeout callback
Date: Thu, 29 Jan 2009 02:30:56 +0100
Message-ID: <498106D0.80701@jnod.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi lists.

Timeout of udp conntrack rule is fired only when no data from both
endpoint arrive within some time.

In some case is useful to have two timeout, one per peer, so that you
can tell conntrack to fire timeout when only one peer send nothing.

Someone have planned its implementation ?
If not, someone is interested in it  ?

Thanks.

-- 
Giuseppe Roberti
<jnod@jnod.org>

