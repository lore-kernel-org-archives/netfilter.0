From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: TFTP conntrack research.
Date: Fri, 27 Jun 2014 11:55:17 +0200
Message-ID: <53AD3F85.8010105@plouf.fr.eu.org>
References: <CALHVu_7PJtvZJxOEZKQSYFJth5zwizecHntiu2oT_ox0J5oUJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALHVu_7PJtvZJxOEZKQSYFJth5zwizecHntiu2oT_ox0J5oUJQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "megacrabogoahell ." <megakrabo@gmail.com>
Cc: netfilter@vger.kernel.org

Hello,

megacrabogoahell . a =E9crit :
> I'm researching the stateful FW. I've got an interesing situation of
> how does the TFTP passes FW rules. It's clear to me how does
> nf_conntrack_tftp works. But could you please answer me, how many
> sessions does the TFTP transfer requiers?
> I mean, when the client asks server for a transfer with WRQ or RRQ,
> the src ip/port and dst ip/port are not same when tftp reply came bac=
k
> to the client. Does this packet belongs to the session of 1st
> packet(RQ creates NEW session, and then it goes as ESTABLISHED?), or
> it belongs to the new session.

The data tranfer creates a RELATED connection.
