From: Andy Theuninck <gohanman@gmail.com>
Subject: Re: --iif argument unrecognized by iptables
Date: Mon, 26 Jan 2009 08:46:43 -0600
Message-ID: <f8a02f3e0901260646p3791088dmb591400469cc2454@mail.gmail.com>
References: <f8a02f3e0901251559q6324e3faqc75af6d16eba8038@mail.gmail.com>
	 <497D88FA.2060005@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=l30zBRlcmmZsT0gwcw6ZFZV2w59MpEvWIUm3al5UO2w=;
        b=MFcsSl+njdtC+j6riw9jUUDaqE384kT7h+ojpgD3SngVkR0PM5wUAf1FXX36gnBtFI
         HvVxG2x5dGUTqCYlm9KuF59qVq8fP71Kbvw8FaLSt9iH6IH3Qb3GvP16di8UK9jibj4+
         VQnmqR/fr/Kelv6sNz9CppAinRxeLOrYQunuw=
In-Reply-To: <497D88FA.2060005@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

iptables -j ROUTE -h gives identical output to iptables -h.

Thanks for the tip though. Apparently ROUTE isn't going to solve my
problem anyway.

On Mon, Jan 26, 2009 at 3:57 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Andy Theuninck a =E9crit :
>>
>> # iptables -t mangle -A INPUT -d 192.168.1.2 -s !
>> 192.168.1.0/255.255.255.0 -p udp --dport 500 -j ROUTE --iif eth0:1
>> iptables v1.3.5: Unknown arg `--iif'
>> Try `iptables -h' or 'iptables --help' for more information.
>
> Maybe your iptables was build without the ROUTE support. What is the =
output
> of :
>
> iptables -j ROUTE -h
>
> Unrelated to the error message, eth0:0 is not an interface name but a=
n IP
> alias label. Iptables rules require interface names such as eth0, not
> aliases.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
