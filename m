From: Weedy <weedy2887@gmail.com>
Subject: Re: Does the INVALID state filter block port (nmap) scans?
Date: Mon, 8 Feb 2010 16:37:54 -0500
Message-ID: <3fa630a21002081337sa8025e0g51e1c3ec099482eb@mail.gmail.com>
References: <ac5c74141002040341m12a9abeaj9533c77ade2edec8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=KlMogxflsfUuZiorjehsL4THrKdJWouRAu9i+xV7u3U=;
        b=vMs5Zw4UhAiG/57x2g40nSRXrPdHQzJY3xbql3pQOqkvVTJhYdXfndlsYgh/QxdWzZ
         ktEdJWlaflrut8/D0J7zjkX884w2OAv4imudHa8s5bRpV4P6I7EGuSQ5kNVQBdis6+Rr
         vDKrz0jElleFHr/GSdeTINtpgK0uI1aWglb60=
In-Reply-To: <ac5c74141002040341m12a9abeaj9533c77ade2edec8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: paddy joesoap <paddyjoesoap@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, Feb 4, 2010 at 6:41 AM, paddy joesoap <paddyjoesoap@gmail.com> =
wrote:
> Hi all,
>
> Does the INVALID state filter prevent port (nmap) scans?
>
> That is, would the following stateful rule:
>
> iptables -A INPUT -m state --state INVALID -j DROP
>
> do the same job as the following stateless rules?
>
> iptables -A INPUT -p tcp --tcp-flags SYN,ACK SYN,ACK -m =C2=A0-j DROP
> iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP
> iptables -A INPUT -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
> iptables -A INPUT -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
> iptables -A INPUT -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG -j DROP
> iptables -A INPUT -p tcp --tcp-flags FIN,RST FIN,RST -j DROP
> iptables -A INPUT -p tcp --tcp-flags ACK,FIN FIN -j DROP
> iptables -A INPUT -p tcp --tcp-flags ACK,PSH PSH -j DROP
> iptables -A INPUT -p tcp --tcp-flags ACK,URG URG -j DROP
> etc etc.
>

Did this guy ever get an answer?
