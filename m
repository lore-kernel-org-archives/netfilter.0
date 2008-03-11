From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: safely apply new rulesets: iptables-apply
Date: Tue, 11 Mar 2008 19:54:11 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803111947120.18745@fbirervta.pbzchgretzou.qr>
References: <20080304231606.GA16376@piper.oerlikon.madduck.net>
 <Pine.LNX.4.64.0803091733060.26142@fbirervta.pbzchgretzou.qr>
 <20080310110209.GB17757@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080310110209.GB17757@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: martin f krafft <madduck@madduck.net>
Cc: netfilter discussion list <netfilter@vger.kernel.org>


On Mar 10 2008 12:02, martin f krafft wrote:
>also sprach Jan Engelhardt <jengelh@computergmbh.de> [2008.03.09.1745 =
+0100]:
>> It needs a minor tweak in that the timeout needs to be started
>> before you output anything to the terminal, just in case the
>> terminal blocks.
>
>I don't really see a way to do this trivially.

echo "Applying new rules...";
iptables-restore <new.txt;
if [ "$?" -ne 0 ]; then
	echo "Dude, that failed horribly. (Old rules still intact.)";
	exit 1;
fi;

echo "Also try starting a new connection to the "\
"machine to verify that NEW connections are accepted "\
"besides ESTABLISHED.  Do the rules work? (y/n) " &

read -t 10 x;
if [ "$x" !=3D "y" ]; then
        iptables-restore <old.txt;
fi;


>> On a related note, you cannot trap signal 0:
>> 	trap "rm -f $TMPFILE" 0 1 2 3 4 5 6 7 8 10 11 12 13 14 15
>
>Yes, you can. Trapping 0 means at-exit.

Oh, then probably use "EXIT" instead of "0" :-)

>> >Could this script possibly make it into the iptables distribution
>> >tarball? I am flexible about the licence and all...
>>=20
>> The idea gets my approval.
>
>Is there anything else I need to do?
>
A bit of CodingStyle perhaps, i.e.=C2=A0tabs for logical indent,
and of course a patch with the updated script.

