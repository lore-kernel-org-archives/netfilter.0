From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: Re: Dynamic IP address in a rule?
Date: Sun, 26 Apr 2009 19:38:19 -0300
Message-ID: <3fdd6ce00904261538m20468fedudf11ffd6448c8473@mail.gmail.com>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
	 <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=cSDXeKTv0XtsocXtI+cNr+XmVKDbEp5Za82MS2XBEO0=;
        b=b10v6ZKRBQ3o5Y01MaeIbywCxcmqWDkuEb9ifkpXUwrnYYfvr04F6SaxDm3j3hFotL
         qWZ+cmz6emvMQUalYpKG3mVlyrZdn5J70BDFEjPFSo8EYOLe/FZujfhLqNcNIUmHRsC5
         JWNBwjL7YNF/KQjT2lZ8pYC3zFEtAGfceMwjM=
In-Reply-To: <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2009/4/26 Jorge Bastos <mysql.jorge@decimal.pt>
>
> > Hi,
> >
> > My IP is dynamically assigned and I want a rule like this one:
> >
> > iptables -I INPUT 1 -d my_ip_address =A0-m state --state NEW -j ULO=
G
> >
> > Can a rule work out the IP address of its host?
>
> That's a nice question, instead of the dynamic IP on the rule, having=
 a
> dynamic host on it like:
>
> Iptables -I INPUT -I eth0 -d myhost.dyndns.org -p tcp --dport 80 -j A=
CCEPT
>
> When this run's, the rule will stay with the IP address that was grab=
bed
> from the dynamic host, and when the IP changes, the rule won't work
> anymore.

Just because of that I don't like dynamic IPs. But, are you using more
than one IP on that interface?? So, if you use more than one, there
are only one you don't know(probably), specify the rules for the ones
you know first!!
If you have only one IP address, try simply doing the rule for the
incoming interface and be happy ;)

Another way is to set your after-dhcp script to reload your firewall!!

> My question is, there's no way to make iptables to check always the h=
ost
> instead of translation the host do IP on the rule apply stage?
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html

-- Bruno M. Guedes
