From: "System Support" <support@microtechniques.com>
Subject: Selecting -m recent --seconds values
Date: Mon, 14 Dec 2009 12:46:46 -0500
Message-ID: <4B267A06.23470.4604E47@support.microtechniques.com>
References: <4B1EA562.25180.3396C0B@support.microtechniques.com>
Reply-To: support@MicroTechniques.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=MicroTechniques.com;
	s=MT_email; t=1260812807;
	bh=YXo/+9D+Fheu2nYZW9tuBcSBY6k62OqDtdRQr4YmM9Y=;
	h=From:To:Date:MIME-Version:Subject:Reply-to:Message-ID:In-reply-to:
	 References:Content-type:Content-transfer-encoding:
	 Content-description;
	b=MPVe0sU0qc+Ph361SgHXkWojrKnJTXWuWeBufmzy7F0a14y4AaHkBviO6nwDaH7pj
	 fgjTQCtM7IXEUQDpZIbg8zszN1bPMMIC2j//2m7qkI8BdgAYjv1hZljV3HtynFEh9i
	 3q2dndTNPhuCJiwiG2rzerEsPBVFgbdynmN3MnU0=
In-reply-to: <4B1EA562.25180.3396C0B@support.microtechniques.com>
Content-description: Mail message body
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

The following is probably old hat for members of this list, but I did not find any similar comments 
in the archives.

I recently updated a system that has been in place since 2000.  It had a number of very large 
static chains used to block suspicious addresses.  The chains were updated several times a day 
and populated with addresses gleaned from various system, snort, and HTTP logs.  

I now have a number of -m recent and ipset rules to classify and block sites attempting scans or 
attacks.  The -seconds and -hits values for the -m recent rules and the timeout values for the 
ipset tables were either taken from various examples, or just arbitrary values such as 60 
seconds, or 172800 seconds (2 days).  To hold all of the active entries, I had expanded the sizes 
of the -m recent lists from the default of 100.  My ipset tables were for obvious and egregious 
attackers (multiple sign-on attempts to port 22 for example) and typically had 10,000 active 
entries (new entries being added about 3/minute).  I wanted to select better values based on my 
actual usage.

I used the packet times recorded in /proc/net/xt_recent/ to calculate the delay between the hits 
and plotted the results.  I also plotted the number of hits, and last_seen times.   I also created 
some temporary -m recent lists to track the matches on the ipset tables.

I found that 90% of the identifiable scans from the same address had delays of less than 10 
seconds between packets and 99% of the scans did not continue beyond 3620 seconds.  By 
adjusting the -seconds, --hits and timeout values to reflect the above, I reduced the active 
entries in my -m recent lists to less than 150 and the active entries in my ipset tables to less than 
200.

Removing the large chains from the 2000 configuration had a measurable impact on 
performance, and reflection seems to indicate that probably 97% of the entries in either 
configuration were of no value in blocking attacks and just wasted resources. 

...don

support (at) microtechniques.com

