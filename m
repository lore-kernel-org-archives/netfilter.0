From: Jamal Hadi Salim <jhs-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>
Subject: ANNOUNCE: New talk accepted on TCP algorithms performance on wireless
 LTE networks
Date: Sat, 18 Mar 2017 18:22:22 -0400
Message-ID: <3cafd981-9a0f-9dc4-66a3-351952fae808@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=tW+9bmyWxqU3iBzXPmVEllgpjBdSdAvl6WFWhYAKB5Y=;
        b=fgTqU3RBnt+jAiTZSxkcMelwXflWe67m2+xzG4gnBw0OS0ld4Mz6rOk4gmCZqTR9UW
         tg7yZKEv1180vGi4kMZnht4ANeJDaFcJEaPXNXEtB0gUFZ7dyaMbZM75/o1NKDgnnbAe
         T1dUFCVzZ9Y1ljtP2P1uT/RFV+zcNk24h4sdjGBjMxsj4Yi8OxVNzzQkysMMFdR7Sk0N
         wjga75V3sQgLC9mOoGJjhU8paGzVqoDfrtX1DSrHkkrcwmWCe53Sb1rzRV6WqYOpUhL8
         Swj8Vuu0fdRcFSifCv4HJOhgAyQgZ+jjx4hQeSqq+5IsMjuGb1z22Vf1mjocKK/+kZdn
         D3QQ==
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org
Cc: tech-committee-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org, netfilter-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Brenda Butler <bjb-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>, Stephen Jaworski <jaws-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>, netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heri Muhero <hmuhero-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


Someone complained in the last posting that I was "spamming" them.
If a list admin feels these announcements of a community event as
spam - please unicast me and I will remove you off future
announcements.

The tech committee would like to announce a new accepted talk.

Jae Won Chung and Feng Li (at Verizon) have done a lot of work on
analyzing the effect of the different Linux TCP congestion control
algorithms on LTE wireless networks while driving on a fast
highway/road. In this talk they compare CUBIC to BBR.

A little bit more details:

----
Unlike IEEE802.11 (wifi) and traditional 3G wireless links,  LTE
networks have high link variability and large end user mobility.
There still exists a huge gap in understanding how TCP congestion
control algorithms variants perform under such conditions.
Mobile carriers often waste their efforts to improve throughput by
fine tuning parameters of TCP CUBIC although CUBIC often fails to ramp
up rapidly to congestion avoidance needs over LTE links.

To have a better understanding of TCP performance over LTE networks, we
conduct a comprehensive measurement study to compare CUBIC with its
latest rival - BBR over a world leading tier-one mobile network in high
speed driving condition.
To our best knowledge, there is no measurement effort to compare
performance of different TCP flavors over LTE networks on highway. In
addition to our measurement contribution, our in-depth measurement
result also conclude that:
1) CUBIC with Hybrid slow start leads to a low radio resource
utilization;
2) BBR yields higher throughputs even when SINR is lower and/or hand-off
happens;
3) BBR's bottle-neck link bandwidth estimation works well for various
conditions (including hand-offs); and
4)BBR is a promising TCP Congestion Control candidate for
performance enhancement proxies over mobile networks.

----

cheers,
jamal
