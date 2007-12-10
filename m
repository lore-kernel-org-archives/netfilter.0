From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: interfaces in /proc/net/ip_conntrack
Date: Mon, 10 Dec 2007 20:26:14 +0100
Message-ID: <475D92D6.9070203@plouf.fr.eu.org>
References: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Oscar N a =E9crit :
> Are the interfaces saved in any way in a session or is it only ip src=
, dst
> and ports that are saved and matched against?

AFAIK, no ; only the MASQUERADE target saves the output interface for=20
the sole purpose of deleting related contrack entries when an interface=
=20
goes down or its address changes. However you may want to get a more=20
authoritative answer from a Netfilter developper.

