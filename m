From: Gadre Nayan <gadrenayan@gmail.com>
Subject: Ipset Match equal function
Date: Thu, 25 Feb 2016 15:23:59 +0530
Message-ID: <CAKJ7aR4efzGpDWwV+CKabbd9VaVLvOaMx43FFYQSWW5G_YQLFQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=b4y6aI6NXKGQkzGkORCCXp7aUMTrrgL9I3TB0bhxSNI=;
        b=x1pQaUz1EFlp+ojMFKoX7C1Retkm1ozQeqfqOzPMFylX818rN3xechVf6RXCoR+Jtj
         JoTvfI9S1IqucEXu2C691ayqRNCeGg7gD+GIj927Qn0nwhfvXcAP+ZXGHIFq+mXPfsFV
         ooZW/enAAcYj+N6swUHUNI5HQl+2qbDmogPVQlyHxH7fvHwNfy+XNCszELz5D3nhqWtT
         Pf19uUZIvddvmTblSc9oSjdnUiig1GWtR8TOahfFUizEU9waBKVKpTe1OwqFFGHUI8E3
         tmA8Wxu/5LT0F9mTgn21KAeDchDD1SL1FD3Qm+k+5GaybpOgAzdBYTXxuQtVUQysAAi7
         V5Zg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear All,

So in my quest for understanding IPSETs I have traced the registration
to ADT functions from the Userland Netlink.

How are the Common functions registered, How are they called.
They must be called from the IPTABLES code, since I add my rule with a
-set --match-set option attaching my Ipset.

So where is IPSET common functions getting attached to IPTABLES ?

 49 /* Common functions */
 50
 51 static inline bool
 52 hash_ip4_data_equal(const struct hash_ip4_elem *e1,
 53                     const struct hash_ip4_elem *e2,
 54                     u32 *multi)
 55 {
 56         return e1->ip == e2->ip;
 57 }
 58
 59 static bool
 60 hash_ip4_data_list(struct sk_buff *skb, const struct hash_ip4_elem *e)
 61 {
 62         if (nla_put_ipaddr4(skb, IPSET_ATTR_IP, e->ip))
 63                 goto nla_put_failure;
 64         return false;
 65
 66 nla_put_failure:
 67         return true;
 68 }
 69
 70 static inline void
 71 hash_ip4_data_next(struct hash_ip4_elem *next, const struct
hash_ip4_elem *e)
 72 {
 73         next->ip = e->ip;
 74 }

Thanks and regards
Gadre Nayan Anand
