From: Jason Opperisano <opie@817west.com>
Subject: Re: tftp clients not working on ip masquerading
Date: Fri, 05 Nov 2004 09:14:37 -0500
Message-ID: <1099664077.3229.10.camel@hubcap.ljm.dom>
References: <58373.202.138.166.130.1099649776.squirrel@202.138.166.130>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <58373.202.138.166.130.1099649776.squirrel@202.138.166.130>
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

On Fri, 2004-11-05 at 05:16, Wesley Jay Deypalan wrote:
> hi,
> 
> I have installed TFTP server and working good. Later I found out that it
> work only on public ip address what I mean is the TFTP Server has a public
> ip address and the client also has a public ip address. But when the
> client is being ip masquerading it will not connect with the server the
> error message in the server is WRQ from x.x.x.x filename 43434.doc
>                          tftpd: read: Connection refused
> the client is being masqueraded from a linux os.The masquerading used is
> from tldp.org - rc.firewall-2.4-stronger. What is wrong with my setup?
> 
> TIA,
> 
> 
> Wesley

have you:

  modprobe ip_conntrack_tftp
  modprobe ip_nat_tftp

-j

--
"Well, I'm not calling you a liar, but... I can't think of a way to
 finish that sentence."
	--The Simpsons


