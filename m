From: =?ISO-8859-2?Q?Micha=B3_Sewera?= <michal.sewera@gmail.com>
Subject: nf_conntrack -> table full, dropping packet; problem with counting 
	sessions
Date: Thu, 27 Aug 2009 13:13:45 +0200
Message-ID: <875a14c20908270413y3849eabdq3f1465288d024943@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=wcWY4qjuxqkmAVpCCPEOInB35M7E3bTZfFo/WkFhyw0=;
        b=wRGqx2Wd8LbWWznJ1CvmPAa30zCR0+1MsGXm+YBGlIxfaxViJyqhn5WfbUzzp89yBY
         OYtd1u1LkQvyEXnf345BfVoOu5rG52wm4wnN9WVLQVRtwoCUI/+NtEBhwrzWHT64+kid
         FW985hJH59g/dbRAY5TAyANGM3+VNVGpjuF/M=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have a strange problem with nf_conntrack:

If I will try to generate small amount of TCP sessions, (i.e. 10
sessions), then after closing this sessions (on the client side, by
closing application) output from:
wc /proc/net/ip_conntrack
and
cat /proc/sys/net/nf_conntrack_count

is the same -> so I can see the same amount of sessions tracked by nf_conntrack.


But during testing the system with i.e. 100 new TCP sessions/sec
(terminated to the same server), after closing the sessions output
from wc /proc/net/ip_conntrack if correct (near 0), but all this
sessions seems to be staying in cat /proc/sys/net/nf_conntrack_count.

After exceeding the condition nf_conntrack_count < nf_conntrack_max,
of course I am getting table full, dropping packet info in log.

Some workaround is to set max value to very huge number i.e.
1000000000, but after some times eventually I will get the same
problem and reebot will be required.

So, if anyone from experts here will know anything about the cause of
this problem I will be very gratefull,

thanks for any support

m
