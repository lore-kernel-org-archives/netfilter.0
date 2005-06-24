From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall feature recommendation
Date: Fri, 24 Jun 2005 09:53:06 -0500
Message-ID: <200506240953.06487.rob0@gmx.co.uk>
References: <fad9d48405062403562537f546@mail.gmail.com>
	<200506240932.08470.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0506241635090.30646@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0506241635090.30646@yvahk01.tjqt.qr>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 24 June 2005 09:37, Jan Engelhardt wrote:
> >Most if not all of the listed domains were personally researched by
> > me. That's the weakness of this, though: it's impossible to keep
> > ahead of the spammers and other ratware peddlers in this arms race.
>
> Just look into the named and/or squid logs and see what users (or
> programs acting on their behalf) request.

Yes, that would be the methodology, but it should be done in a 
controlled environment. Some, and now perhaps most, of our squid 
traffic is legitimate.

What is needed is a network "clean room". A fresh Windows install with 
monitored outbound access. Using Outhouse Distress, activate a known 
virus email, watch what it does. Using Internet Exploder, visit a known 
malicious IIS site, and see the results.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

