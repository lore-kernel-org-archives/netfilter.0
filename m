From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: MARK unexpectedly changed
Date: Fri, 07 Aug 2009 09:50:30 -0400
Message-ID: <1249653030.6660.4.camel@jaspav.missionsit.net.missionsit.net>
References: <1249560042.6492.52.camel@jaspav.missionsit.net.missionsit.net>
	 <4A7B7AD6.6030808@snapgear.com>
	 <1249610592.1605.10.camel@jaspav.missionsit.net.missionsit.net>
	 <1249612234.1605.14.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1249612234.1605.14.camel@jaspav.missionsit.net.missionsit.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@vger.kernel.org

On Thu, 2009-08-06 at 22:30 -0400, John A. Sullivan III wrote:
> On Thu, 2009-08-06 at 22:03 -0400, John A. Sullivan III wrote:
> > On Fri, 2009-08-07 at 10:52 +1000, Philip Craig wrote:
> > > John A. Sullivan III wrote:
> > > > What is going on? What is changing the marks? I was under the impression
> > > > marks were only set in the mangle table.  I've scoured the mangle table
> > > > and the only rule setting a mark is the one mention above which sets
> > > > 0x80000000.
> > > 
> > > It will be a bug in the OpenSWAN code when it decompresses/decrypts the
> > > packet.  It has its own skb copy code which seems to be badly out of date.
> > > I've found one bug in the decompression path where it wasn't setting
> > > the mark at all, but it seems like there is another bug somewhere too.
> > > --<snip>
> > Ah, interesting.  I was playing with the idea that it might be a integer
> > length issue since when we turned off compression (at your suggestion),
> > it didn't help.  Apparently the MARK field is an unsigned int and I was
> > wondering if the SnapGears used two byte instead of four byte ints.  I
> > had noticed that the only parts of the MARK that were being changed were
> > the two highest bytes.
> > 
> > I rewrote the ISCS code to use 0xcccc instead of 0x80000000.  The user
> > experience was markedly better but now I noticed the bottom two bytes
> > randomly (seemingly) alternated between the MARK I set and 0000.  I
> > wonder if the compression addresses on problem and the byte selection
> > another.  I'll go turn off compression and see if this lower byte
> > problem goes away.  Thanks very much - John
> I've got positive but not definitive results.  Unfortunately, the staff
> in that office is gone until Monday and all the computers are off.  I
> did find a VoIP phone on and started a phone call across the VPN as well
> as pinging and web browsing to it.  All showed consistent last two bytes
> of marks of 0xcccc after turning off compression.  I do not know if the
> type of data stream is of importance as the stream where we saw the
> alternating missing last two bytes was all TCP port 445.  I'll see if I
> can get a station fired up tomorrow and do some more testing.  Thanks -
> John
I was able to have one of the stations started.  It looks like the
combination of just using the lowest two bytes and disabling compression
has solved the problem.  I see a stead stream of MARK xxxxcccc where
xxxxis something random but at least the cccc is consistently the MARK
we are setting as opposed to alternating between cccc and 0000.  Hope
this helps track down the source of the problem - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

