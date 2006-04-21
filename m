From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: packets loging
Date: Fri, 21 Apr 2006 13:15:46 +0200 (CEST)
Message-ID: <52345.193.173.147.3.1145618146.squirrel@webmail.sterenborg.info>
References: <002d01c66445$01dd28f0$0e01050a@CyberAdmin><4447F34C.6030500@yahoo.com.mx><000d01c6650d$99afe6e0$0e01050a@CyberAdmin><60102.193.173.147.3.1145604135.squirrel@webmail.sterenborg.info><002801c66516$40ff0ae0$0e01050a@CyberAdmin>
	<51316.193.173.147.3.1145606258.squirrel@webmail.sterenborg.info>
	<004401c66520$f6286880$0e01050a@CyberAdmin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004401c66520$f6286880$0e01050a@CyberAdmin>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, April 21, 2006 10:52, robee wrote:
> disk space is not a problem but disk usage increased 10 times during lo=
ging
> dstport 80 only. it is a gateway for large network.

If it's so large, maybe you can setup a log-server and do remote logging.
(Have you also looked at ULOG ?) To me, logging *all* packets to dport 80
seems to be overkill but that's up to you.

> When i use limit module is it possible that loging system miss some
> significant connection?

Yes, you *will* miss packets when limiting LOG (as you have a busy networ=
k).
I think the most important packet is the first one in a connection so you=
 can
also choose to just log the NEW packets :

$ipt -A INPUT -m state --state NEW -p tcp --dport 80 \
  -j LOG --log-level <...> --log-prefix "<...>"


Gr,
Rob



