From: Karl Heiss <kheiss@gmail.com>
Subject: Adding features to xt_recent and xt_cluster
Date: Wed, 8 Jun 2011 10:57:09 -0400
Message-ID: <BANLkTi=os6R7oUa6B_snwKPtNAfQA=i4GQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=i98S0jXhKGmfZsF5dAgt1kcLU8I2BE5ZR62p2KxJ5QI=;
        b=Q3zw3AW0tGSAcFFlX0GHLs45X5EyKM4L+Y5GOVxySoDBxbbtnEbYTgclTP08W6v/Qt
         06SrFnZ+qv0zDwuTcRGUlIpCXy0OaSstoRQvpCFF+vvIQoX9cTb+vWhn0LwLxFVWvB2I
         Ib3M4nFZqv9gXfZFHNvvZvTabyncKbRXUbrBI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am looking into adding functionality to the xt_recent and xt_cluster
modules.  I would like to know if these changes would be something
that upstream would be interested in using.

For the xt_recent module, I will be updating the module to support
matching by destination IP, source-port and destination port.  Port
matching would be supported via the '--rsport' and '--rdport' flags,
and would default to the current behavior of matching IP only if
neither is specified.  Many might be wondering why I choose to include
matching by destination IP since it appears that xt_recent matches
destinations using --rdest.  However, xt_recent does not appear to
differentiate between source and destination addresses within it's
entry tables.  This means it never checks it's stored address against
skb->network_header->daddr during match.  See excerpt below from
net/netfilter/xt_recent.c:

static struct recent_entry *
recent_entry_lookup(const struct recent_table *table,
		    const union nf_inet_addr *addrp, u_int16_t family,
		    u_int8_t ttl)
{
	struct recent_entry *e;
	unsigned int h;

	if (family == NFPROTO_IPV4)
		h = recent_entry_hash4(addrp);
	else
		h = recent_entry_hash6(addrp);

	list_for_each_entry(e, &table->iphash[h], list)
		if (e->family == family &&
		    memcmp(&e->addr, addrp, sizeof(e->addr)) == 0 &&
		    (ttl == e->ttl || ttl == 0 || e->ttl == 0))
			return e;
	return NULL;
}


As for xt_cluster, I will be adding options for hashmode like those
offered by CLUSTERIP to allow matching based on sourceip,
sourceip-sourceport, or sourceip-sourceport-destport.  There is the
potential that I could add a fourth sourceip-destport option as well.

For both modules I am prepared to provide patches for both the kernel
and iptables userland after development is complete.   Any feedback is
greatly appreciated and please excuse any faux pas on my part as I am
new.

Karl Heiss
