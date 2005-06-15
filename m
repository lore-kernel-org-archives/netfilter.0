From: Jason Opperisano <opie@817west.com>
Subject: Re: Unzustellbar: [SPAM] - Re: Why does this connection stop being
	tr acked? - Sending mail server found on relays.ordb.org (fwd)
Date: Wed, 15 Jun 2005 14:02:35 -0400
Message-ID: <20050615180235.GA24360@bender.817west.com>
References: <Pine.LNX.4.60.0506151315040.25078@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.60.0506151315040.25078@darkstar.sysinfo.com>
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

On Wed, Jun 15, 2005 at 01:23:52PM -0400, R. DuFresne wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> will the folks responsible for maintaining the list please remove these 
> clueless ones from the list;
> 
> http://ordb.org/lookup/?host=sysinfo.com
> 
> Lookup
> This host is not listed in ORDB as an open mail relay
> 
> Main database status for sysinfo.com (70.61.80.19)
> Look up this host in non-ORDB RBL's (May take a while to load)
> The host sysinfo.com is not in the main database

i've been much happier since adding:

  :0
  * ^From: Systemadministrator <postmaster@echtzeit.com>
  /dev/null

to my .procmailrc

-j

--
"Meg: Dad, if I don't get my driver's license, I'll never have any
 boyfriends, I'll never get married and I'll have to adopt a kid
 like Rosie O'Donnell.
 Peter: Meg... are you implying that Rosie O'Donnell can't drive?"
        --Family Guy

