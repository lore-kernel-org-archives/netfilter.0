From: Andrew Beverley <andy@andybev.com>
Subject: Re: newbie question on netfilter-conntrack
Date: Sun, 20 Jun 2010 12:56:51 +0100
Message-ID: <1277035011.1476.100.camel@andybev>
References: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1277035022; bh=LgNT+diAkBsq2QuqTFRplMHB/SBTNCCEnJXWm
	PHljLA=; h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:Message-ID:Mime-Version:Content-Transfer-Encoding; b=L6bsHk90
	GniLD9nnrGpCBVRJD//l7CbEgIwMhLpUe79pXkaBTyx3f/6ytiolJwtCMhM3qLkFom8
	DpnGj2pFiRDD27oclysfo/g7UKxag+WsrvIcKqDVpf83Tc2vLJxqiC+PYMhBwfiF0it
	bor5LeuzZ7zclevNReyDZypZfKNno=
In-Reply-To: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pete Kay <petedao@gmail.com>
Cc: netfilter@vger.kernel.org

Pete,

> I am trying to set up a rule such that any UDP packet coming from a
> specific IP:port will be redirected to another IP:port.  Could someone
> please give me an example how this can be done?

You'll need something like:

iptables -t nat -A PREROUTING -p udp --sport 1234 --source 1.2.3.4 \
	-j DNAT --to-destination 4.3.2.1:4321

If you do 'man iptables' you will see details of all these options. You
may also find that this simple kernel routing diagram helps:

http://www.docum.org/docum.org/kptd/

> Also, I would like to know if it is possible to monitor the proxying
> of the UDP packet to obtain information such as jitter and packet
> lost.  How can I do that?

Not sure about that I'm afraid; maybe somebody else can help.

Andy


