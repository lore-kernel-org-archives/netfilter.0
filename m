From: alucard@kanux.com
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 15:35:49 -0400 (VET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3506.200.44.170.105.1084304149.squirrel@200.44.170.105>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105> 
    <200405102115.14089.Antony@Soft-Solutions.co.uk> 
    <1292.192.168.74.154.1084226963.squirrel@192.168.74.154> 
    <1084227992.14224.5.camel@localhost> 
    <1166.200.44.170.105.1084283379.squirrel@200.44.170.105> 
    <1084288178.15768.10.camel@localhost> 
    <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
    <1084295076.15641.54.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084295076.15641.54.camel@localhost>
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


John A. Sullivan III wrote:

> OK - so let me summarize again just to make sure I understand you.  The
> 2nd Webserver at 10.73.219.77 is used by internal resources and cannot
> change its IP address.  You want to make it available to remote users in
> other offices via the Internet but the only Internet access you have is
> through the one Linux box.

Yep, exactly
>
> If you do not want to expose the 2nd Webserver to the world but only
> make it available to other offices, you may wish to consider an IPSec
> VPN between the other offices and the Linux box although we'd need to
> know a little more about how your ISP is getting you to the Internet and
> how your other offices access the Internet.

This company has a cisco router -to which I have no access to it- and that
redirects the public IP address that we use for webmail services. This 2nd
webserver should be seen by a lot of people and using a VPN would make
things worse


>
> You will still have the routing problem.  You can create a second
> network without changing the IP address.  It will depend on how the
> internal users access the 2nd Webserver.  If the access is also through
> the Linux box, then you can split the 10.73.219.x network.  Assuming it
> is using a 24 bit mask, you could create the network 10.73.219.0/25 and
> 10.73.219.128/25.  Leave the NIC with 10.73.219.156 on the latter
> network, add a second NIC with an address on the former network and
> place the second Webserver on the former network - note there is no need
> to change the IP address of the 2nd Webserver or the DNS entry - just
> the subnet mask.

We have a 255.255.252.0 network already because there are more than 500
computers with IP addresses in this company. All the users access the 2nd
webserver directly to it thru it's IP address. Changing the subnet mask
wouldn't quit the access? I dont understand what you are trying to explain
here.

John, thanx a lot for this pal...
Juan

