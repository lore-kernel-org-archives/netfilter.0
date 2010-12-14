From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Bastion Firewall Host Redirect Question
Date: Tue, 14 Dec 2010 11:32:47 -0600
Message-ID: <20101214173247.GI23013@cardinal>
References: <000601cb9b9e$c6e81e30$54b85a90$@com> <4D07863F.3070603@abpni.co.uk> <000301cb9ba0$fe6314d0$fb293e70$@com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <000301cb9ba0$fe6314d0$fb293e70$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Please don't top-post list replies, thank you.

On Tue, Dec 14, 2010 at 09:10:04AM -0600, iic1tls wrote:
> Thanks Jonathan, but I can not modify the DNS.  I need an IPTables 
> solution.

Perhaps then talk to someone who can? dnsmasq(8) exists for such 
situations, and it is very simple to learn and to manage. Your 
sysadmin will have no problem with this.

There *is* an iptables solution, but it is suboptimal for several 
reasons. That would be to use SNAT and DNAT on the router, for HTTP 
connections to the external IP address. The frozentux iptables 
tutorial page on DNAT explains this rather well and in full detail.

Note that your httpd logs would show all internal hosts' connections 
as coming from the router. The only easy solution to this problem is 
the one you have already rejected.


Some nitpicks, from which I think you might benefit:

> > QUESTION
> > Given that clients on the internal network can freely surf the 
> > internet: if the clients select a specific web site (ie 
> > www.website.com), my goal is to configure IPTables to instead

You should not use real Internet names as examples. If you really 
want to use an example name, example.{com,net,org} is reserved, as 
well as example.X in many ccTLDs. See RFC 2606.

> > redirect the client to the internal web server.
> >
> > - If the client web browser is going to surf www.website.com, 
> > then iptables redirects the client to 149.10.10.25

149.10.0.0/16 has been allocated to nysed.gov (New York State 
Education Department). You should not use real Internet IP addresses 
that you do not control. If you meant to use an obfuscated example, 
see RFC 5737 which designates TEST-NET-[123] blocks to use.

When designing a LAN which will have NAT access to the Internet, 
there are three netblocks set aside in RFC 1918: 10/8, 172.16/12, and 
192.168/16. That's a lot of room. Even in a large enterprise, with 
some planning you will never need to use netblocks outside these 
allocated ranges.

> > - If the client web browser is going to surf any other website, 
> > then iptables permits the client to forward to the internet.
> >
> >
> Use a local DNS server and set the hostname of the site that you 
> want to re-direct to your local webserver. You can secure this 
> setup a bit more by using a proxy server (Squid + SquidGuard) to 
> prevent clients entering the IPs directly. The only thing that 
> IPTables would do is make sure that only your proxy server can 
> access the internet directly
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header
