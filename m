From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: Re: ssh tunnels and iptables
Date: Sun, 29 Jan 2017 19:54:37 -0500
Message-ID: <20170129195437.2533b527@playground>
References: <CAGU6BDkW2C3JvsryWFzZT02MUZfOA6woZjB9NZqnQnJf_7ViQA@mail.gmail.com>
        <159eb2fe630.27c2.011a82e1253448b704705c1b47ed667a@pkfnet.co.za>
        <CAGU6BD=-W-YwLXbYgNgCOwd-nO1RGK=0=GOEUauK00u+rEiQDQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU v0U0se92003213
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1485737680; i=@wpi.edu;
        bh=Jmi9jTLStyhwwmp6mnK1JmfKsdq9FbP/EbGis6Qel8c=;
        h=Date:From:Cc:Subject:In-Reply-To:References;
        b=foHr41oBMIJjV3XnxzafKUhyM6eDe6rZO9chw9juZQHL7BGSNYbbRblfCtDRmTswl
         QsRUNRl0PKNXTdeokVYDev9IGfBxbbpJaA1mD1jzSJP0ubg9xKLbpqEZtrLuM530Lv
         JDHqnCaWwR2h1YgrZZSZIp5ABt98mgo1pWhEIG1g=
In-Reply-To: <CAGU6BD=-W-YwLXbYgNgCOwd-nO1RGK=0=GOEUauK00u+rEiQDQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: netfilter@vger.kernel.org

On Mon, 30 Jan 2017 06:03:08 +0530
deva seetharam <deva.seetharam@gmail.com> wrote:

> sorry, it does not make sense because it is a reverse tunnel. that is,
> the server that is running the firewall  gets the connection requests
> on that port (2222). i see that the port opens (can see it using nmap)
> up as soon as the tunnel is up. however, IPTABLES does not have that
> port open. that is what is confusing.

That's because the 'reverse' tunnel flows across the encrypted SSH connection. The server's firewall never sees the traffic; it only sees packets flowing across the existing connection.

When a program on the server connects to localhost:2222 (or to remotehost.com:2222), SSH itself listens on that socket and communicates with the SSH instance running on the laptop to connect to the host:port specified in the '-R' option. The traffic for that connection flows across (is tunneled through) the encrypted SSH connection.
