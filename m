From: Julien Vehent <julien@linuxwall.info>
Subject: Re: Double stack IPv4&&IPv6 for a firewall
Date: Tue, 28 Aug 2012 07:43:46 -0400
Message-ID: <302695cac71d0e303f2bf2a0069bacb9@linuxwall.info>
References: <50375A06.6000808@cica.es>
 <1345818598.2977.265.camel@denise.theartistscloset.com>
 <alpine.LNX.2.01.1208241640240.16184@frira.zrqbmnf.qr>
 <CAPfcJatemcsT5PK+m8__xhB7gBRinAuq2wNX_g93CQrSmvtDhQ@mail.gmail.com>
 <alpine.LNX.2.01.1208250137290.30075@frira.zrqbmnf.qr>
 <CAPfcJaugwb5DboUYGAfEktHCDZX0KxdCWdS9CyAu3rh94P8inQ@mail.gmail.com>
 <CAPfcJas2Cz8VCDe+FG8oVVzmhVyq0=s7vKHhorFgPdM5jwLSdg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxwall.info;
	s=samchiel; t=1346154226;
	bh=E/lCgyZcHFqZ6xD3rnSs4USzwM17f9dpezPVkUp1um4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EmP4VfL1HKp8vYMfxSZ2kEdZBD3b4zxzJmWcdrhvX/UaNiDYfe4WBsWhV2nqo9R7b
	 6+BzPV9XkMgXaiyCP33KdW++woThmljaIIMWmztq5LjeT4EUkmkEaiqB6r46K1tR78
	 cN3XvFfcvRDChQ6ZlDgGFnhB9+H8KWLA/hASgwgE=
In-Reply-To: <CAPfcJas2Cz8VCDe+FG8oVVzmhVyq0=s7vKHhorFgPdM5jwLSdg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On 2012-08-28 04:55, Arturo Borrero wrote:
> Maybe the point would be to generate with Bash a iptables-restore
> ruleset to load to kernel, but not load the ruleset directly from
> Bash...
>
>

Correct. The syntax of iptables-restore is similar to the one of iptables, 
with the addition of the ordering that needs to be respected. Then, simply 
issue `iptables-restore < /path/to/ruleset`.

- Julien
