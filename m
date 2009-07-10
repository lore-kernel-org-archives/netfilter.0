From: Karel Rericha <karel@maxtel.cz>
Subject: Re: tc and virtual interfaces
Date: Fri, 10 Jul 2009 16:06:31 +0200
Message-ID: <5b19ed110907100706ifafdba2p77b4873345260fb4@mail.gmail.com>
References: <4A572D8C.7010703@duet.it> <4A573D34.7080100@plouf.fr.eu.org>
	 <4A5747FC.1040509@duet.it>
	 <bf0e93a30907100656o7388cbdbw984f3e90786033d5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bf0e93a30907100656o7388cbdbw984f3e90786033d5@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

2009/7/10 Jorge D=E1vila <jorgedavilalopez@gmail.com>:
> The traffic shapping must be applied to the physical interface ( eth0
> in this case).

It is not exactly correct. AFAIK you can bind traffic shaping to
bridged interface, imq or  ifb. Maybe even more I am not aware of.

But I dont know if it will help in this case.

Karel
