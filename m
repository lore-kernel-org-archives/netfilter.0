From: Lars =?UTF-8?B?VMOkdWJlcg==?= <lars.taeuber@gmx.net>
Subject: Re: nat problem: What's so special with traffic from audibank.de?
Date: Thu, 3 Dec 2009 23:54:43 +0100
Message-ID: <20091203235443.9d5bb632.lars.taeuber@gmx.net>
References: <20091203154831.ac38cf77.lars.taeuber@gmx.net>
	<87ljhj3dfs.fsf@isengard.friendlyfire.se>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87ljhj3dfs.fsf@isengard.friendlyfire.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi Mattias,

On Thu, 03 Dec 2009 23:22:47 +0100 Mattias R=C3=B6nnblom <hofors@lysato=
r.liu.se> wrote:
> I'll do some guessing here. It looks like the first large (MSS-sized)
> segment is lost. I've seen this happening in networks where Path MTU
> Discovery didn't work (because ICMP Fragmentation Needed was
> filtered).

you're absolutely right.
I could solve my problem with either allow any icmp traffic from outsid=
e to any destination or use the clamp-to-pmtu in the server settings fo=
r the firewall. This is a switch in fwbuilder.

Why is such an ICMP message not RELATED in the meaning of
   echo "-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT"
with a _related_ tcp connection?

Thanks a lot anyway!!
Lars
