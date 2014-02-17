From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: log iptables
Date: Mon, 17 Feb 2014 17:22:39 -0500
Message-ID: <CAHEKYV6r+crMVMLu2h=b0cPTjvkZwgJmedy9NZqMuC0XV=5XUg@mail.gmail.com>
References: <469712C03B2D4FC2AF14F1DB8A789247@asistp.com>
	<CAHEKYV77HjarvFKzZosMutq5GCyB-orZGU8sopzvgZM7bYpfaw@mail.gmail.com>
	<5E35AAC666964D0A977C79F5315ED5DB@asistp.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=S187vVcmYK0CD2+WoY/OLX7ALi9nutVN0qG0us9bRuA=;
        b=BbhEvUjlv0xolppSu/4y6mRMHwirVsOslidcCxBUnRkXWy2q3mdpJLZamnR8vz6okE
         /csjR28kkFM9kl5nqvP6B6R0lhqiZbqK+gQYYV4oUoELhccFLzHAHBfTD+eWaAuqbERE
         qDRG78jJygqX1NpzgS5ottBCYjHCl+OYxKR/gGjEr6kDl+GHtvOQF/zSUX4VSHVeBnz6
         h7O62SJuNCdZPxBezn5FxCzuZAnrHmO/I2mW45HYPPe1g5Q75CJqbvzmVcSsq/uwE5AE
         EfWiZS7XcwJ4KUcNtgToUfK9syIR0VCBjxBjxZiIS3ZanxsPXgXjBYS0//MyXlyJL99o
         j69g==
In-Reply-To: <5E35AAC666964D0A977C79F5315ED5DB@asistp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@vger.kernel.org>

On Mon, Feb 17, 2014 at 4:41 PM, Daniel Lopez <daniel.lopez@asistp.com> wrote:
> I do not understand what you mean, can you please correct my iptables lines
> to know where is the mistake.
>
      I have a feeling instead of

$IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d
$INTERNET_IP --dport 8181 -j DNAT --to-destination 192.168.2.26
$IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d
192.168.2.26 --dport 8181 -j LOG --log-prefix "Port 8181:"

What you wanted is

$IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d
$INTERNET_IP --dport 8181 -j DNAT --to-destination 192.168.2.26
$IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d
$INTERNET_IP --dport 8181 -j LOG --log-prefix "Port 8181:"

Do you see what I did?


> Thanks
>
> ----- Original Message ----- From: Mauricio Tavares
> To: Netfilter
> Sent: Monday, February 17, 2014 3:54 PM
> Subject: Re: log iptables
>
>
>
> On Mon, Feb 17, 2014 at 3:20 PM, Daniel Lopez <daniel.lopez@asistp.com>
> wrote:
>>
>> Hello
>>
>> I want to save the log of iptables and for this I have set up the file
>> /etc/rsyslog.d/iptables.log :
>>
>> :msg, contains, "" -/var/log/iptables.log
>> & ~
>>
>> Packets arrive correctly because I can connect to the servers, but does
>> not
>> save the log of these lines :
>>
>> $IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d $INTERNET_IP
>> --dport 8181 -j DNAT --to-destination 192.168.2.26
>> $IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d
>> 192.168.2.26
>> --dport 8181 -j LOG --log-prefix "Port 8181:"
>> $IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d
>> 192.168.2.26
>> --dport 8181 -j allowed
>> $IPTABLES -A FORWARD -p TCP --sport 8181 -s 192.168.2.26 -i $LAN_IFACE -o
>> $INTERNET_IFACE -j ACCEPT
>>
>> But these lines if you save:
>>
>> $IPTABLES -A FORWARD -m limit --limit 3/minute --limit-burst 3 -j LOG
>> --log-level DEBUG --log-prefix "forward packet died:"
>>
>> Use:
>>
>> CentOS 6.3 64 Bits
>> iptables 1.4.7
>> rsyslogd 5.8.10
>>
>> Please could help correct my problem?
>>
>> Thank you,
>>
>     AFAIK, if you want to log a given rule, you either double that
> rule and instead of -j ACCEPT you put the -j LOG stuff or group the
> rules you want to log together, you have to put them into your own
> chain and tell it to log the entire chain.
>
> Or something like that
>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
