From: Ben Lentz <BLentz@channing-bete.com>
Subject: Re: conntrack accounting
Date: Fri, 04 Jan 2008 16:35:32 -0500
Message-ID: <477EA6A4.2000306@channing-bete.com>
References: <477704CB.8030809@channing-bete.com> <477D0553.4010906@netfilter.org> <477D257B.4060901@channing-bete.com> <477DA70E.5080301@channing-bete.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090603060200020802040200"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=channing-bete.com;
	s=smtp; t=1199482527; bh=232DatRX6OGuid+Aofayi1ghyHCjwsbiI+0y3El3wY
	o=; h=DomainKey-Signature:Message-ID:Date:From:User-Agent:
	 MIME-Version:To:CC:Subject:References:In-Reply-To:Content-Type:
	 X-OriginalArrivalTime:X-Antivirus; b=ubedETLeYHuZXPqgh9F/isfFggrqM
	dg3ib8TzF+n+cCpHo/al0wgO9KBk2WgZSGd1CWYNkWrQMtN15BX1WZx6w==
In-Reply-To: <477DA70E.5080301@channing-bete.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------090603060200020802040200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> Syslog statistics mode still crashes... but only if I *disable* 
> LogFile, too.
>
I've fixed the crash when stats LogFile is off and stats Syslog is on, 
patch attached.

--------------090603060200020802040200
Content-Type: text/x-patch;
 name="conntrack-tools_stats-syslog.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="conntrack-tools_stats-syslog.patch"

--- src/log.c.orig	2008-01-04 16:26:50.000000000 -0500
+++ src/log.c	2008-01-04 16:30:26.000000000 -0500
@@ -99,13 +99,14 @@
 	time_t t;
 	char buf[1024];
 	char *tmp;
+		
+	t = time(NULL);
+	ctime_r(&t, buf);
+	tmp = buf + strlen(buf);
+	buf[strlen(buf)-1]='\t';
+	nfct_snprintf(buf+strlen(buf), 1024-strlen(buf), ct, 0, 0, 0);
 
 	if (fd) {
-		t = time(NULL);
-		ctime_r(&t, buf);
-		tmp = buf + strlen(buf);
-		buf[strlen(buf)-1]='\t';
-		nfct_snprintf(buf+strlen(buf), 1024-strlen(buf), ct, 0, 0, 0);
 		fprintf(fd, "%s\n", buf);
 		fflush(fd);
 	}

--------------090603060200020802040200--
