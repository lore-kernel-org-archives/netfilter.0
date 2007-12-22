From: "Slagter, EM" <eslagter@wlz.nl>
Subject: Re: Possible bug ipsec and SNAT?
Date: Sat, 22 Dec 2007 11:49:51 +0100
Message-ID: <476CEBCF.1030406@wlz.nl>
References: <476903B4.8060303@wlz.nl> <47692E3D.7090008@trash.net> <476A494C.1050606@wlz.nl> <476CBED2.8050808@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=wlz.nl; h=message-id:date:
	from:mime-version:to:cc:subject:references:in-reply-to:
	content-type:content-transfer-encoding; q=dns/txt; s=2007072701;
	bh=an8a4YBngEAu6wGeQ3X0i+uv6KQ=; b=oDZjHSV+NMdjp5bOZtPcV0KvK6j9t
	eZXEklfpdzck2JxeWbph1dhcqYDINwhe0ZJTVHjij86oeZL99KuejR1nH+jfGvsa
	Jt6rRWNs9SfNrVOBIZPkaYoK7tAvxhxRpNn2ouCgK8Sh52/+ixV7jTo5iql4KYVz
	z5nlkgz+ok/qls=
In-Reply-To: <476CBED2.8050808@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

> Does this rule apply in the direction you do SNAT or to reply packets?
> Please post the rules including IP addresses.

After a lot more testing and tweaking it seems to be a bug in Open/SWAN
in combination with the 2.6 ipsec kernel implementation. If I create TWO
connections in /etc/ipsec.conf, one with the original source address AND
one with the SNATted source address, everything works as expected. So
apparently the bug is not in netfilter :-/

With ipsec configured as stated, it works with SNAT and DNAT like a
charm, correct, complete policy information is available in all rule
sections I use (filter-FORWARD, nat-PREROUTING and nat-POSTROUTING) :-)

Sorry for the fuzz.
