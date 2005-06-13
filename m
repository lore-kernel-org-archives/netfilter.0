From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: SSH Brute force attacks
Date: Mon, 13 Jun 2005 11:27:08 -0500
Message-ID: <200506131127.08380.rob0@gmx.co.uk>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<1117739926.10257.22.camel@debianbox>
	<42AD9A9E.7070603@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42AD9A9E.7070603@riverviewtech.net>
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

On Monday 13 June 2005 09:39, Taylor, Grant wrote:
> I'm not sure if /etc/hosts.deny will prevent packets from entering
> IPTables or not as I thought that the file was read by user space
> daemons as a list of IPs to never talk to, not necissarly to the IP
> table to deny access to.

No, yes. The user space daemon is tcpd(8), but other services might be 
linked against the library too, so they would read the hosts_access(5) 
files without consulting tcpd.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

