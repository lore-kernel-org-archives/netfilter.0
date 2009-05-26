From: "George B." <georgeb@gmail.com>
Subject: Re: Policy NAT, pools etc. Is netfilter for me?
Date: Mon, 25 May 2009 22:41:56 -0700
Message-ID: <b65cae940905252241u6aa2ddbcv70bde5b679b7fa7e@mail.gmail.com>
References: <b65cae940905252105r15910de6s99ec2538dc23066c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=SvK5tUdhD02RzGaQFK5dEm/Om8ldtoHVuXOxA8iGo34=;
        b=XuPRTNqTQphvfj2coI5Jj9tyhfkl4ZKq3OnUO8QAqD0tQYaetPO04XIIzNDuKdvMCt
         zMa3wdoFlyE0F0ymokh2TnCcOoVPwVS91CDeN/Pz3mYrJ/c2LuKPleYs/VIyJ+VQs6dO
         UvB6Mto/ukASTw77TgbnlhLYX4F37wHyg0AVo=
In-Reply-To: <b65cae940905252105r15910de6s99ec2538dc23066c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

It appears, from further reading, that SNAT will do what I need (I was
thinking MASQUERADE as these are all outbound connections where the
machines connect to a remote host, pull a bunch of data, and
disconnect.  No inbound connections are supported or desired through
this NAT device).

Now my question has changed and narrowed in scope.  Will my machine
respond to arp for the SNAT addresses if they are in the config or
must I physically add the addresses to an interface?

By the way, the document here was a great help in my understanding of S=
NAT:

http://www.web-articles.info/e/a/title/SNAT-with-iptables/


On Mon, May 25, 2009 at 9:05 PM, George B. <georgeb@gmail.com> wrote:
> It has been a while since I have used Linux NAT (2.4 kernels) and
> things have evolved considerably since then.
> I am investigating the possibility of using Linux to provide NAT
> functionality in a network and want to know if it
> can meet my requirements. =A0Here is what I need to be able to do:
>
> 1. Several groups of internal machines must be NATed to different
> outside IP addresses on the same physical interface.
> These groups of =A0internal servers are of varying numbers so they do=
n't
> rest on even network boundaries. =A0For example:
>
> 172.16.1.1, 172.16.1.6, and 172.16.1.34 get NATed to 1.1.1.1
> 172.16.1.3, 172.16.2.4 =A0and 172.16.2.73 get NATed to 1.1.1.2
>
> All others get NATed to 1.1.1.3
>
> 2. =A0Some of these groups of internal machines will have more than 6=
4K
> outbound connections and will require more than
> one external IP address. =A0To rewrite the example above:
>
> 172.16.1.1, 172.16.1.6, and 172.16.1.34 get NATed to 1.1.1.1 or 1.1.1=
=2E2
> 172.16.1.3, 172.16.2.4 =A0and 172.16.2.73 get NATed to 1.1.1.3 or 1.1=
=2E1.4
>
> All other traffic NATed to 1.1.1.5 or 1.1.1.6
>
> There is only one "inside" and one "outside" interface.
> There could be in excess of a Gig of traffic.
>
> The application is that of a application service provider. =A0The
> internal addresses map to machines running applications for various
> clients.
> These applications must map to outside addresses that associate to
> that client. =A0That is a hard requirement placed on this
> traffic from an outside organization where much of the traffic is
> destined. So one pool of internal machines for client A must map
> to an outside IP address pool associated with client A and used only
> for traffic from the client A applications.
>
> So my question before I risk a lot of frustration is if it is even
> feasible to go down the Linux/Netfilter route. =A0If so, any hints fo=
r
> boosting performance would be appreciated as well (e.g. it looks like
> there might be a role here for ipset). =A0And if this can be done,
> must the outside addresses be contiguous or can they be assigned as
> needed as traffic grows?
>
> Thanks in advance for your time and consideration,
>
> George
>
