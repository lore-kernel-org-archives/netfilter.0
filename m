Received: from river.fysh.org (river.fysh.org [87.98.248.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C721912CD8C
	for <netfilter@vger.kernel.org>; Mon, 15 Apr 2024 13:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.248.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713186491; cv=none; b=lsk9Y/urejprOz0b1y9ROnVYK/+wDNQpMVvGgxLMVbew8IjD3IzOL7wJSLaWxjDsxNQy0Men2HLD5EsLLuOYnuk9U07l2iqPjBfv3EFNeq2vKfD+ukr49MF9JGd49eOZTHyOpIVoIcszPxmRVL+4q3PlB9lBQtgResIMTfXpwaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713186491; c=relaxed/simple;
	bh=RZOSEPyotAJ2FsBChfHQOss7C2EJl+ppRiQciPgz/xU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMLkEJVgrvZH845c/gc64qWg+Dxz0nmEKtP8cqsqQfOA2SSCmmMEig+8AnyHmN9hfp5nMF9ROsTQ+VD3ix7dSZrJW9ra9D4O2/XOO2yofIeUQHgvqYuyaBKBJ4gSIwk655KmW8PJlHPSaZGEBqBHQV5LOzzmq2epqMrtMCmwSJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=miggy.org; spf=pass smtp.mailfrom=miggy.org; dkim=pass (1024-bit key) header.d=miggy.org header.i=@miggy.org header.b=cLNAIXKK; arc=none smtp.client-ip=87.98.248.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=miggy.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miggy.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miggy.org header.i=@miggy.org header.b="cLNAIXKK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=miggy.org;
	s=20170316; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ztILbzJYvIaFuMuGHNRnJA59YUySuGRGiitbiWX4F8Q=; b=cLNAIXKKbe0sIHhBm7SreuLIY9
	n1iZyiV+NXjC9o/TyxwUNZtGP8SLD/FWw+HmUqAl2MdPMtz/74ANkLwBP/hyEugp/Ny0XbkSMpByt
	tmWvSgE8J5L+wcyrVO6LOe3CbMiyLza+JmZJ6AvbjWq3G0qfxVDd+dgeEMKkafxnRjho=;
Received: from athan by river.fysh.org with local (Exim 4.96 #2 (Debian))
	id 1rwM40-00EjHO-2f
	for netfilter@vger.kernel.org;
	Mon, 15 Apr 2024 14:08:00 +0100
Date: Mon, 15 Apr 2024 14:08:00 +0100
From: Athanasius <netfilter.org@miggy.org>
To: netfilter@vger.kernel.org
Subject: Re: NFQUEUE usage and interaction with later chain rules
Message-ID: <Zh0msE4n8nuFYYS3@fysh.org>
Mail-Followup-To: netfilter@vger.kernel.org
References: <Zh0Y-j3NAbRmAi03@fysh.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh0Y-j3NAbRmAi03@fysh.org>
X-gpg-fingerprint: E218CE1D
X-gpg-key: http://www.fysh.org/~athan/gpg-key

On Mon, Apr 15, 2024 at 01:09:30PM +0100, Athanasius wrote:
>   1. The only practical verdicts the userspace helper can return are
>   ACCEPT or DROP.  Checking through some documentation, examples, and
>   kernel code I've come across 'STOLEN', 'QUEUE' and 'REPEAT', but I
>   cannot find any actual documentation on what these might achieve.
> 
>   2. There appears to be no way to have an NFQUEUE rule act in a manner
>   where the userspace verdict can cause subsequent rules in the chain to
>   be considered.

  Well, of course I had an epiphany after sending this.  I can make use
of packet marks to do what I want, together with a REPEAT verdict.

  1. Have the NFQUEUE rule check that the specific mark value is NOT
  set.

  2. On not-DROP the userspace helper sets the mark value and returns a
  verdict of REPEAT.  REPEAT sends the packet through the netfilter
  chains and rules again, at least the INPUT chain.  So now it doesn't
  match the NFQUEUE rule and evaluation continues after.

I'm being a little vague about 'REPEAT' there because I've still not
found any documentation telling me what it's *supposed* to do.  I had
already tried 'STOP' (going through the 'other' possible verdicts), and
couldn't discern what it was causing to (not) happen.

  For the interested, I'm actually doing this in Python, using the
`fnfqueue` module.  The `NetfilterQueue` module appeared to offer no way
to use a more 'custom' verdict, or even set that 'fail open' socket
option.
  I'm using `impacket` to decode the packets in order to extract the
source IP.  The relevant code ends up being:

```python
def process_fnfqueue_packet(pkt):
    payload = pkt.payload
    rip = ImpactDecoder.IPDecoder().decode(payload)
    src_ip = rip.get_ip_src()
    if ipcheck.check_ip(src_ip):
        logger.debug(f"{src_ip=} should be banned")
        pkt.drop()

    else:
        pkt.mark = 2
        pkt.verdict(fnfqueue.REPEAT, fnfqueue.MANGLE_MARK)

```

`pkt` is the packet as `fnfqueue` provides it.

`ImpactDecoder...` is from `impacket`.

`ipcheck.check_ip()` is my code doing the GeoIP lookup and returning
a boolean, `True` for 'should drop'.

  I'll try to remember to write up a web page detailing my findings in
the hope that it might then be found useful by others in the future.

  Oh and that 'fail open' option is still a little problematic.  Without
it, because the NFQUEUE rule will initially match, I would just DROP
packets if the NFQUEUE buffer filled.  With it I'll instead end up with
blind ACCEPT rather than any subsequent rules being evaluated.
  I assume there are architectural reasons why evaluation couldn't be
made to continue after the NFQUEUE rule (e.g. a verdict of
'NF_CONTINUE'), but it would sure be helpful if that was possible.

-- 
- Athanasius (he/him) = Athanasius(at)miggy.org / https://miggy.org/
                  GPG/PGP Key: https://miggy.org/gpg-key
	   "And it's me who is my enemy. Me who beats me up.
Me who makes the monsters. Me who strips my confidence." Paula Cole - ME
