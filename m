From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: MARK unexpectedly changed
Date: Thu, 06 Aug 2009 22:03:12 -0400
Message-ID: <1249610592.1605.10.camel@jaspav.missionsit.net.missionsit.net>
References: <1249560042.6492.52.camel@jaspav.missionsit.net.missionsit.net>
	 <4A7B7AD6.6030808@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A7B7AD6.6030808@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@vger.kernel.org

On Fri, 2009-08-07 at 10:52 +1000, Philip Craig wrote:
> John A. Sullivan III wrote:
> > What is going on? What is changing the marks? I was under the impression
> > marks were only set in the mangle table.  I've scoured the mangle table
> > and the only rule setting a mark is the one mention above which sets
> > 0x80000000.
> 
> It will be a bug in the OpenSWAN code when it decompresses/decrypts the
> packet.  It has its own skb copy code which seems to be badly out of date.
> I've found one bug in the decompression path where it wasn't setting
> the mark at all, but it seems like there is another bug somewhere too.
> --<snip>
Ah, interesting.  I was playing with the idea that it might be a integer
length issue since when we turned off compression (at your suggestion),
it didn't help.  Apparently the MARK field is an unsigned int and I was
wondering if the SnapGears used two byte instead of four byte ints.  I
had noticed that the only parts of the MARK that were being changed were
the two highest bytes.

I rewrote the ISCS code to use 0xcccc instead of 0x80000000.  The user
experience was markedly better but now I noticed the bottom two bytes
randomly (seemingly) alternated between the MARK I set and 0000.  I
wonder if the compression addresses on problem and the byte selection
another.  I'll go turn off compression and see if this lower byte
problem goes away.  Thanks very much - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

