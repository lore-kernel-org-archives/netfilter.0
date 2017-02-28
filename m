From: Jamal Hadi Salim <jhs-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>
Subject: ANNOUNCE: Netdev 2.1 update Feb 28
Date: Tue, 28 Feb 2017 08:24:21 -0500
Message-ID: <533a66f4-61d5-553c-0396-deb27d8bbe76@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=uuY8jbgXdEfHa0kXY9PuSlVLLO9kz0QRyOsFq3ek6pk=;
        b=GoX8QdblMsibvFtvsBbbdd6yQ0iwT683S7zjRrOe2F2XNYgC2r/GbCoo3IEyLvH5ux
         y+43k71xOUqmtKPzNZdWH3pNFdDgIca4z3LpsgJn0VCulLMLp09KRSH3iFHsd9ePpSdO
         8l7kxu11H5/+hK/SJpN7fFtF5BhRqc9QBmZ7hiMP0mSrhAksCgH8BoYb6NBQCeI/A7af
         nRjYHL38meuU27UM4EUUHEhNP1LtsMXWwFhVXAcycWoBYZ5hzen5KOIzf/kaMDaV352c
         NwE6hnuf+hXCILKEjU6MDCFxIqFBVEVoQl0SdgSg0LI8oUqdlUmRbx62OYYaG1jOwaIv
         jvrw==
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: netfilter-devel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, info-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tech-committee-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Stephen Jaworski <jaws-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>, lwn-T1hC0tSOHrs@public.gmane.org, people-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org, Brenda Butler <bjb-jkUAjuhPggJWk0Htik3J/w@public.gmane.org>

A few announcements:


1) Going forward we are going to be sending more frequent
announcements to the conference discussion/announcement list:
people-Aq7fehzYRUagpaxmtUs7hg@public.gmane.org

You can subscribe via mailman here:
https://lists.netdevconf.org/cgi-bin/mailman/listinfo/people

We urge people to subscribe to that list to get more up to date
information and conference discussions. We will still be sending
weekly summaries and announcements on the netdev list.

If you have already registered for the conference we will
very likely have registered you already.

2) Reminder: Early registration was extended to March 5.

Register early so we can plan better (and so you can save some $$).
https://onlineregistrations.ca/netdev21/

- hotel (If you can get the hotel cheaper online than conference
rates please send us email, dont book ):
https://www.netdevconf.org/2.1/hotel.html

3) Tech committee has accepted another exciting talk. This
time from Gilberto Bertin on how Cloudfare is integrating XDP in
their DDoS mitigation approach. More description:

----
This talk provides an introduction to how we are planning to integrate
XDP into our DDoS mitigation pipeline at Cloudflare, which every day
helps defend our infrastructure from thousands of different attacks,
in the range of 50-150 Gbps (with peaks of 500 Gbps).

The main points of the presentation are:
* introduction to the current architecture: from how attack traffic
is sampled, to attack detection and mitigation, to how BPF fits in
the current pipeline
* architecture changes we are expecting, and new tools required
after we move from our current network kernel bypass setup to XDP
* issues and questions regarding the current state of XDP
-----------

cheers,
jamal
