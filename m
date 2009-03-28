From: "G.W. Haywood" <ged@rowlescourt.co.uk>
Subject: Re: NAT and openvpn
Date: Sat, 28 Mar 2009 11:04:16 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0903281102060.27458@mail3.jubileegroup.co.uk>
References: <20090327211404.aa4d4e6d.g@imagination.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090327211404.aa4d4e6d.g@imagination.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G. Skillen" <g@imagination.eu.org>
Cc: netfilter@vger.kernel.org

Hi there,

On Fri, 27 Mar 2009, G. Skillen wrote:

> I have set up a vpn (openvpn) from my home computer to a remote
> server, I have several unused public IPs on the server and I would
> like to know how to transparently send all traffic from e.g
> 123.123.123.123 (one of the spare public ips) to 10.8.0.2 (the vpn
> ip of my home machine), and vice versa i guess.
>
> Basically my home ISP doesn't allow me any incoming connections so
> this would be a workaround for me to run a web/ftp server.

Would it not make more sense to run the servers on the remote machine?
The sytem you describe would be unnecessarily fragile.

--

73,
Ged.
