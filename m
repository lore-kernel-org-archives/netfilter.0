From: Alessandro Vesely <vesely@tana.it>
Subject: Log lines from the CLI, was  [ANNOUNCE] conntrack-tools 1.0.0 released
Date: Mon, 07 Mar 2011 14:30:18 +0100
Message-ID: <4D74DDEA.5060207@tana.it>
References: <4D69B6BB.7020309@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1299504623; bh=hSmcZJJgBmu4yprJifCBU2Ab09JJiEFDWnhZg4bypHA=;
	l=790;
	h=Message-ID:Date:From:MIME-Version:To:CC:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=GdCXi5qxUwDUVuNnoWGdPOXgyxKGQ/amc7WjUV+OupGwSbTMOGIV9yY+VOnKg9Zyy
	 ddc9C4XnvY7HgeJArZrLIk3Md9Kw8umVd/np4MpIqg5hVyddRDVWWCcQ7oTZb0Sv8m
	 YO9QTplE0cZJ/zXy7aGKuoG0oSVLR5LHFhr4oXyY=
In-Reply-To: <4D69B6BB.7020309@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi!

On 27/Feb/11 03:28, Pablo Neira Ayuso wrote:
> - The command line interface (CLI) conntrack that provides an interface
> to add, delete and update flow entries, list current active flows in
> plain text/XML, current IPv4 NAT'ed flows, reset counters, and flush the
> complete connection tracking table among many other.

Although this is a command line tool, I guess it is mostly used in
scripts, or execv'ed by other command line utilities according to some
parameters, possibly non-interactively.  Thus, there is a usability
concern about its output.

I would like to see regular lines such as "NNN flow entries have been
deleted" at LOG_INFO, while something like "Operation failed: %s"
possibly deserves LOG_CRIT.  Would it be possible to use dlog in
conntrack.c?
