From: Wim Ceulemans <wim.ceulemans@able.be>
Subject: Re: GRE/PPTP Pass-through problems
Date: Thu, 04 Sep 2003 14:14:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F572CC1.4010907@able.be>
References: <8EC0756327A4994298EFD721CFC7355B01B14C@jfm2.jacobson.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1062677694-13682-38"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <8EC0756327A4994298EFD721CFC7355B01B14C@jfm2.jacobson.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jamie Vuyk <jvuyk@jacobson.co.uk>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format...

------------=_1062677694-13682-38
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

I had the same problems with GRE not passing through to a server behind 
the firewall.
I then used kernel 2.4.22 and the latest pom snapshot 
(patch-o-matic-20030831) with iptables 1.2.8
and gre passed through.

However, after testing I notice now that although PPTP connections to a 
win2000 server behind the
firewall work, that the connection is not reliable. After 3 to 4 minutes 
the connection is closed for
some unknown reason and people have to re-establish the connection.

Anyone experiencing this problem also?

Regards
Wim

Jamie Vuyk wrote:

>Hello,
>
>I hope this will be a simple post that can lay to rest what a lot of
>people appear to be having trouble with.  I have read a massive amount
>of posts all over the web and there seems to be much confusion in this
>simple matter.
>
> 
>
>Basically there are two aspects to my problems:
>
>1)       Does the standard kernel (RH 2.4.18) need to be patched in any
>way in order to PASS THROUGH proto 47 (GRE) to an internal server?  Im
>running a simply iptables firewall which I want to pass an external PPTP
>VPN connection through to an internal server.  It is most important to
>note that the firewall is masquerading all connections which I think is
>where the confusion lies.  As I understand if I want Linux to terminate
>the PPTP VPN I need a patch, if I want it to pass through I don't.
>However I am having a lot of trouble getting this to work and I would
>like to know if Im on the right track.
>
> 
>
>2)     Given that I don't have to patch anything and it all should "just
>work"... I have setup my firewall to allow and forward the 1723 to my
>internal server.  This appears to work but the external Win2k box gets
>stuck on "verifying username and password".  This eventually times out
>with "disconnected".  A simple test was to Telnet to port 1723.
>Although there is no response as such from the server (expected) it does
>connect with a blank screen both internally and externally suggesting
>the forwarding is working ok.  At what point does the 1723 data exchange
>end and the "payload" as such start on the GRE protocol?  Is GRE
>involved in the 'verifying username and password' stage or is that still
>TCP on 1723?  Just so you are aware I have the rest of the firewall
>fully operational with various port forwards etc that work fine.  It is
>essentially only the VPN's that are giving me grief.
>
> 
>
>If you could get some basic info I maybe able to troubleshoot this and
>get it operational.
>
>Cheers in advance for you help.
>
>J
>
> 
>
> 
>
> 
>
> 
>
>
>
>  
>


-- 
Wim Ceulemans
R&D Engineer

Secure Internet Communication with aXs Guard

Able NV
Leuvensesteenweg 282 - B-3190 Boortmeerbeek - Belgium
Phone: + 32 15 50.44.00 - Fax: + 32 15 50.44.09
E-mail: wim.ceulemans@able.be



--
Security check on this e-mail has been done by aXs GUARD
(http://www.axsguard.com)


------------=_1062677694-13682-38--

