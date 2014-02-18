From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: log iptables
Date: Tue, 18 Feb 2014 14:24:50 -0500
Message-ID: <CAHEKYV6GN6=aW2V9T0vdtwSsihByMOa=AxOeMXdZu9fFyFDdvw@mail.gmail.com>
References: <469712C03B2D4FC2AF14F1DB8A789247@asistp.com>
	<CAHEKYV77HjarvFKzZosMutq5GCyB-orZGU8sopzvgZM7bYpfaw@mail.gmail.com>
	<5E35AAC666964D0A977C79F5315ED5DB@asistp.com>
	<CAHEKYV6r+crMVMLu2h=b0cPTjvkZwgJmedy9NZqMuC0XV=5XUg@mail.gmail.com>
	<D26AD5BB2F7E497C8A41BFEF9BB3C23E@asistp.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=HV6FS267pH9lLYiIT4PghNHvHKiJWUntX/3S9qDe1VM=;
        b=dQJOkl60Y6PKywTQ4wz702YVdToxqF98/g5ZL/afVOSHAKOHo7eVhRgk/MsUIwoNAh
         K716skBc/yBh7jo2YUMopfPduXGoXON6NUVSzL0yfObiDPnJyJ4/ZtDsyPjbZbteTak1
         Ct6ptAnamtKz9B5pwjX8YyNus66SGDGM9aIlscb4Q/lCOyUvhzPPDUtvIbqUvDoIfA5Q
         fjeEWnFiSVUNRY2eqE+FU5yTgfqGEzi54lYwpE67fDi7df3xgONU/sAaQDqhOScut9vO
         oBpdnbEHwC/wGDVKBRvn4cEUu3yOEV9oAPIqPDi9qWzN0XyzgA3+QESU8WZBDiXchEjE
         XTow==
In-Reply-To: <D26AD5BB2F7E497C8A41BFEF9BB3C23E@asistp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter <netfilter@vger.kernel.org>

On Tue, Feb 18, 2014 at 2:16 PM, Daniel Lopez <daniel.lopez@asistp.com> wrote:
> The http server (8181) log if saved:
>
>
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d $INTERNET_IP
> --dport 8181 -j DNAT --to-destination 192.168.2.26
> $IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d 192.168.2.26
> --dport 8181 -j LOG --log-prefix "IPT HTTP 8181:"
>
> $IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d 192.168.2.26
> --dport 8181 -j allowed
> $IPTABLES -A FORWARD -p TCP --sport 8181 -s 192.168.2.26 -i $LAN_IFACE -o
> $INTERNET_IFACE -j ACCEPT
>
> The https server (443) log not saved:
>
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d $INTERNET_IP
> --dport 443 -j DNAT --to-destination 192.168.2.30
> $IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d 192.168.2.30
> --dport 443 -j LOG --log-prefix "IPT HTTPS 443:"
> $IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d 192.168.2.30
> --dport 443 -j allowed
> $IPTABLES -A FORWARD -p TCP --sport 443 -s 192.168.2.30 -i $LAN_IFACE -o
> $INTERNET_IFACE -j ACCEPT
>
> Packets arrive correctly because I can connect to both servers.
>
> The contents of my configuration files is:
>
> #cat /etc/rsyslog.d/iptables.conf
> :msg, contains, "IPT " -/var/log/iptables.log
> & ~
>
> #cat /var/log/iptables.log
> Feb 18 12:32:46 fw0 kernel: IPT HTTP 8181:IN=eth4 OUT=eth1
> SRC=10.128.126.138 DST=192.168.2.26 LEN=40 TOS=0x00 PREC=0x00 TTL=108
> ID=4248 PROTO=TCP SPT=6868 DPT=8181 WINDOW=0 RES=0x00 RST URGP=0
> Feb 18 13:38:18 fw0 kernel: IPT HTTP 8181:IN=eth4 OUT=eth1 SRC=34.97.192.148
> DST=192.168.2.26 LEN=60 TOS=0x00 PREC=0x00 TTL=53 ID=9815 DF PROTO=TCP
> SPT=3624 DPT=8181 WINDOW=5840 RES=0x00 SYN URGP=0
>
> I think the problem originates with the HTTPS connection, then in addition
> to saving LOG TCP connections, what else should I keep?
> HTTPS packets arrive at the server itself because I can connect with.
>
      Er, I just picked one of the rules and showed you what I meant.
The idea is that you would then see what was going on and then try it
out on the rest on your own.

>
> ----- Original Message ----- From: Mauricio Tavares
> To: Netfilter
> Sent: Monday, February 17, 2014 5:22 PM
> Subject: Re: log iptables
>
>
> On Mon, Feb 17, 2014 at 4:41 PM, Daniel Lopez <daniel.lopez@asistp.com>
> wrote:
> I do not understand what you mean, can you please correct my iptables lines
> to know where is the mistake.
>
> I have a feeling instead of
>
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d $INTERNET_IP
> --dport 8181 -j DNAT --to-destination 192.168.2.26
> $IPTABLES -A FORWARD -p TCP -i $INTERNET_IFACE -o $LAN_IFACE -d 192.168.2.26
> --dport 8181 -j LOG --log-prefix "Port 8181:"
>
> What you wanted is
>
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d $INTERNET_IP
> --dport 8181 -j DNAT --to-destination 192.168.2.26
> $IPTABLES -t nat -A PREROUTING -p TCP -i $INTERNET_IFACE -d $INTERNET_IP
> --dport 8181 -j LOG --log-prefix "Port 8181:"
>
> Do you see what I did?
>
> Thanks
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
