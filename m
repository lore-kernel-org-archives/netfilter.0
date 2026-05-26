Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1553B2FF2
	for <netfilter@vger.kernel.org>; Tue, 26 May 2026 03:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767881; cv=none; b=UWJPq4MoYJjKxG3v7/MdWdPmPpP0C2+G7l3AdxhjDInkN33Ajmc7tNNWL+TTx3ELGBZCkVRkqq+cfpPcqHAzRV2clNLRqDOrWvIDomp6HvHxgh8z02/h5hWUDUMUvQVBWGg7KdRTL/kAHAbOH3JzjRfLkJ9I9b3rUdj3avVXDFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767881; c=relaxed/simple;
	bh=k2RJN2vsDYaulSTAz/8uNFK7JJ+D40fjGtgu7gmYmWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ot0TKfd2ywEjrunHEQ0X9OvDjaIM7OKMoGZYjA9FsnT0RJQ9VoHTROInIdItOBOoDqrzJYdjlPKbns3iBJdxl5iShYP20ernPuP9PFH0lYiwZVW7T6gejYsUYdyN+DgV5tQun0lG6Axaza5wpBFnyn0DYFSyJrV1eYvXBnna5qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC5Jttd3; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC5Jttd3"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cac189e516so57491436d6.2
        for <netfilter@vger.kernel.org>; Mon, 25 May 2026 20:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779767877; x=1780372677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zI0Orm1aZ2hutYK6WtttPlYR9+szr4UeRFDlWy1ys9o=;
        b=AC5Jttd3jxYNIYPeF+rSv0okXdVASPBQ0ZT5zuxMQPJ9ZjDYf2NTX7CVyRf8W7GAZI
         euajP3XyoHHQp9zZX+VUVHGWD4v/II1YD9p/+bFmFPoveOQj1Jw9eCpSGCjwgi0zzc3F
         EsPFC+ejZ9a00SMTAjydk8MyVbeC0vLYOzKwRmENsJ26oynCAW0VYGvCm2MuxU7ri8aM
         IWrqlQSZJD8wHRoIPRQS3g3LzsBF46hLCwxk7ToYGW7c4tDE7ZCjxFwgDngkY8KTtQvi
         dIBDY4MuOz61BGvjPzFe+WQ0Tk9eIU0QJNcjkEF4wvOt6GxBkzl8LdiM89RxWAsnbcIX
         gpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779767877; x=1780372677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zI0Orm1aZ2hutYK6WtttPlYR9+szr4UeRFDlWy1ys9o=;
        b=FjOIuh+hg04Bco3GcSUKRVo6G1OceifnbOVBL1GiW1AUmakAqzYkFuTc2qJBd7AOxz
         I6Y54nGkReY/dR8t9k4KIoi0uxKi421Hy957F+Yna0qmc8Iw84Wc7GW06sg+MnJ5yCOH
         wEA1GXB4TFagj30u2VrBLWH9WcU3haIdmCujWXSGKzyOkblZFyx2jpq37TCCWz6eRgLr
         sgdwnRIlXDSw3idSNDzcsmqqkN+iBoCkFxlEZQq4eKXSzqCbt5tN5xqYbmJKyHw86i8x
         JRtiV8MC2ESd4770KyLJfWhEkIDRTDD5xMDAP7PWiqjjM1Mo90MsSG6awyWp62ebKb+r
         sivA==
X-Forwarded-Encrypted: i=1; AFNElJ+8Sg+CSeuczvq3VILhVlppgjh/1u2HuousPViDbg+Q4BqY2WTq62M0SpuJv86tqRqvJtVpNi3LWDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIrpfWZI2lUGidHJT8cnu5uqPYUPVKj4eb9KPN89ez8WTDGh6
	hIUS/OdMNsUDJ8hY4qhguLc+eQn/yE8JRn0nkeDIKDyR336q4BONtR31
X-Gm-Gg: Acq92OEvPNdWzVFeR4bXgoG73d2Tef47I78+TfPPuOARRApKGx4IwoCmRUhKJ/DfvX/
	aescNvOhdjYKsNhLPFs5TfD6Rrrj3E3zewj5Exz76v8zWhs3C3yHys/mMOCSM++fSvYAxOydKB+
	QigfgpBzdUzl5GMzKRU38/2IqnskEweLu9WKghE7DDNFL2uJmP9SZFHUyWYEsI3dHJLPvd+3+Ke
	b7sqk8MZbwpmFHe3Cc6Mn0e6eTBL2kn4VEGWkPPQDBBn/HPbgP8qr3EKmBSicYd/qRc6AZymfmV
	xz4srlUn2E8/JD/D36msCoXSzAvx7MGs8Z+M4qhq1eb683LscJWhd16F5McyoeOnm2qa5weEMo6
	qMYSlW91eaDX6IkWhz+5zMp9l4PV4Yg1q99WJQNEBXaH0ezlAWVtZWa36uaZOqqUoMfCAc9136p
	6HfYDrUemV6Mc2stbDmL3Ftf3fuug=
