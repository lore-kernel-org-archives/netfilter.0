From: Jason Opperisano <opie@817west.com>
Subject: Re: nfs ports
Date: Fri, 28 Jan 2005 13:49:27 -0500
Message-ID: <20050128184927.GA15097@bender.817west.com>
References: <200501281250.55466.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200501281250.55466.JALaramie@Loudoun-Fairfax.com>
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

On Fri, Jan 28, 2005 at 12:50:55PM -0500, Jeffrey Laramie wrote:
> Hi All,
> 
> I've been fighting the good fight trying to maintain nfs connections though my 
> firewall but I'm not winning. Every time I think I have opened the ports I 
> need nfs (portmapper?) uses a different port. My questions:
> 
> 1.  Is there a netfilter patch for tracking nfs ports similar to the one for 
> ftp?
> 
> 2.  If not, can someone point me to a list of ports used by nfs so that I can 
> open up what I need once and for all?

RPC Portmapper		TCP 111
NFSD			UDP 2049

IIRC statd, mountd, lockd, and rquotad are assigned their ports by the
the portmapper when a request comes in; however, each daemon supports a
"-p" option to nail it down to a single port--see the man page of each
for specific syntax.  lockd is actually a kernel module that's loaded
on demand, and you would need to pass the static TCP/UDP port to the
modprobe command as an option (i.e. in modprobe.conf).

check out:

http://www.faqs.org/docs/Linux-HOWTO/NFS-HOWTO.html#FIREWALLS

for more specific details.

-j

--
"This anonymous clan of slack-jawed troglodytes has cost me the
 election, and yet if I were to have them killed, I would be the one
 to go to jail. That's democracy for you.
 You are noble and poetic in defeat, sir."
        --The Simpsons


