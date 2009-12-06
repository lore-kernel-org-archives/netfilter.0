From: Lars =?UTF-8?B?VMOkdWJlcg==?= <lars.taeuber@gmx.net>
Subject: Re: nat problem: What's so special with traffic from audibank.de?
Date: Sun, 6 Dec 2009 08:37:00 +0100
Message-ID: <20091206083700.e05700e3.lars.taeuber@gmx.net>
References: <20091203154831.ac38cf77.lars.taeuber@gmx.net>
	<87ljhj3dfs.fsf@isengard.friendlyfire.se>
	<20091203235443.9d5bb632.lars.taeuber@gmx.net>
	<4B18A8D4.901@trash.net>
	<20091205231911.bcb9fcc0.lars.taeuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091205231911.bcb9fcc0.lars.taeuber@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Sat, 5 Dec 2009 23:19:11 +0100 Lars T=C3=A4uber <lars.taeuber@gmx.ne=
t> wrote:
> No such icmp message ever reached my firewall though I tryed hard to =
record such an icmp message. My guess is that it must have been filtere=
d out on the way.

Or am I doing something wrong trying to record such a message? My comma=
nd line:
tcpdump -i ppp0 -w /tmp/icmp2.dump icmp

Lars
