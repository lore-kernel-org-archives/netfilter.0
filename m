From: "Patrick Ahler" <patrick@vikus.com>
Subject: RE: FTP
Date: Mon, 10 Mar 2003 15:42:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFGECCCAAA.patrick@vikus.com>
References: <200303071328.04424.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303071328.04424.Alistair@nerdnet.ca>
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
To: netfilter EMAIL <netfilter@lists.netfilter.org>

I figured out what the problem was with my FTP server... it needed a port
range of 2095-2300 open for some reason. I figured this out by narrowing
down the ports that it would work on. What a pain! oh well

-----Original Message-----
From: Alistair Tonner [mailto:Alistair@nerdnet.ca]
Sent: Friday, March 07, 2003 1:28 PM
To: Patrick Ahler; netfilter EMAIL
Subject: Re: FTP



	Do you have ip_nat_ftp and ip_conntrack_ftp
	loaded as modules or built into the kernel?

Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS

     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

On March 7, 2003 11:35 am, Patrick Ahler wrote:
> Can't get my BulletProof FTP server to work through the firewall. I opened
> ports 20,21 and 5100-5200 (configured for passive ftp), still doesn't
work.
> I can log onto the server but it won't display the directory unless I take
> the firewall down. Any suggestions?

--




