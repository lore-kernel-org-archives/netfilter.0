From: Michael <mutk@iprimus.com.au>
Subject: Re: Samba blocked?
Date: Wed, 27 Nov 2002 11:14:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE41C6F.2050704@iprimus.com.au>
References: <000d01c2958f$d3fadbd0$1e00a8c0@yamatto>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dan Egli <dan@shortcircuit.dyndns.org>, netfilter@lists.netfilter.org

Dan Egli wrote:

>Ok. I'm a fair bit confused here. I'm trying to setup a IPtables filter set
>that will block certain ports and allow others. It seems to work perfectly
>for anything other than Samba. If I try:
>
>smbclient //myserver/shared1, it fails to connect. But using the IP in place
>of it:
>smbclient //192.168.0.2/shared1 works just fine. I am specifically allowing
>NetBIOS-ns, NetBIOS-ssn, and NetBIOS-dgm. Still no go. What's wrong?
>
>  
>


Probably nothing wrong with the iptables rules. Might be something wrong 
with the name lookups for smbclient though.
Have a look at man pages for smbclient, in particular the name resolve 
order (-R) command switch. Also have a look at man page for smb.conf, 
 as the method for name look ups is defined there (The order too)

The default order is lmhosts, host, wins, bcast for name look ups.  
I beleive that for bcast name lookups to work you need to allow bcast 
traffic too. ie you need to allow 192.168.0.255 port 137.

If you don't want that, a quick fix is to try adding the 'myserver'  
name and IP to /etc/hosts ..

Cheers,
Michael




