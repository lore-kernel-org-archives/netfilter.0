From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: 64bit MARK
Date: Thu, 29 Oct 2009 21:21:04 -0400
Message-ID: <1256865664.6547.83.camel@jaspav.missionsit.net.missionsit.net>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
	 <1256848782.6547.74.camel@jaspav.missionsit.net.missionsit.net>
	 <4AEA1851.80400@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AEA1851.80400@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: fdelawarde@wirelessmundi.com, netfilter@vger.kernel.org

On Thu, 2009-10-29 at 23:33 +0100, Patrick McHardy wrote:
> John A. Sullivan III wrote:
> > Just as an aside, we've had problems using the top 16 bits of the 32 bit
> > marks.  The OpenSWAN implementation on SnapGear devices changes the top
> > 16 bits all on its own with two separate bugs - one with compression
> > enabled and another regardless of compression- John
> 
> You should talk to the *swan people, their kernel implementation
> is seriously fscked.
I believe the excellent folks at SnapGear are doing just that.  They
were the ones with the skills to find it.  I was only able to point out
the symptoms - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

