From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: ftp server issue, trying to DL 1.2.7a
Date: Fri, 6 Sep 2002 00:37:32 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000a01c2552c$d39e63d0$0401000a@win2k>
References: <NEENJAPFEAIEMGMNIGFLAEKPCCAA.rwideman@austin.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEENJAPFEAIEMGMNIGFLAEKPCCAA.rwideman@austin.rr.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Now when i go to the /usr/src/iptables-1.2.7a and run make i 
> get a crap load
> of errors....
> this is what i got from the putty screen:
> 
Ok, I had the same problem.
Do a make menuconfig or make xconfig or whatever.
Configure nothing, just exit with saving the .config
Now go ahead and do ./runme pending etc.
It should work now.


Rob

