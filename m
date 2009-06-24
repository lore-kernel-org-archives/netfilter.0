From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Question about nat filtering with FORWARD
Date: Wed, 24 Jun 2009 12:54:48 +0200
Message-ID: <001d01c9f4ba$316a3c30$943eb490$@info>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>    <33be4bb30906240322x1934b045g5e74e16f012ffcd7@mail.gmail.com> <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> > You need to allow the return traffic also. This can be done with
> > connection tracking and the state match.
> >
> > /Oskar

> Forgive me, but i'm a bit confused in a gray area right now.
> With the PREROUTING it wasn't needed to add that and it worked, for
> this
> new scenario, i tried:
> 
> #allow all (??)
> iptables -t filter -A FORWARD -j ALLOW
> #allow TCP PORT 22
> iptables -t filter -A FORWARD -p tcp --dport 22 -j ACCEPT # ssh
> #block everything else
> iptables -t filter -A FORWARD -j DROP

I think you want this:

$ipt -P FORWARD DROP
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$ipt -A FORWARD -m state --state NEW -p tcp --dport 22 -j ACCEPT

- You don't need to specify "-t filter". It's the default table.
- All packets that are not explicitly allowed will be dropped in the
FORWARD chain (policy = DROP).
- Any reply packet in an established connection will be accepted using
"--state RELATED,ESTABLISHED". Actually, you don't need RELATED here,
but it doesn't hurt either and you do need it if you want to forward FTP
and such protocols.
- The first packet in a connection for port 22/tcp will be accepted.
(Any subsequent packets will be accepted by the previous rule.)

For more info, you might want to read (parts of) Oskar Andreasson's
IPTables Tutorial at:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html


-- Rob


