From: "G.W. Haywood" <ged@rowlescourt.co.uk>
Subject: Re: iptables - how to create a rule that expires automatically
Date: Thu, 19 Feb 2009 18:36:17 +0000 (GMT)
Message-ID: <Pine.LNX.4.58.0902191834180.6790@mail3.jubileegroup.co.uk>
References: <499D9292.902@colsmemory.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <499D9292.902@colsmemory.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Davis <col@colsmemory.co.uk>
Cc: netfilter@vger.kernel.org

Hi there,

On Thu, 19 Feb 2009, Colin Davis wrote:

> Not sure if this is possible. I wish to create a rule that once created will
> automatically expire (and be removed) after say 10 minutes.

You can do it with iptree, part of ipset.

--

73,
Ged.
