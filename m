From: richardo@start-global.com
Subject: Re: droping in forward/postrouting
Date: Thu, 29 Jul 2004 16:54:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF314C1F3E.9AD1008B-ON80256EE0.005745C8@start-global.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Askar Ali Khan <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org


hi Askar,

This is a filtering rule, and so, in my opinion, this should be in the
filter table, ie FORWARD.

Regards,
Richard.

Richard Oatridge
Head of IT, Start-global Ltd
http://www.start-global.com
tel :  +44 1564 779297
email : richardo@start-global.com


|--------+----------------------------------->
|        |          Askar Ali Khan           |
|        |          <askarali@gmail.com>     |
|        |          Sent by:                 |
|        |          netfilter-admin@lists.net|
|        |          filter.org               |
|        |                                   |
|        |                                   |
|        |          29/07/2004 11:19         |
|        |                                   |
|--------+----------------------------------->
  >-------------------------------------------------------------------------------------------------------------------------|
  |                                                                                                                         |
  |       To:     netfilter <netfilter@lists.netfilter.org>                                                                 |
  |       cc:                                                                                                               |
  |       Subject:     droping in forward/postrouting                                                                       |
  >-------------------------------------------------------------------------------------------------------------------------|




hi all

Im afraid i am again with a very simple/stupid question :), even
though things not clear to me yet.

im droping/blocking certain sites mainly gator sites on my
router/firewall to LAN users, using slackware kernel 2.4.26.

im doing this with the below rule
$iptables -t nat -A POSTROUTING -s 0/0 -d  212.4.208.105 -j DROP
   This is working fine, however im kinda confuse whether this is the
proper table/chain for accomplished this or may I do it with FORWARD
chain like ...

  $iptables -A FORWARD -s 0/0 -d 212.4.208.105 -p tcp -j DROP

which approach is recommended ?
1)nat/POSTROUTING
OR
2) FORWARD

thanks in advance

regards
Askar






