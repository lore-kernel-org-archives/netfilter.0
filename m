From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Direct Internet Connection For Client
Date: Tue, 13 Nov 2007 09:13:14 +0100
Message-ID: <000901c825cd$09c13700$1d43a500$@info>
References: <4739525D.70205@liqwidkrystal.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4739525D.70205@liqwidkrystal.com>
Content-Language: nl
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Tarak Ranjan' <tarak.ranjan@liqwidkrystal.com>, netfilter@vger.kernel.org

> Hi list,
>            i have installed proxy and gateway in the same system.
> How
> can  stop "Direct Connection" in web browser for internet for the
> clients(proxy). i have redirect 80 port to 8080. then also direct
> connection is happening from the clients. what sort of iptables
> rules
> i've to implement in my gateway firewall , that every time users
> should
> pass through proxy(8080). No Direct Connection........

When your clients can still connect when you redirect port 80 to 8080
then your redirection doesn't work.
This may be because packets hit another rule before the redirection. Or
maybe you are redirecting to localhost which, (last time I tried) is not
possible.

If I'm correct you've posted this question before and when I looked
through that script I didn't have much trust in it. If you really want
good advice, post your ruleset (and perhaps routing table). Otherwise,
simply blocking internet access is done like this:

$ipt -A FORWARD -s <net_lan> -p tcp --dport 80 \
  -j REJECT --reject-with tcp-reset

The actual place where you want to insert the rule depends on the script
you're currently using. This will do nothing if packets are already
accepted by a previous rule.


Grts,
Rob


