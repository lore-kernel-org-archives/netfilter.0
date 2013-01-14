From: Born Without <blackhole@airpost.net>
Subject: Re: [mangle table] end rule
Date: Mon, 14 Jan 2013 21:58:34 +0100
Message-ID: <50F4717A.9010608@airpost.net>
References: <20130114214225.4a10201014b466ebf87eba94@lucassen.org>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=/JZ6nket0UJRNO1SOAixsZsbv4Y=; b=QJ43SE1ms+Sye+Zb74
	oRrbg9BrBaMUrD3pLMo8ZTBiM0EdRUMxxo9DzD2YsZvPp75E1h3KS9kKeaZTUvlc
	9hSo0kkiZ1csphf6wCwCiYTcdb2pyWSTnXXll+sUTkjYOj1BE/yofCXzfhnab44x
	f62gbs/WjYc1T7nJYk3Y5Au+A=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=/JZ6nket0UJRNO1SOAixsZ
	sbv4Y=; b=swooNmH7AoRBq91YEtbbGwjDGMkSzPmvRcPV40NvGFpYAzOfjvTW4G
	fjQegB7N3kqx1eXY51LyeQsQ85OGwixG97In7pQFcOW5mnOIj8tgg3Xhl8DanMsr
	hLoP90fD1eyTQLncciYl8KCOsDgBEXcWGnQotgDY5+nOoTjNLsT/4=
In-Reply-To: <20130114214225.4a10201014b466ebf87eba94@lucassen.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: richard lucassen <mailinglists@lucassen.org>

On 14.01.2013 21:42, richard lucassen wrote:
> I have these two rules in this order:
>
> iptables -t mangle -i eth0 -d 10.0.0.0/24 -j CONNMARK --set-mark 1
> iptables -t mangle -i eth0 -d 10.0.0.2 -j CONNMARK --set-mark 2
>
> This site
> http://www.linode.com/wiki/index.php/Netfilter_IPTables_Mini_Howto#mangle_Table
> says:
>
> <quote>
> It is important to notice when making rules that whichever rule matches
> first will be the target for the packet and no other rules will be
> checked.
> </quote>
>
> As far as I understand the English language, this means that a packet
> towards 10.0.0.2 will be marked "1" and not "2" as the first rule
> matches and thus the other rules will not be tested.
>
> But in practice, destination 10.0.0.2 will be marked with "2" in the
> order mentioned above. This is no what the site says.
>
> Question: is a mangle rule really an end rule as the site suggests? Or
> is this not true ("man iptables" says nothing about it AFAICS). Or is
> it true and do I have to report a bug?

That depends if the target is a "non-terminating target" or not.
i.e
MARK, CONNMARK, LOG  are non-terminating.
ACCEPT, DROP, RETURN are.