X-Received: by 2002:a05:6214:410b:b0:8ae:6460:c550 with SMTP id 6a1803df08f44-8cc7b5cf73dmr295213056d6.36.1779767877154;
        Mon, 25 May 2026 20:57:57 -0700 (PDT)
Received: from playground ([204.111.226.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc812df29esm130884796d6.29.2026.05.25.20.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 20:57:57 -0700 (PDT)
Date: Mon, 25 May 2026 23:57:54 -0400
From: <imnozi@gmail.com>
To: "Kerin Millar" <kfm@plushkava.net>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org
Subject: Re: ipset not completely working in mangle:PREROUTING
Message-ID: <20260525235754.4943a2b6@playground>
In-Reply-To: <a276ecef-e609-4d55-bc71-ddb9c9ff2f3c@app.fastmail.com>
References: <20260525205736.1c76666f@playground>
	<a276ecef-e609-4d55-bc71-ddb9c9ff2f3c@app.fastmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 May 2026 02:57:38 +0100
"Kerin Millar" <kfm@plushkava.net> wrote:

> On Tue, 26 May 2026, at 1:57 AM, imnozi@gmail.com wrote:
> > iptables v1.8.7 (legacy)
> > ipset v6.34, protocol version: 6
> >
> > I have four sets:
> >   - blockSetHost (hash:ip)
> >   - blockSetNet (hash:net)
> >   - whiteSetHost (hash:ip)
> >   - whiteSetNet (hash:net)
> >
> > I added rules to match the block sets in filter to INPUT, FORWARD and 
> > OUTPUT. The rules match and jump to chain blDrop. In blDrop, if either 
> > white set matches, control returns. If no match, the packet is dropped.
> >
> > This works well in filter. But there's one artifact. The blocked 
> > packets are 'accounted' to the internal server where they would have 
> > gone.  
> 
> The meaning of this isn't altogether clear. I presume that you are referring to counters in some capacity.

'In some capacity', yes; setting connmarks to identify types of traffic, then using those marks and '-j ACCOUNT' with specific tnames lets us have a nice CGI page with bar meters that cleanly displays various traffic levels, and other 'reports'.

> 
> >
> > To fix this, I added the rules below to mangle. Here in mangle, the 
> > white sets never match and all of the packets (that matched the block 
> > sets) are dropped.  
> 
> Be sure that you need to match on the NEW state. Otherwise, -t raw -A PREROUTING makes for a less expensive way of dropping ingress packets at the border.

I've been matching only NEW packets, letting ESTABLISHED conns close themselves. Later I might add rules to catch ESTABLISHED packets that match the block list but not the white list, then hit TCP packets with tcp-reset and all others (blocked) with icmp-admin-prohibited. (This method does work well to shut down conns instantly: "None shall pass.")

> 
> >
> > Is this another instance of 'it doesn't work in mangle or in PREROUTING'?  
> 
> This is unlikely. Both -m set and -m state work in the same way across tables, though the raw table precludes matching on conntrack state.

OK. So ipset *should* work in mangle:PREROUTING. Can the same chain name be used simultaneously in multiple tables (though if not, the pre-defined chains shouldn't work)? I'll experiment some more; I'll even try specifying state NEW in blDrop even though only NEW packets get there. I've been blind to mistakes before.

> 
> >
> > Thanks,
> > Neal
> >
> > ----
> > The rules used in mangle; eth3 is internet:
> > -A blDrop -m set --match-set whiteSetNet src -j RETURN
> > -A blDrop -m set --match-set whiteSetHost src -j RETURN
> > -A blDrop -j DROP
> >
> > -A PREROUTING -i eth3 -p udp -m set --match-set blockSetHost src -m 
> > state --state NEW -j blDrop
> > -A PREROUTING -i eth3 -p tcp -m set --match-set blockSetHost src -m 
> > state --state NEW -j blDrop
> > -A PREROUTING -i eth3 -p udp -m set --match-set blockSetNet src -m 
> > state --state NEW -j blDrop
> > -A PREROUTING -i eth3 -p tcp -m set --match-set blockSetNet src -m 
> > state --state NEW -j blDrop  
> 
> An iptables-save -c dump would be preferable. These excerpts don't unambiguously qualify the containing table names. In particular, there is no way for the reader to determine whether the chain named "blDrop" in whatever table that may be is acting in the same way as the chain named "blDrop" that may still exist - or have once existed - in another table.
> 

Those four rules in mangle:PREROUTING are the only ones that send packets to mangle:blDrop which contains the same rules as filter:blDrop.

I logged into my external VPS and ssh'ed back; this worked. I exited that session, added that IP to both the white list and the block list and tried to SSH back again. Neither counter on the white list checks increased, but the DROP counter did increase and the SSH connection was blocked. I then removed those rules and the chain from mangle:PREROUTING and did the same again, this time watching the counters in filter:blDrop. This time one of the white list counters did increase and the connection went through. At first glance, it looks like the set match didn't work in mangle:blDrop.

Again, I'll experiment some more; maybe I missed a special incantation or chanted it at the wrong cadence. :)

If you want, I'll send you a complete 'iptables-save -c'; it's about 800 lines. Unless you want I should pare it down some more. 

Thanks,
Neal
