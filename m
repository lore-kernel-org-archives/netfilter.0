From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 22:20:01 -0400
Message-ID: <20060627022001.GA12553@minastirith.hsd1.md.comcast.net>
References: <200606260702.57739.tyche@ica.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200606260702.57739.tyche@ica.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Why let arbitrary IP addresses connect to your SSH daemon?  There have
been remotely exploitable vulnerabilities discovered in various SSH
implementations, and these vulnerabilities generally have nothing to
do with trying to brute force passwords.

You might be interested in "fwknop" which implements a passive
authorization scheme called "Single Packet Authorization" in conjunction
with Netfilter configured in a default-drop stance:

http://www.cipherdyne.org/fwknop/

Here is a HOWTO on setting up fwknop to use GnuPG keys:

http://www.cipherdyne.org/fwknop/docs/gpghowto.html

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F


On Jun 26, 2006, tyche wrote:

> over the last few days, my server has been attacked. i would 
> like to limit remote logon attempts by address so that if 
> someone tries to logon from an ip address and fails 3 times, 
> my computer will ignore repeated attempts from that ip 
> address. any idea how to make a rule for this?
> 
> tia
> 
> tyche
> -- 
> Win9x
> 
> A 32 bit extention
> to a 16 bit patch
> for a 8 bit operating system
> on a 4 bit machine
> by a 2 bit company
> that cant stand 1 bit of competition
>  
> -----------------------------------------------------------------------------
>     This Email is powered by ICA Canada OnLine
>          http://www.icacanadaonline.com
> 

