From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nft set load metrics
Date: Thu, 30 Sep 2021 20:12:47 +0200
Message-ID: <YVX+H2beQxcGw4sl@salvia>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
 <YVXC5cPRHyaE3VRL@salvia>
 <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
 <b943f279-73a-303e-3244-ed7fd4d4949@jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <b943f279-73a-303e-3244-ed7fd4d4949@jubileegroup.co.uk>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: Cristian Constantin <const.crist@googlemail.com>, netfilter@vger.kernel.org

On Thu, Sep 30, 2021 at 06:34:52PM +0100, G.W. Haywood wrote:
> Hi there,
> 
> On Thu, 30 Sep 2021, Cristian Constantin wrote:
> 
> > ... reading large packets over netlink sockets just to count the
> > elements in the sets does not seem very efficient.
> 
> Agreed.
> 
> It seems to me that if you need to read what you've put in the sets
> for the purposes of some facility, then you need to store it in RAM.
> 
> It doesn't make sense to me to try to use netfilter as a kind of RAM;
> as you say that will be very inefficient.

Exposing the number of set elements is feasible and it sounds useful too.
