From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: IPTables connection mark rule stops working
Date: Wed, 09 Dec 2015 09:13:15 +0100
Message-ID: <5667E29B.3000003@plouf.fr.eu.org>
References: <CAGEc96=kjP8yi_3WyFv1xKcqzoLvrpZLNDKPsxc9vnmtoD1pYQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAGEc96=kjP8yi_3WyFv1xKcqzoLvrpZLNDKPsxc9vnmtoD1pYQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Justin Michael Schwartzbeck <justinmschw@gmail.com>
Cc: netfilter@vger.kernel.org

Justin Michael Schwartzbeck a =E9crit :
>=20
> Now I know the traffic is being marked in the kernel
> module because I have a log message that goes to syslog from the
> kernel module indicating this. But the traffic does not get DNATed.
> When I look at "iptables -t nat -vL" I can see that the count for tha=
t
> rule is not going up. Eventually I just power cycle the VM and
> everything goes back to normal. I am wondering how I can troubleshoot
> this. What might cause this problem to occur? My first instinct is
> maybe some table is being filled up (perhaps connection tracking?) bu=
t
> when I check syslog I don't see any useful information. I just need
> some idea of where to look. What other things can I check?

Check the packet conntrack state in mangle/PREROUTING. A packet won't
enter the nat chains if  it has a state other than NEW.
