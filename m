From: =?ISO-8859-1?Q?Jorge_D=E1vila?= <jorgedavilalopez@gmail.com>
Subject: Re: Rate-Limiting (tc/CBQ) & Load Balancing Question
Date: Mon, 13 Jul 2009 14:47:27 -0600
Message-ID: <bf0e93a30907131347t59c233f9h27917dcb56e4296c@mail.gmail.com>
References: <ba0063890907131239m1a883373yc31ad66241a5e1c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=DjdHUZ4JXskimINHKr/DpMrmDe79iOkKLCCPHSY+Bks=;
        b=EZEvXSJL/gIAGHbl70mPztbp3C8V3GT3D67FwE8NB0tRuKbR1JQezj+zWpQYeZKYJE
         DSQun9LEuD9HtN/JezWOTiGJZ10mZ7vM9FirTkUuq6GE8XJ7nH8uqF8U9Fef2X99EYSI
         KHavWkO5LWd9vy0j4PeUN5sKkRy/gOnfK2eQo=
In-Reply-To: <ba0063890907131239m1a883373yc31ad66241a5e1c8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Bradley <cbradley@westsider.com>
Cc: netfilter@vger.kernel.org

May I will write something wrong here.

My understanding is that each interface have a queue to manage the
traffic going through [..] but the magic maybe can be done filtering
in the raw table of iptables. The raw table is the first place the
packets hits entering to the box but the raw table is used for mark
packets that will not be tracked by the conntrack system.

While reading your post, I'm thinking about the question about the
first chicken or egg. But if for you does not matter in what
interfaces the packets are marked, a bridge+firewall can be a
solution.

Be gentle if I'm completely wrong.

Jorge D=E1vila.



On Mon, Jul 13, 2009 at 1:39 PM, Chris Bradley<cbradley@westsider.com> =
wrote:
> Hello, I am working on a project in which I am trying to both load
> balance upstream Internet connections as well as rate-limit individua=
l
> users of those connection to asymmetrical upstream/downstream rates.
>
> I have worked with iptables/tc/cbq for some time and the rate-limitin=
g
> is being accomplished by creating qdiscs on the inside and outside
> interfaces (for simplicities sake). In the mangle table iptables is
> then marking packets with the corresponding cbq ID. With only a singl=
e
> upstream and downstream interface this works very well and I can
> rate-limit 500-1000 users quite easily.
>
> The challenge I have not been able to overcome, or find much
> information on how to is have multiple load-balanced (weighted)
> upstream connections and still rate-limit individual users across
> those connections. I have tried creating qdiscs for each interface,
> however being that the CBQ IDs are related to interfaces there is not
> a reliable mechanism to ensure all packets of a specific user are
> marked and thus rate-limited appropriately.
>
> Any help or suggestions would be appreciated. Ultimately I would like
> a way to mark and track packets independent of the upstream (or
> downstream) routing interface. I am open to any/all suggestions. I am
> currently working with the latest Debian stable (latest stable kernel=
,
> iptables, etc.) and I have complete control over the OS and
> configuration so if there is a different way to skin this cat please
> let me know. (Sorry to all the cat lovers out there.)
>
> Cheers,
>
> Chris
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Jorge Isaac D=E1vila L=F3pez
+505 8430 5462
jorgedavilalopez@gmail.com
---
Esta tierra es Linux. En las noches calladas puede escucharse a las
m=E1quinas Windows re-inici=E1ndose...
