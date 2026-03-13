Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB7E34B1AC
	for <netfilter@vger.kernel.org>; Fri, 13 Mar 2026 10:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399099; cv=pass; b=qjALsnOKQzTzzomU/mYRUuDfgypCRRZkCgcCHaYrAmJwhOAyh2MQytsRC01kx3nn7qH/ZnA9UbLXwOdDnb/Dwkvb0unF/6BHJJJv7E1SDIRYboceA+MiNSH5RAdRR89nzpdL97iHvIiUJjgYW3ORnZLiP83/oxtuGTK1rkeW3eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399099; c=relaxed/simple;
	bh=9QPBxCVRYut45Kpsk/zbIFBzIaSm6f0BkrZMAj5AvLM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=F3FUsfQ7bOlb8tng4UuTqtAH+/6Dnp6YqSo+wHk6N5+ZBrtZvXi44D7nd3SgOoU6YV3lLOIVyDaaox29VD2TY0YX8d3+9WPt1PfygC/7xgA3mWfqw+5JQtQFa1arVZOsb1ap/Ms3CrncvbYkPjVXtzNYHFGc/lsRCa9s7gDbxY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAyRBIXl; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAyRBIXl"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-509307e3854so27979461cf.1
        for <netfilter@vger.kernel.org>; Fri, 13 Mar 2026 03:51:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773399097; cv=none;
        d=google.com; s=arc-20240605;
        b=Lb9nq1zoQRQV2N41fSpFcAnTEVhwm2uPSF/JajvWh5NosPyWmshC3kcBW14Q6ywzip
         ivqJM6Azjglc4qByxr+UcHzLo9JddEsSx9cGeJRtct1AeG6Ye97mdXKzh0Bo6GxHelza
         htxS+z2gBuqkASrF2S/BUfbmjoc61TfNKHAi8vEH2ivcO3MWWCCbeKeEWPfiBb53sn/A
         37INfewN6fzZzjeV9FqZ4vyYuCX9ARUsNogfdbBXfACmPzCu2NBKkGrOtRcvi25+w3Cc
         oQY6y7Bphbwz8reFXf12p1QybKPdzSRRpaMezA/Xp7bH2Lh3n/MkDnZa/LgSxYwDh9X+
         f8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ajvH+38Oma20eYosixHL6LP45jqzLCs4lNskjPZSBl0=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=HNZJ18GeDT7WzohNatNm45Dj1ZG6XQqE0uBxqGqMqmlCRW+Z0dMh44YRiUktC5+GBd
         0TmGLZoWUKAU4gkHRNxvtg5X2vVuZ21HO5p8PCrxH20fQu6OlcYBPhsMaHhlYgY7i+Fb
         b4RzqdcaqYFQQBUwGuOJQ9a6OiNPC7yt5i1zw4Pkh2YzKIYNQzXiUk1H/8OcxxMX2dqX
         FFn0jRTnmcvwgX6b6CFftWlUnD29HoGfzgF9dIQqgz9o+FUP5PRqy5M7g0mUVHyDXgZC
         F3IxivLSIxL9vSSJdnCe8djmKW+zLwecvytAZrfduD/xbMTRM+tXQ9PlqhRY61+5YXgy
         qcKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773399097; x=1774003897; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ajvH+38Oma20eYosixHL6LP45jqzLCs4lNskjPZSBl0=;
        b=bAyRBIXly/+N9wsk3iOUSkdzSRYW0DDUCBSfNo5lIYj0KJGFKjhxxEzaO6yNe0k1bZ
         ubyFQK6AxAbMyi1V7/Ty4N8haOW7ugRKY2Zt8lEkYkeYUVxZ+26vj7YZO+IfrpiaaTeL
         oEqEMuXhlBDbY9opNE/V9qgHfzsNmJTBZxSG4xqd4F3qncG9iA4dUvkJQddCnb3CjHSw
         052DMaJqXZV/MIYW3phMR0Msk4o5/Ts94urTXdqPrt68Ef7dfvYvNRZ25LtS7nEgMYtS
         7aphkc9812+7dJbphNPWpAtr56/6+QRzD49ZLo5hfR7jYc+yp7l6i/87CJS4Gm8b5NrV
         BdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399097; x=1774003897;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajvH+38Oma20eYosixHL6LP45jqzLCs4lNskjPZSBl0=;
        b=OTaFtSLB2bsRr0NsLEi9ey0Z+bo8dcJeA+wfxT2UtKqPEZ+zWXkytMdAXMFecPsmV2
         iKmGSW13JIMbn5DG/EadX2wTp7AOalnO/5hlcdWmc6zPoJBlq+Md0dwMg8r63O2QWI1e
         PIa224VdTMBcrA3/QjidGTbcRuGP706qyDoIIBiIe8jQxPc0ZX+8EXPkGpQk72W7nkWT
         bE1b94EkY5vM564VtP/YFXuT+lZyywpZ6SZdZmFQ/6m4q6jRSdFseP6wL5w0faF7jMSa
         FPKddZIKQw4TEMbZ+0EP+mXvZK40mYhKXekQGzBe+3RYZNEBEi2ZvF0rjy8yTiclMVBf
         emoQ==
