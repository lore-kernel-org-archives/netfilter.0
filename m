From: "Peter Marshall" <peter.marshall@caris.com>
Subject: Re: bad ftp speeds through nat
Date: Mon, 22 Nov 2004 14:39:36 -0400
Message-ID: <0e7801c4d0c2$9dc80220$49caa8c0@caris.priv>
References: <0e2d01c4d092$b8c13950$49caa8c0@caris.priv><20041122150411.GA30543@bender.817west.com>
	<0e7301c4d0c1$74ba04b0$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Peter Marshall <peter.marshall@caris.com>, Jason Opperisano <opie@817west.com>, netfilter <netfilter@lists.netfilter.org>

It looks like it is slow with any type of file transfer through the firewall
.. not just ftp ...


----- Original Message ----- 
From: "Peter Marshall" <peter.marshall@caris.com>
To: "Jason Opperisano" <opie@817west.com>; "netfilter"
<netfilter@lists.netfilter.org>
Sent: Monday, November 22, 2004 2:31 PM
Subject: Re: bad ftp speeds through nat


I have not tried it with the firewall off ... yet ... however, transfer
speeds between boxes in the DMZ are fast .... I transefered a 40 MB file in
3 sec ....

Peter
----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: "netfilter" <netfilter@lists.netfilter.org>
Sent: Monday, November 22, 2004 11:04 AM
Subject: Re: bad ftp speeds through nat


On Mon, Nov 22, 2004 at 08:56:44AM -0400, Peter Marshall wrote:
> I am not sure what is causing this ... I have an ftp server in my DMZ.  I
am
> getting horrible ftp speeds ... only 200 - 300 KB/s  ... I have 10/100
cards
> on both the firewall and the ftp server and they are connected with one
100
> Mb switch. If anyone has any ideas as to why this is happening I would
> appreciate the wisdom.

have you base-lined the environment?  does FTP through the firewall with
no rules loaded and just IP forwarding enabled allow for significantly
higher throughput?  how about a machine locally in the DMZ directly to
the FTP server, what's that throughput look like?

-j

--
"It's not easy to juggle a pregnant wife and a troubled child, but
 somehow I managed to fit in eight hours of TV a day."
        --The Simpsons



