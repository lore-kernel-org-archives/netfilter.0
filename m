From: netfilterdomo.20.miller_2555@spamgourmet.com
Subject: Re: Simple question about ip range
Date: Mon, 29 Jun 2009 17:12:44 -0400
Message-ID: <1dd941090906291412t52b38544y5f9404c92d331d8c@mail.gmail.com>
References: <2464.89.180.68.200.1246306458.squirrel@webmail.decimal.pt>
	 <1dd941090906291405h3b40f821m3b01b2d420ffb990@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=MJ7MQHGB9+ri83uIOU7TaA1rLpFCpCFt+7OPc0w5x48=;
        b=pnv7Oot9yb88vWj8ZbRGu45J/wiPIiEeVjyBRYFA7dPv07BeNCfCKVKeK2Z8ulT1hA
         F68GF7nCtif9p/bFEY3YUsHyeUkk+/sAWF69QEujYemjnWtW4sdAuSxTebWoaDkFy+Xj
         mv6arcSNG+YKCzoyyIiR6qCDZTbjD00lcKB+8=
In-Reply-To: <1dd941090906291405h3b40f821m3b01b2d420ffb990@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Mon, Jun 29, 2009 at 5:05 PM,
<netfilterdomo.20.miller_2555@spamgourmet.com> wrote:
> On Mon, Jun 29, 2009 at 4:14 PM, Jorge Bastos<mysql.jorge@decimal.pt>=
 wrote:
>> Hi people,
>> Sorry about this super basic question, how do i specify a ip range? =
=46or
>> example for a rule like this:
>>
>> iptables -A INPUT -p tcp --dport 80 -s 192.168.1.211-219 -d 192.168.=
1.206
>> -j ACCEPT
>>
>> I just want to allow the ip's 192.168.1.211 till .219.
>> What would be the correct syntax?
>>
>> Jorge,
>
> Specify a bitmask (i.e. 192.168.1.211/28) Note: this does not strictl=
y
> limit hosts to the .211 to .219 range (the rule will allow .208
> through .223...masks require a base-2 host set, so 16 hosts best fit
> the number required 8 < 9 < 16). I'd recommend setting subranges to
> base-2 hosts as it avoids leaving holes in the IP address space
> (unless this is intentional). Otherwise, I think you're locked into
> individual specifications, but I'm not as smart as others on this
> list...
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>

Sorry - finally read the man page.. try this matching string:

-m iprange --src-range 192.168.1.211/32-192.168.1.219/32

