From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 14:52:12 +0300
Message-ID: <4C21F56C.3070603@gmail.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=2H+DWMgC7E+NyVCIJePNd6UiqZ/cfDJYXIqUrsoJnKo=;
        b=KTX1HYtneAPi27SRoT3b5yUODRCsMhdiSoiWmcOq7Zc3tNasMKBVcjKQIzS1ixrX3v
         ZzntS8LDDUiUuLPhKqrC4ohegJiZmV9NpzF1m1YdbFBnFxOC1VBqt7y45Ahw4gPvrDNx
         dYVcbE5e2UBKUCmHaN4ZYCwF4Ji469s/NcMLE=
In-Reply-To: <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Effenberger <floeff@gmail.com>
Cc: netfilter@vger.kernel.org

On 22.06.2010 um 11:53 schreib Florian Effenberger:
> Hi Lars,
>
> Am 22.06.2010 um 21:16 schrieb Lars Nooden:
>
> the same Lars Nooden as from the OOo mailing lists? If so: It's a
> small world. ;-)

Yes.  Hello again.

>> The chain is a drop-through list of ip addresses that you have
>> decided are good.  Then make a rule or pair of rules to send tcp
>> traffic for port 993 and port 537 to that user-defined chain.
>
> If I run a script every 60 seconds per cron and add the hostname, it
> will automatically add all IPs returned by the DNS at that time.
> However, this changes randomly, and change time is not predictable.

As others mentioned, it is probably a round-robin algorithm for a small 
pool of ip addresses.  Google might even tell you which ones or you can 
keep polling.

Once you acquire a list of the allowed destination ip numbers, the 
hostnames probably don't need to get polled more frequently than the ttl 
for the main dns record.  If you work with the ip addresses, rather than 
the hostnames that need for look-up is minimized.

> If I add ten times the host and it resolves to the same IP, iptables
> doesn't recognize that, and I have 10 similar rules. Is there any
> check for duplicates possible?

AFAIK, not inherently in iptables itself, but if you make a separate 
chain, it is easier to work on it via grep and sort.   Use 'iptables 
-nL' or 'iptables-save' and send the output to grep, looking for the ip 
number in question, if it is not present, add it.   That's simple shell 
scripting.

/Lars


