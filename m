From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: opening port for SSH
Date: Thu, 8 Dec 2005 08:23:10 -0600
Message-ID: <200512080823.10443.rob0@gmx.co.uk>
References: <dn9dag$je3$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dn9dag$je3$1@sea.gmane.org>
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

On Thursday 2005-December-08 07:43, Edwin Kapauni wrote:
> Now, I need some help teaching me how to open ports for SSH and VoIP.
> That shouldn't be too difficult, right?

SSH, simple. VOIP, depends on what protocol[s] you mean, but no, in 
general it should not be difficult.

iptables -A INPUT -p tcp --dport ssh -j ACCEPT

Ensure that your users have strong passwords and/or disable password 
authentication altogether, because many worms/bots (I think run by and 
for phishers) are probing the Internet for openings in TCP port 22 and 
attempting to login using common usernames and passwords.

For any well-configured host these attacks are nothing more than an 
annoyance, but you might wish to do some kind of blocking to limit the 
login attempts, if for no other reason than to reduce the noise in 
logging. There have been "-m recent" and "-m limit" ideas posted here 
to do that. If you have the "recent" match extension, that is probably 
better overall, but the "limit" approach is good enough for me.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

