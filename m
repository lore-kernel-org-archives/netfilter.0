From: "Rune" <runner@mail.tele.dk>
Subject: Re: Passive FTP through IPTables DNAT
Date: Thu, 6 Mar 2003 19:55:21 +0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001001c403b3$79629670$0b00a8c0@runner>
References: <4D613EBFB75BD6118A5B00508BEEC62C0111CB53@JESS>
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
Date: Sat, 6 Mar 2004 20:44:43 +0100
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Humphrey <jhumphrey@codemasters.com>, netfilter@lists.netfilter.org

All  you need is having a forward rule for the ftp-data connection which
uses the
port below the ftp port e.g:
    ftp at port 21
    ftp-data at port 20

Rune Petersen
----- Original Message -----
From: "Jonathan Humphrey" <jhumphrey@codemasters.com>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, March 06, 2003 7:20 PM
Subject: Passive FTP through IPTables DNAT


> Does anyone have a working script for this?
>
> I'm attempting to hide a FTP server behind a Linux IPTables firewall using
> dnat but having problems
>
> thx!
>
>
> **********************************************************************
> This email and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed. If you have received this email in error please notify
> the system manager.
>
> This footnote also confirms that this email message has been swept by
> MIMEsweeper for the presence of computer viruses.
>
> **********************************************************************
>
>


