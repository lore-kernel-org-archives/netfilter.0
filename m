From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: iptables for port forwarding
Date: Tue, 30 Nov 2004 13:05:54 +0000
Message-ID: <200411301305.54595.gdh@acentral.co.uk>
References: <20041130005154.6978.qmail@web11204.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041130005154.6978.qmail@web11204.mail.yahoo.com>
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

On Tuesday 30 November 2004 00:51, Nick wrote:
> Hi,
>

> I have a server which I can only connect to via port 80, due to a
> firewall.  I want to connect to VNC on the server, and connect to it
> via a VNC client my laptop.  VNC server only wants to run on port 5900.
>  I'm not running an HTTP server on 80, so no prob there.  I want to
> forward packets  coming into the server on port 80 to the VNC on 5900.


Take a step back and work from first principles... can you telnet to port 80 
on the server from your laptop?

You should see something like this...

gdh:~# telnet 1.2.3.4 80
Trying 1.2.3.4...
Connected to myhost.mydomain.com
Escape character is '^]'.
RFB 003.003

If you don't see that 'RFB' message then something else is wrong.. if you do 
see it, then can I ask how you're telling the VNC client to use port 80?

You can't simply tell it to connect to "1.2.3.4:80" because this will try to 
connect to port 5980...

Cheers,
Gavin.

