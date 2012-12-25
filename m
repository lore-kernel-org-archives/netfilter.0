From: Richard A Nelson <cowboy@cavein.org>
Subject: conntrack-tools rpc helper
Date: Mon, 24 Dec 2012 21:23:04 -0500
Message-ID: <50D90E08.40100@cavein.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavein.org; s=2008;
	t=1356402185; bh=Je6duJZSZGIpTOF1DMTUWS67l++LFQG+weOWsgVh9wY=;
	l=1913;
	h=Message-ID:Date:From:MIME-Version:To:Subject:Content-Type:
	 Content-Transfer-Encoding;
	b=IZNX8YHlCaDKAxLU9sFZDqzZpA+goiNrMIlAbwoHD4nH34o9bRUxQKmZc//fyk4NP
	 uWthFx3db5TbrxQj66FVcsYjcfUMzViWXG9qNAQOS2KNP8CSiGINcITnX0IMKcsk6e
	 7ovidGJdhr3cy1ecnFfcKkgX3FfqetvrCjQeEQT8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm having a heck of a time getting this all going ;)

Debian Sid/Experimental
Linux 3.7.1
conntrack toolchain downloded yesterday (stable, not git)

I'm following the doc on conntrack-tools to enable RPC tracking (for NFS 
support), and wind up with this state:
# nfct helper list
{
     .name = rpc,
     .queuenum = 0,
     .l3protonum = 2,
     .l4protonum = 6,
     .priv_data_len = 16,
     .status = disabled,
};
{
     .name = rpc,
     .queuenum = 0,
     .l3protonum = 2,
     .l4protonum = 17,
     .priv_data_len = 16,
     .status = disabled,
};

Why disabled?  conntrackd startup went fine, the nfct helper add went fine, what 
am I missing ?

And, of course, it doesn't work ;)

I may be royally screwed anyway - due to the bizarre situation I'm trying to 
support...
LAN:  192.168/16 - mix of Linux, Windows, and AIX clients
Gateway: 192.168.1.205 (Linux Gateway/Firewall)
OpenConnect VPN to work (CISCO ASA client) - IBM
IBM network - GSA NFS Servers

The sticky point for a statefull firewall seems to be twofold:
1) AIX (at least 5.3) still does RPC mount lookups - even if NFSV4 and port=2049 
are specified
     Which, it seems, is totally needless

2) The GSA infrastructure is layered, and littered with High Availability & load 
balancing - but seems to break
     extant rules...
- My LAN client does a RPC GETPORT (MOUNT -V3) to snjgsa.sanjose.ibm.com
- My firewall NATs the request
- The GSA mainline server delegates (forwards, whatever) to a disk sever
- The disk server (snjxgsasd2.sanjose.ibm.com) replies the RCP GETPORT request

At this point, we have two streams, with matching ports, but differing IP sets, 
both in UNREPLIED status.

I am not at all sure, that even were I to get the RPC helper going, and it 
issues and EXPECT, that things will work, but am willing to hack to make it so :)


-- 
Rick Nelson
Life'll kill ya                         -- Warren Zevon
Then you'll be dead                     -- Life'll kill ya

