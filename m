Received: from sphereful.sorra.shikadi.net (sphereful.sorra.shikadi.net [52.63.116.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F1219E8
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.63.116.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741432673; cv=none; b=buB45w01wLdWqynlrI+93KH5rUR3IALP+55S9IrHIo2C9Nf/NHo+5JvuMJKFdcL44W8FNWKpRZ5XcaqAIQAJZoTg77ge/qBlCB5TGOK5p6dZzcts7ZYX2yDzH4ZoGYy81YsLEaxgL46KIZPO97cp5dtfUxKcUz9KBb1aMHmMIZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741432673; c=relaxed/simple;
	bh=19V4EGOlYIoDhmH7mPdDlJLAa2Ttl3vRrN2M+BilsB0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SaOudnO36ZRNktTwZcpydN9DMsclwdc9LxlpgRYv5ctIgrrzu9ZjKiFl5sPM4zyffAqKRHUiTYp7OAr7g1fYypnlw/gWxSDu/Q4XE8RKOVGLlW+6jFrg2hvFuzvSfMw9J7zEMTWg45DLSccUNW/XTT9LiqU4zkqaXNf5lHEDJRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net; spf=pass smtp.mailfrom=shikadi.net; dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b=Oiy07Rus; arc=none smtp.client-ip=52.63.116.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shikadi.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shikadi.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shikadi.net header.i=@shikadi.net header.b="Oiy07Rus"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=shikadi.net
	; s=since20200425; h=MIME-Version:References:In-Reply-To:Message-ID:Subject:
	Cc:To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QpEl3lZ2G0K7zoRGxV2Vfvp3zRIuC7oUtgbxCbNnnKo=; b=Oiy07RusTsxbMfWUQc6pCZb7LJ
	lK+XiU/6RdtuGV+8Q/RRTwNkcPRemHv+KcWTcGJzfPNGY5EjasWGz4uWqizE7S/3tm91Epfhm2GS5
	4TXdsK3aWgoNsHNk3lGtywKCpSBNE1vyaZvhMUnP6fy/Fq24llWbRIC6H/PZAgWg5K1jDd22CAR7V
	1nNCorrSkZxm1ifPWpLiwa7aOgpwW1nR3Lvy6BNuumh8+gJWYL7A9yGQAiDq7msRuNMJJTQ6c64WU
	hb96k53SQU2SXAGW3vLUKcPC+wICBjNlFSsAw7Nn67J8/IeJJX1Ons3+hNyfsGf66rrtZngqwRu7s
	uzT7qwag==;
Received: by sphereful.sorra.shikadi.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <a.nielsen@shikadi.net>)
	id 1tqrgw-00074k-1Y;
	Sat, 08 Mar 2025 20:46:02 +1000
Date: Sat, 8 Mar 2025 20:45:59 +1000
From: Adam Nielsen <a.nielsen@shikadi.net>
To: Slavko <linux@slavino.sk>
Cc: netfilter@vger.kernel.org
Subject: Re: ulogd2, sqlite3 and negative TCP Seq numbers
Message-ID: <20250308204559.178294db@gnosticus>
In-Reply-To: <20250308111405.441477a1@bonifac.skk>
References: <20250308111405.441477a1@bonifac.skk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> Not all are logged as negative, i collet (and pair) all yet logged:
> 
>     LOGEMU         SQLITE3
>     3489577139 -> -805390157

If I run this in bash:

  $ echo $[0x100000000 - 3489577139]
  805390157

It gives me the same number you get in SQLite.  This means you are
taking a number that needs 32-bits, and storing it in a place that only
has 31 bits for storage.  It is probably a signed 32-bit integer, which
has 1 bit for sign and 31 bits for the number.

If you switch to unsigned 32-bit integers, or 64-bit integers, you
should be able to preserve your original figure.

A quick Google suggests SQLite does this automatically.

> I checked, that SQLite itself is not reason, i tried to cast 2605008384
> value to INT in sqlite3 shell tool and insert it into table without any
> problems (in memory DB):
> 
>     sqlite> SELECT CAST(2605008384 as INT);  
>     2605008384
> 
>     sqlite> CREATE TABLE test (val INT);
>     sqlite> INSERT INTO test VALUES (2605008384);
>     sqlite> SELECT * FROM test;  
>     2605008384

This means SQLite or your schema is not at fault, but rather whatever
is handling the number before generating the SQL is using integers that
are too small (or are incorrectly signed).

Possibly it is something calling printf() and passing %ld instead of
%lu for that field.

Cheers,
Adam.
