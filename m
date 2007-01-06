From: Michael Rash <mbr@cipherdyne.org>
Subject: Re: Looking for automation scripts
Date: Sat, 06 Jan 2007 10:27:40 -0500
Message-ID: <20070106152740.GA13781@minastirith>
References: <005701c73150$49f64710$0300a8c0@bandwidthco.com>
	<Pine.LNX.4.61.0701061534460.22558@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <Pine.LNX.4.61.0701061534460.22558@yvahk01.tjqt.qr>
Content-disposition: inline
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

On Jan 06, 2007, Jan Engelhardt wrote:

> >
> >I've seen a few references here to scripts that monitor attacks and
> >dynamically update iptables rules to knock down the attacks. Can anyone
> >provide some good research starting points or sample scripts that they use?
> 
> denyhosts.sf.net?

While denyhosts is a good concept, I question whether it provides a real
security benefit.  If a new remotely exploitable vulnerability is
discovered in OpenSSH (or other ssh implementation) it will most likely
have nothing to do with trying to brute force passwords.  Doing a quick
search through http://www.securityfocus.com/bid/ turns up recent SSH
security issues (not necessarily highly critical, but it is only a
matter of time).

A better strategy is to use iptables to maintain a default-drop stance
against all attempts to connect to the SSH daemon, but allow access via
Single Packet Authorization.  This way people can't even tell that you
are running an SSH server at all.  An nmap scan is completely useless
against this, and it doesn't matter even if someone has a zero-day
attack for your SSH daemon.  Here is an SPA implementation:

http://www.cipherdyne.org/fwknop/

(Disclaimer: I developed fwknop)

Here is a howto for using GPG keys with fwknop:

http://www.cipherdyne.org/fwknop/docs/gpghowto.html

--
Michael Rash
http://www.cipherdyne.org/
Key fingerprint = 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

