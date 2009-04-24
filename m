From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 18:15:52 +0200
Message-ID: <49F1E5B8.7030907@freemail.hu>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C165.60907@freemail.hu> <49F1D0AE.1030606@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49F1D0AE.1030606@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal Hambourg =EDrta:
>> The problem is that both connmark and mark have a --mark option...
>
> I just wonder why a match looks for options beyond the next -m which=20
> starts a new match.
Maybe I am wrong, but as I know the iptables GIVES the options to the=20
match...
So there is no command line parsing/looking for options by the match...

I think it is happens like this:
1. iptables checks the command line for matches and loads them,
2. every match registers its "extra_opts" in an internal table, (this=20
time connmark and mark registers the same "mark" option.)
3. iptables checks the remaining command line options against the table=
=2E
4. if the option found in the table then the match will decide the=20
option's fate (with the "parse" callback function).
The first registered match having "mark" option gets called every time =
a=20
"mark" found in the command line.
And because this option is not allowed twice the match gives an error=20
message.

Swifty

