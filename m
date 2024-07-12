Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF413E41A
	for <netfilter@vger.kernel.org>; Fri, 12 Jul 2024 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720774552; cv=none; b=b79PRHGQedPGWIwj/psLUe8aYxuDJpAWB42crnzdv7RI7W97klj2NmSm86Snhz0L8qOH81L+VaHUrmDIdT3mYaFII3ysKWW7Tm1kT4BgiI5VJsMADkxfFEqltxyGLZgA4YMdBz7JKgAphla4C+gS4I/l2p+2V2BVidXnNCIlmxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720774552; c=relaxed/simple;
	bh=/29nmhTnI/oLlglxf2qMDrowoLbm9gpSVH0DLDzNzKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FO2DJYYi2roDr95iaviBmKuZiV3RbjjvIEPy1UAqkRalyIsB/7zRoOhKM6mWzAc2IarNIkVb8qfeCyoXyEEtkV387Nciw879xWdXvo2aEy0SFGPRn4Wb+mvsp0k/thqj49dR5mnSUYAXNEf8sy9rC6yIiNk1KMaKIQEnjgeauqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.94.2)
	(envelope-from <laforge@gnumonks.org>)
	id 1sSC45-001kjK-2U; Fri, 12 Jul 2024 10:55:41 +0200
Received: from laforge by localhost.localdomain with local (Exim 4.98-RC3)
	(envelope-from <laforge@gnumonks.org>)
	id 1sSBy2-0000000061g-0L0n;
	Fri, 12 Jul 2024 10:49:26 +0200
Date: Fri, 12 Jul 2024 10:49:26 +0200
From: Harald Welte <laforge@gnumonks.org>
To: Seetharaman <seetharamang17@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Regarding ulogd_output_SYSLOG.so
Message-ID: <ZpDuFmbSr3uXZdIs@nataraja>
References: <CAOWAF3y694=sQhW0oTtm8pKnbP=_mP02=cKcFk6pLUehjDrCyQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOWAF3y694=sQhW0oTtm8pKnbP=_mP02=cKcFk6pLUehjDrCyQ@mail.gmail.com>

Hi Steetharaman,

On Fri, Jul 12, 2024 at 12:02:02PM +0530, Seetharaman wrote:
>    I am trying to use ulogd in the openwrt system to send the logs captured
> using NFLOG to a remote syslog server.

I don't think this is something that is implemented. You'd have to run a local syslogd
which then forwards it to a remote machine.

Or, alternatively, you would need to implement an output plugin that implements the remote syslog
prtoocol (https://datatracker.ietf.org/doc/html/rfc5424).  Should be rather easy: Simply open a UDP
socket and then format the packets into strings and send it over said UDP socket.

> I am using below ulogd configuration:
> 
> [global]
> loglevel="5"
> logfile="/var/log/ulogd.log"
> plugin="/usr/lib/ulogd/ulogd_inppkt_NFLOG.so"
> plugin="/usr/lib/ulogd/ulogd_filter_IFINDEX.so"
> plugin="/usr/lib/ulogd/ulogd_filter_IP2STR.so"
> plugin="/usr/lib/ulogd/ulogd_filter_PRINTPKT.so"
> plugin="/usr/lib/ulogd/ulogd_output_SYSLOG.so"
> plugin="/usr/lib/ulogd/ulogd_raw2packet_BASE.so"
> stack="log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,sys1:SYSLOG"
> network="lan"
> [log1]
> group="1"


> *[sys1]*
> *host="10.0.0.1"*
> *port="514"*

where did you find the instructions that those config options are valid?  Did you see
any such example anywhere?

http://git.netfilter.org/ulogd2/tree/output/ulogd_output_SYSLOG.c#n48
clearly only registers the "facility" and "level" options, and nothing else.

> But the logs are being sent to the local syslog daemon instead of remote
> syslog daemon.

no surprise, as you're doing something the code clearly was not designed for, and which I don't believe
we ever claimed should work.

> Does ulogd_output_SYSLOG.so  really supports remote logging?

No. Why do you think it would? where did you find such information?

-- 
- Harald Welte <laforge@gnumonks.org>          https://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
