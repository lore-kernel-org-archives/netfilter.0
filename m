From: Andrew Kraslavsky <andykras@hotmail.com>
Subject: 2.6 iptables memory use
Date: Fri, 12 Oct 2007 17:36:39 -0700
Message-ID: <BAY119-W35180994F4B81C1B698D56D6A10@phx.gbl>
References: <mailman.19280.1192235799.25258.netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <mailman.19280.1192235799.25258.netfilter@lists.netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


All,

Is there any documentation on 2.6.x iptables memory consumption per con=
ntrack entry and possibly per rule?

=46or the former, I realize that there may be many variables that affec=
t how much memory is used based on the actual traffic (e.g. more memory=
 might be used for FTP traffic than for telnet traffic) but what I am a=
fter is a general sense of how much memory I would need in order to ser=
vice a given number of concurrent traffic flows.

=46or example, how much memory should I expect to have available if I w=
ant to support 100,000 concurrent traffic flows forwarded through my Li=
nux router?

Similarly, for the latter, I imagine the components of a rule might alt=
er the memory consumption but, basically, how much memory does an (admi=
ttedly vaguely defined) "average" rule cost?

I am hoping some stalwart souls out there have done such an analysis an=
d can publish their results , or point me to their already available da=
ta.

=46ailing that, I'd appreciate suggestions on what manner of instrument=
ation is available for analyzing this (am I gonna have to use brute for=
ce like with an hping shell script and before and after /proc/meminfo l=
istings?).

Thanks,

- Andrew Kraslavsky

_________________________________________________________________
Climb to the top of the charts!=A0 Play Star Shuffle:=A0 the word scram=
ble challenge with star power.
http://club.live.com/star_shuffle.aspx?icid=3Dstarshuffle_wlmailtextlin=
k_oct