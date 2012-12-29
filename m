From: Born Without <blackhole@airpost.net>
Subject: Re: osf match, --ttl & --log options missing in iptables[-save] [-[L|S]]
Date: Sat, 29 Dec 2012 09:08:52 +0100
Message-ID: <50DEA514.4050006@airpost.net>
References: <50DBE9C9.8090500@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
	 bh=TdnwdCpVZEkTzmVCm9Nu2NC+sN8=; b=PLPzTnLbMFiklz5rPlvsCYkJR3rG
	sbEzpiruvAxzQQw0nKiffwbYYQdUpCkMD5mYaWVAuS3DM83nByGOv0eBDhADo1yw
	i4XsKRpupvIu8Js+IJ++KYNz8dw4nwx+QrO7RlqkzHqFpj0O6f8NRrtxPa7BrwU3
	/Q650AF/kXSEmJg=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=TdnwdCpVZEkTzmVCm9Nu2N
	C+sN8=; b=sh0aFRjhwSFcy+VsFmrIoQNNcMLsyiCFn7XkG9+Nmm75pmcbzMMAU6
	OkV51TDK11NPHjV5wZAphZ97gguvEyTRvKw04Ql5mRy0TfIS6WRzA/LbpbeL6TvY
	xleiY37xBerbNR84sKAljPX4kGL+k+6u6aGPAcqlAMPb9rg/XEVP8=
In-Reply-To: <50DBE9C9.8090500@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 27.12.2012 07:25, Born Without wrote:
> Hello list!
>
>
> # $IPTABLES -N FOO
> # $IPTABLES -A FOO -p tcp --dport 445 -m osf --genre Windows --ttl 1
> --log 1
> # $IPTABLES -S FOO
> -N FOO
> -A FOO -p tcp -m tcp --dport 445 -m osf --genre Windows
>
> kernel: 3.2.35
> iptables: 1.4.16.3
>
>
> iptables -[L|S] and iptables-save seem to miss the --ttl and --log options.
> Therefore on restore, those settings get omitted.
> Looks like a bug to me!? If so, should I report it to some bug-tracker
> or so?


Yet another things with osf, that I noticed:

(installed vanilla 3.7.1 kernel to test)

Using this test ruleset to collect probes to my firewalls external 
interface, which does not allow any NEW (ctstate) connection, then 
divide by windows and non windows hosts:

$IPSET create other_probers hash:ip
$IPSET create windows_probers hash:ip
$IPTABLES -N PROBERS
$IPTABLES -A PROBERS -m set --match-set windows_probers src -j RETURN
$IPTABLES -A PROBERS -m set --match-set other_probers src -j RETURN
$IPTABLES -A PROBERS -p tcp -m osf --genre Windows --ttl 1 -j SET 
--add-set windows_probers src
$IPTABLES -A PROBERS -p tcp -m osf --genre Windows --ttl 1 -j SET 
--add-set windows_probers src
$IPTABLES -A PROBERS -p tcp -m osf ! --genre Windows --ttl 1 -j SET 
--add-set other_probers src
$IPTABLES -I INPUT -i eth0 -p tcp -m conntrack --ctstate NEW -j PROBERS


The result is, that the two rules with the '--genre' and the negated '! 
--genre', always both match, though that should not be, of course.
The two sets always contain the same ip addresses.
So the negation is not working at all.

iptables -vS output:
-A PROBERS -m set --match-set windows_probers src -c 4 192 -j RETURN
-A PROBERS -m set --match-set other_probers src -c 0 0 -j RETURN
-A PROBERS -p tcp -m osf --genre Windows -c 4 192 -j SET --add-set 
windows_probers src
-A PROBERS -p tcp -m osf --genre ! Windows -c 4 192 -j SET --add-set 
other_probers src


The other thing is:

The man page says, it operates on SYN packets.
When I reduce the match using '-m tcp --syn', nothing gets matched by 
osf anymore.

Best regards
