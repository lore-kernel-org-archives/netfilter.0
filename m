From: waltdnes@waltdnes.org
Subject: Re: nat and ftp
Date: Sun, 13 Apr 2003 00:02:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030413040208.GB1939@m1800>
References: <3E95E2D0.4070807@uif.gov.ar>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E95E2D0.4070807@uif.gov.ar>
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
Content-Transfer-Encoding: 7bit
To: Netfilter list <netfilter@lists.samba.org>

On Thu, Apr 10, 2003 at 06:32:00PM -0300, Ing. Jorge Escudero wrote
> I have a firewall with iptables.
> 
> I have a nat rules becouse I have one public IP.  All PC in the LAN
> can access web, smtp and pop ports.  But We have problem with de
> ftp. We can`t conect with any ftp server.
> 
> Do you now what is the problem?

  Standard ftp is a two-step process...
  1) You make an outbound connection to the ftp server.
  2) The ftp server makes an inbound connection to you.

  If you are blocking inbound connections, this will block regular ftp.
Check your iptables logs, and you should see this being blocked.  There
are two ways around the problem, without opening yourself up connections
everybody on the net...

  1) Use "passive mode" ftp.  In linux the "-p" option of the ftp
     command is used, like so
     ftp -p ftp.bad.example.com
     The basic Windows ftp client does not support this.  However, web
     browsers accessing "ftp://" URLs use passive mode.  Entering
     ftp://userid:password@ftp.bad.example.com
     in the destination address should work for "userid" with "password"
     connecting to "ftp.bad.example.com"

  2) Read http://kalamazoolinux.org/presentations/20010417/conntrack.html
     especially the part "Connection tracking and ftp", and then set up
     the ip_conntrack_ftp module.  This will allow inbound connections,
     but only from IP addresses that you are connecting to with ftp.  It
     gets uglier because you may have to do extra routing work to send
     the inbound connection to the PC making the outbound connection.
     Use passive ftp if possible.

-- 
Walter Dnes <waltdnes@waltdnes.org>
An infinite number of monkeys pounding away on keyboards will
eventually produce a report showing that Windows is more secure,
and has a lower TCO, than linux.

