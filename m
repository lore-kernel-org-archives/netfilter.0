From: tobi <tobster@brain-force.ch>
Subject: Run a userspace script upon rule matching?
Date: Thu, 08 Mar 2012 13:45:56 +0100
Message-ID: <4F58AA04.4010805@brain-force.ch>
Reply-To: tobster@brain-force.ch
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=brain-force.ch;
	s=2011; t=1331210755;
	bh=MgY2kHhTq4L9Dc22PYYls54J+x4pt5+3Eawz4+xXCyM=;
	h=Message-ID:Date:From:Reply-To:MIME-Version:To:Subject:
	 Content-Type:Content-Transfer-Encoding;
	b=UYGnSvyCfTt+UsaDv/Oe3edpJJBxc6jcBlqfqOZLv9rQ8LqsLKLp8geZr5P3pL/9Z
	 OlHa/lHIP52Z0SBXGLPAbuVHqvPHEY5HiIaYMusYaGCfsKXJp8cCAA5hsC//FwIrQ6
	 nT8y17icJQjw8D+lEhAlO+FP6QRJc4IjhH/W36oE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list

my first post here so I hope I do not ask something which is so clear
that I doesn't have to be asked ;-)
As mentioned in subject I want to run an external script upon matching
of a certain rule. but I have no idea how or even if it's possible at
all. I could achieve the "same" by loging those rules to the syslog and
regularly running a cron script that checks for those loglines. But it
would be much easier if I could tell netfilter to call an external
script upon matching.

thanks for any hints and tipps

tobi