X-Gm-Message-State: AOJu0YzudnGdsNsJeWb1/yUsBrO31Bc7+Q/9RP585mV9BWp7eFTpbNoV
	BxfhP0cYr0wAb6YJ6MLlcQMubnl87KV2jlSwRqnWBKN48Bf7Y962HGPnYPhkvyEO5TecKcABcuw
	gfeROaFSw/3tZgSRBWcAkPAzggB6ePpW9sDJI
X-Gm-Gg: ATEYQzwc+it/VACDexPqvfrUvocwpR/5Xi/b6PTWKmf08QMTGETiprlL0CzDRW18b4g
	qdVvm0s6SNpv0GY6HJeEbHdZLzICvZupWbDXpnZygavQzTnD4W8KbHPJq1phrWwuIFcLgWlr0lL
	0J4zNVyoK0lNjxr9IVN9Gk74oHLpkFCZS/VEdOhzRKuSxkVNAR+s+h7u9dm+KyLfqbhruQ62w2L
	lxB+xd1g1/GhWWuOr4nBPRRbVc4CRuqIXY/4B/awj5Gos4KNExwMi5qegVXkJ9H4M6+YPyrPla/
	eN4Ei1iotWsdTGtojqZpM5fUcWL6ACIkF4T2Fbv3zXLuORRDMJOOy/9hGTbYxfnPu/A=
X-Received: by 2002:ac8:5f4d:0:b0:4ee:1dd0:5a50 with SMTP id
 d75a77b69052e-5095727bc3cmr38081671cf.17.1773399096859; Fri, 13 Mar 2026
 03:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathias Dufresne <mathias.dufresne@gmail.com>
Date: Fri, 13 Mar 2026 11:51:25 +0100
X-Gm-Features: AaiRm51RLR37d2GUABEtfEO-2hJ5ITOM0wHdwqoOGd2QJcsUkpuOak4G50u7Suk
Message-ID: <CABwLUps_jV54QpqN6PPQiqBUGpyAVbWT-Ht+FgxM21-UxjJ-Wg@mail.gmail.com>
Subject: [nftables] table netdev, chain ingress, too much interfaces?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Still playing around auto-generated firewalls rules, I have one
firewall with two interfaces accepting a chain while the other
firewall which has 13 interfaces refuses the very same chain in the
very same table.

Once this table is removed the whole configuration is working.

The full table is:
table netdev filter_4_all {
  chain LOG_INGRESS_TCP {
    counter packets 0 bytes 0 log prefix "DROP_INGRESS_TCP: " group 1
    counter packets 0 bytes 0 drop
  }
  chain ingress {
    type filter hook ingress priority -499 ;
    # ip fragments
    ip frag-off & 0x1fff != 0 counter drop
    # tcp XMAS
    tcp flags & (fin|psh|urg) == fin|psh|urg counter jump LOG_INGRESS_TCP
    # tcp NULL
    tcp flags & (fin|syn|rst|psh|ack|urg) == 0x0 counter jump LOG_INGRESS_TCP
    # tcp MSS
    tcp flags syn tcp option maxseg size 1-535 counter jump LOG_INGRESS_TCP
  }
}

and the error is:
nftables.conf:7:5-42: Error: Missing `device' in this chain definition
    type filter hook ingress priority -499 ;
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I also tried to "define" a variable using:
define all_interfaces = { eth_name01, eth_name02, ... }

using it with:
type filter hook ingress device $all_interfaces priority -499 ;

which results with:
Segmentation fault

And using a "set" declared into the table::
  set all_IFs {
    type ifname
    elements = {
       eth_name01,
       eth_name02,
       ...
       eth_name13
    }
  }

But using:
type filter hook ingress device @all_IFs priority -499 ;

results with:
nftables.conf:28:37-37: Error: syntax error, unexpected @, expecting
string or quoted string or string with a trailing asterisk or '$'
    type filter hook ingress device @all_IFs priority -499 ;
                                    ^
The "^" is pointing to the "@"...

I suppose the error is somewhere between my chair and my keyboard but
still, I can't find a workaround... Any help would be greatly
appreciated ; )

Best regards,
mathias
